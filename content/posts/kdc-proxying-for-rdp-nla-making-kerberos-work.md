+++
title = "KDC Proxying for RDP NLA: Making Kerberos Work"
slug = "kdc-proxying-for-rdp-nla-making-kerberos-work"
date = 2025-02-25
description = ""

[taxonomies]
tags = ["Windows", "RDP", "Kerberos", "CTO"]

[extra]
banner = "/images/banners/kdc-proxying-for-rdp-nla-making-kerberos-work.png"
+++

Imagine you're in charge of hardening Active Directory at work, and decide to add all of your IT administrators into the Protected Users group. Within minutes, they start getting one of the following error messages when trying to RDP to Windows:

 * A user account restriction (for example, a time-of-day restriction) is preventing you from logging on.
 * An authentication error has occured, the function requested is not supported. This could be due to CredSSP encryption oracle remediation.
 * The remote computer that you are trying to connect to requires Network Level Authentication (NLA), but your Windows domain controller cannot be contacted.

Once you've verified that they are connecting using the fully-qualified domain name (FQDN) of the target computer and the user principal name (UPN) username format,you realize the problem won't go away easily and revert the change. Congratulations, you've discovered RDP NLA downgrades to NTLM, but you have no idea *why*.

## KDC Proxying

Kerberos, unlike NTLM, requires a line-of-sight with the Kerberos KDC for out-of-band traffic separate from the Kerberos exchange happening in RDP NLA. The same is true for all protocols using Windows authentication (RDP, LDAP, WinRM, MSRPC, etc). Simply put, if you cannot locate and connect to the Kerberos KDC on one of your Active Directory domain controllers, then Kerberos is not possible. This is where KDC proxying comes into play: it proxies Kerberos requests over HTTPS to the domain controller, providing the needed KDC line-of-sight for Kerberos to work.

## Bugs, bugs everywhere

 * The KDCProxyName .RDP file option is ignored unless the connection is using an RD Gateway or Azure Virtual Desktop
 * The client assumes a KDC proxy is deployed on the RD Gateway, and fails to use a direct KDC line-of-sight
 * The RDGIsKDCProxy .RDP file option is only used for the tunneled RDP connection, not the RD Gateway connection
 * KDCProxyName uses a custom, error-prone format and it is limited to a maximum of 255 characters.

```cpp
HRESULT CTscSslFilter::InitializeKDCProxyClient(CTscSslFilter* this)
{
    if (!RDGTransportIsUsed) {
        // If an RD Gateway transport is NOT used (regular RDP connection),
        // exit early and ignore KDC proxying settings entirely (!).
        return S_OK;
    }

    // Only RD Gateway and Azure Virtual Desktop connections reach this point
    if (KDCProxyName) {
        if (RDGIsKDCProxy) {
            // If the "RDGIsKDCProxy" .RDP file option is set to true,
            // use the RD Gateway hostname as the KDC proxy.
            SetKDCProxy(GatewayHostname);
        } else {
            // Otherwise, use the "KDCProxyName" .RDP file option value as the KDC proxy.
            SetKDCProxy(KDCProxyName);
        }   
    }

    return S_OK;
}
```

```powershell
function Convert-KdcProxyUrlToName {
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [ValidatePattern('^https:\/\/[a-zA-Z0-9.-]+(:\d+)?(\/.*)?$')]
        [string] $KdcProxyUrl
    )

    # KDCProxyURL:  https://<host>[:<port>][/path]
    # KDCProxyName: <host>:[:<port>][:<path>]

    $hostname = $KdcProxyUrl.Substring(8)
    $pathIndex = $hostname.IndexOf('/')

    if ($pathIndex -ge 0) {
        $path = $hostname.Substring($pathIndex + 1)
        $hostname = $hostname.Substring(0, $pathIndex)
        $KdcProxyName = "$hostname`:$path"
    } else {
        $KdcProxyName = $hostname
    }

    return $KdcProxyName
}
```


```powershell
@("https://kdc.contoso.com",
"https://kdc.contoso.com:443",
"https://kdc.contoso.com:443/KdcProxy",
"https://kdc.contoso.com:8181/Kerberos/Proxy/Service"
) | % { Convert-KdcProxyUrlToName $_ }
```

| KDC Proxy URL                                | KDC Proxy Name                           |
|----------------------------------------------|------------------------------------------|
| https://kdc.contoso.com                      | kdc.contoso.com                          |
| https://kdc.contoso.com:443                  | kdc.contoso.com:443                      |
| https://kdc.contoso.com:443/KdcProxy         | kdc.contoso.com:443:KdcProxy             |
| https://kdc.contoso.com:8181/Kerberos/Proxy  | kdc.contoso.com:8181:Kerberos/Proxy      |

```powershell
netsh http add urlacl url=https://+:443/KdcProxy user="NT authority\Network Service"

