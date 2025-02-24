+++
title = "KDC Proxying for RDP NLA: Making Kerberos Work"
slug = "kdc-proxying-for-rdp-nla-making-kerberos-work"
date = 2025-02-24
description = ""

[taxonomies]
tags = ["Windows", "Azure", "CTO"]

[extra]
banner = "/images/banners/windows-hello-cloud-kerberos-trust-or-key-trust.png"
+++

## Bugs and limitations of mstsc

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

    if (RDGIsKDCProxy) {
        // If the "RDGIsKDCProxy" .RDP file option is set to true,
        // use the RD Gateway hostname as the KDC proxy.
        SetKDCProxy(GatewayHostname);
    } else {
        // Otherwise, use the "KDCProxyName" .RDP file option value as the KDC proxy.
        SetKDCProxy(KDCProxyName);
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
"https://kdc.contoso.com:8181/Custom/Path/With/Extra"
) | % { Convert-KdcProxyUrlToName $_ }
```

kdc.contoso.com
kdc.contoso.com:443
kdc.contoso.com:443:KdcProxy
kdc.contoso.com:8181:Custom/Path/With/Extra

https://x.com/awakecoding/status/1788731401015005628

https://syfuhs.net/kdc-proxy-for-remote-access

[SecPkgCredentials_KdcProxySettings]https://learn.microsoft.com/en-us/windows/win32/api/sspi/ns-sspi-secpkgcredentials_kdcproxysettingsw

https://awakecoding.com/posts/disabling-web-proxy-auto-detect-wpad-correctly/

https://learn.microsoft.com/en-us/azure/virtual-desktop/key-distribution-center-proxy
