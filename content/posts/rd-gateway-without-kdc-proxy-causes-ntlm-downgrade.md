+++
title = "RD Gateway Without KDC Proxy Causes NTLM Downgrade"
slug = "rd-gateway-without-kdc-proxy-causes-ntlm-downgrade"
date = 2025-04-26
description = "Learn why mstsc requires the RD Gateway to act as a KDC proxy for Kerberos authentication, how this undocumented behavior causes silent NTLM downgrades, and how to fix it by enabling the KDC proxy service."

[taxonomies]
tags = ["Windows", "Kerberos", "RDP", "CTO"]

[extra]
banner = "/images/banners/rd-gateway-without-kdc-proxy-causes-ntlm-downgrade.png"
+++

If you have an RD Gateway deployed, did you know that unless a KDC proxy is also deployed on the same host and port, you have a guaranteed NTLM downgrade for the RD Gateway connection from mstsc, despite having a KDC line-of-sight or setting KDCProxyName in the .RDP file?

![RD Gateway KDC Proxy service unavailable](/images/posts/rdg-kdc-proxy-service-unavailable.png)

It turns out that mstsc always sets the RD Gateway host as the KDC proxy to use for the Kerberos authentication made over HTTP with the RD Gateway. If there's no KDC proxy on the RD Gateway host, it downgrades to NTLM. Oopsie!

## What's a KDC Proxy Anyway?

Kerberos requires out-of-band communication with the Kerberos Key Distribution Center (KDC) to obtain tickets. In Active Directory, the KDC is on the domain controller. If you're on the same network as the domain controller, you have a KDC line-of-sight, and Kerberos works.

If you're outside of the local network, such as when connecting through an RD Gateway, you most likely don't have a KDC line-of-sight. The [KDC Proxy is a simple protocol](https://learn.microsoft.com/en-us/openspecs/windows_protocols/MS-KKDCP/5bcebb8d-b747-4ee5-9453-428aec1c5c38) that relays Kerberos requests and responses over HTTPS, providing the required KDC line-of-sight for Kerberos to work.

## RD Gateway authentication

The [RD Gateway protocol](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-tsgu/0007d661-a86d-4e8f-89f7-7f77f8824188) is really a tunneling protocol, or an application-specific "VPN". Simply put, the RDP client (mstsc) authenticates against the RD Gateway using Windows authentication over HTTP, and then requests to open a tunnel for the connection to the destination RDP server.

Once the tunnel is established, RDP authentication happens independently, in the same way it would during a direct connection, often using the same Active Directory credentials used for the RD Gateway authentication.

## RDP Authentication

Kerberos in RDP NLA is not affected by the baked-in assumption that the RD Gateway must be a KDC proxy. This means that if you have direct KDC line-of-sight, or if you set the **KDCProxyName** .RDP file option to point to a different KDC proxy, Kerberos will work for RDP NLA even if it fails for the RD Gateway.

The key problem for RD Gateway authentication is that it only expects the KDC line-of-sight to be provided by the KDC proxy, and won't use anything else, including a direct KDC line-of-sight usable for RDP NLA.

## How To Fix It

Unless someone at Microsoft wakes up from their slumber, I think we can rule out a fix in mstsc. After all, this undocumented behavior has most likely been present from the beginning, and nobody complained, right?

In the meantime, on the RD Gateway host, run this PowerShell code snippet elevated to enable the [KDC proxy service](https://syfuhs.net/kdc-proxy-for-remote-access):

```PowerShell
netsh http add urlacl url=https://+:443/KdcProxy user="NT authority\Network Service"
$KpsSvcSettingsReg = "HKLM:\SYSTEM\CurrentControlSet\Services\KPSSVC\Settings"
New-ItemProperty -Path $KpsSvcSettingsReg -Name "HttpsClientAuth" -Type DWORD -Value 0 -Force
New-ItemProperty -Path $KpsSvcSettingsReg -Name "DisallowUnprotectedPasswordAuth" -Type DWORD -Value 0 -Force
New-ItemProperty -Path $KpsSvcSettingsReg -Name "HttpsUrlGroup" -Type MultiString -Value "+`:443" -Force
Set-Service -Name KPSSVC -StartupType Automatic
Start-Service -Name KPSSVC
```

If you work at Microsoft and want to fix this undocumented behavior, take a look at `mstscax!CHttpIoRequestWinHttp::EnableNativeAuthentication`:

![RD Gateway KDC Proxy forced in mstsc](/images/posts/rdg-kdc-proxy-forced-mstsc-windbg.png)

KDC proxying settings are set using [SetCredentialsAttribute](https://learn.microsoft.com/en-us/windows/win32/api/sspi/nf-sspi-setcredentialsattributesw) with the `SECPKG_CRED_ATTR_KDC_PROXY_SETTINGS` attribute and [SecPkgCredentials_KdcProxySettings structure](https://learn.microsoft.com/en-us/windows/win32/api/sspi/ns-sspi-secpkgcredentials_kdcproxysettingsw).

The **Flags** member of the SecPkgCredentials_KdcProxySettings structure accepts the value `KDC_PROXY_SETTINGS_FLAGS_FORCEPROXY` (0x1), even if the documentation fails to mention it. This is what's causing the KDC proxy to be *forced* rather than simply *attempted*. That's right, all it takes is a one-liner fix, and you'll be my hero!

## KDCProxyName File Option

Speaking of one-liner bug fixes in mstsc, there's another important undocumented behavior you should probably know about: the [KDCProxyName .RDP file option](https://learn.microsoft.com/en-us/azure/virtual-desktop/key-distribution-center-proxy) is only used by mstsc when using an RD Gateway transport.

In other words, mstsc assumes the RD Gateway is a KDC proxy for the RD Gateway authentication, but it will also ignore an explicit KDC proxy passed through KDCProxyName if you're not using an RD Gateway. This means you can't set a KDC proxy using a .RDP file for direct or "regular" RDP connections. Again, if you work at Microsoft, take a look at `mstscax!CTscSslFilter::InitializeKDCProxyClient`:

![RD Gateway KDCProxyName ignored](/images/posts/rdg-kdc-proxy-kdcproxyname-ignored.png)

If you could remove that "if" statement, then the function would not return early when not using an RD Gateway transport, and accept KDC proxying settings from the .RDP file for all connection transport types. Since my multiple attempts at getting this bug fixed over the years didn't bear fruit, I ended up API hooking a fix myself in [MsRdpEx](https://github.com/Devolutions/MsRdpEx):

![RD Gateway KDCProxyName MsRdpEx](/images/posts/rdg-kdc-proxy-kdcproxyname-msrdpex.png)

If you want mstsc without the bugs, then [install MsRdpEx today](https://github.com/Devolutions/MsRdpEx), and you'll be set! Just remember to launch mstscex.exe instead of mstsc.exe for the MsRdpEx API hooking to work.

## Closing Thoughts

If you are deploying an RD Gateway and want to enforce Kerberos authentication, it is important to understand that mstsc expects the RD Gateway to act as a KDC proxy. Without a KDC proxy service running on the gateway, Kerberos authentication will silently fail and fall back to NTLM, even if direct line-of-sight to a domain controller exists.

Until this behavior is formally documented or addressed, it is recommended to configure KDC proxy support as part of any RD Gateway deployment that requires Kerberos authentication.