$KpsSvcSettingsReg = "HKLM:\SYSTEM\CurrentControlSet\Services\KPSSVC\Settings"
New-ItemProperty -Path $KpsSvcSettingsReg -Name "HttpsClientAuth" -Type DWORD -Value 0 -Force
New-ItemProperty -Path $KpsSvcSettingsReg -Name "DisallowUnprotectedPasswordAuth" -Type DWORD -Value 0 -Force
New-ItemProperty -Path $KpsSvcSettingsReg -Name "HttpsUrlGroup" -Type MultiString -Value "+`:443" -Force

Set-Service -Name KPSSVC -StartupType Automatic
Start-Service -Name KPSSVC
```

```powershell
function Set-KdcProxyServer {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string] $KerberosRealm,
        [Parameter(Mandatory = $true, Position = 1)]
        [ValidatePattern('^https://.+$')]
        [string] $KdcServerUrl,
        [bool] $ForceProxy = $true
    )

    $KdcUrl = [Uri]$KdcServerUrl
    $KdcHost = $KdcUrl.Host
    $KdcPort = $KdcUrl.Port
    $KdcPath = $KdcUrl.AbsolutePath.TrimStart('/')

    if ([string]::IsNullOrEmpty($KdcPath)) {
        $KdcPath = "KdcProxy"
    }

    $KdcProxyServer = "<https $KdcHost`:$KdcPort`:$KdcPath />"

    $KerberosReg = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos"
    New-Item -Path "$KerberosReg\Parameters" -Force | Out-Null
    New-Item -Path "$KerberosReg\KdcProxy\ProxyServers" -Force | Out-Null
    New-ItemProperty -Path $KerberosReg -Name "KdcProxyServer_Enabled" -Type DWORD -Value 1 -Force | Out-Null
    New-ItemProperty -Path "$KerberosReg\KdcProxy\ProxyServers" -Name $KerberosRealm -Value $KdcProxyServer -Force | Out-Null

    if ($ForceProxy) {
        New-ItemProperty -Path "$KerberosReg\Parameters" -Name "ForceProxy" -Type DWORD -Value 1 -Force | Out-Null
    }
}

function Reset-KdcProxyServer {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $KerberosRealm
    )

    $KerberosReg = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos"
    Remove-ItemProperty -Path $KerberosReg -Name "KdcProxyServer_Enabled" -Force -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "$KerberosReg\KdcProxy\ProxyServers" -Name $KerberosRealm -Force -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "$KerberosReg\Parameters" -Name "ForceProxy" -Force -ErrorAction SilentlyContinue
}

# Set-KdcProxyServer "ad.it-help.ninja" "https://IT-HELP-GW.ad.it-help.ninja:443/KdcProxy"
# Reset-KdcProxyServer "ad.it-help.ninja"
```

Applications and Services Logs / Microsoft / Windows / Kerberos-KDCProxy / Operational

```powershell
Stop-Service -Name KPSSVC
Set-Service -Name KPSSVC -StartupType Disabled
netsh http delete urlacl url=https://+:443/KdcProxy
```

## Links and references

https://x.com/awakecoding/status/1788731401015005628

https://syfuhs.net/kdc-proxy-for-remote-access

[SecPkgCredentials_KdcProxySettings]https://learn.microsoft.com/en-us/windows/win32/api/sspi/ns-sspi-secpkgcredentials_kdcproxysettingsw

https://awakecoding.com/posts/disabling-web-proxy-auto-detect-wpad-correctly/

https://learn.microsoft.com/en-us/azure/virtual-desktop/key-distribution-center-proxy

https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/jj134148(v=ws.11)#132-plan-certificates-for-ip-https

[MS-KKDCP]: Kerberos Key Distribution Center (KDC) Proxy Protocol
https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-kkdcp/5bcebb8d-b747-4ee5-9453-428aec1c5c38

https://x.com/jrog404/status/1782513032570065115
