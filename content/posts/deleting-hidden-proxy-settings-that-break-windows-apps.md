+++
title = "Deleting Hidden Proxy Settings that Break Windows Apps"
slug = "deleting-hidden-proxy-settings-that-break-windows-apps"
date = 2025-08-01
description = ""

[taxonomies]
tags = ["Windows", "PowerShell", "Networking", "CTO"]

[extra]
banner = "/images/banners/deleting-hidden-proxy-settings-that-break-windows-apps.png"
+++

Ever disabled proxy settings in Windows only to find that some apps still can't connect to the internet? You're not alone. Windows has a sneaky habit of leaving behind hidden proxy configurations that continue to interfere with network connections long after you've "turned off" proxy settings through the GUI. This isn't just an annoyance—it's a design flaw that can break everything from Windows Store apps to enterprise software. In this post, I'll show you how to identify these phantom proxy settings and completely eliminate them from your system.

## Enable and Disable Proxy Settings

Follow these steps to enable and disable proxy settings in Windows, which is sufficient to reproduce the problem. Do not worry, I show you how to remove the hidden proxy settings after:

![ProxyMgr settings UI edit and save](/images/posts/proxymgr-settings-ui-edit-and-save.png)

1. **Open Windows Settings** - Press `Win + I`
2. **Navigate to Network & Internet** → **Proxy**
3. **Turn on proxy settings**:
   - Toggle "Use a proxy server" to **On**
   - Enter any proxy server information
   - Click **Save**
4. **Turn off proxy settings**:
   - Toggle "Use a proxy server" to **Off**
   - Click **Save**

Beware that if you leave bogus proxy settings **enabled**, you will experience networking issues. There are still problems that can occur if the settings are disabled, which is the whole point of this blog.

## Internet Proxy Settings

Let's start with the *visible* proxy settings, or those which you have most likely checked already.

```powershell
PS> Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" |
    Select-Object ProxyEnable, ProxyServer, ProxyOverride, AutoConfigURL

ProxyEnable ProxyServer             ProxyOverride AutoConfigURL
----------- -----------             ------------- -------------
          0 http://proxy-server:808
```

![ProxyMgr internet settings registry](/images/posts/proxymgr-internet-settings-registry.png)

```powershell
function Test-ProxyConnection {
    param([string]$Url = "http://example.com")
    
    $proxy = [System.Net.WebRequest]::GetSystemWebProxy()
    $proxyUri = $proxy.GetProxy($Url)
    $isBypassed = $proxy.IsBypassed([System.Uri]$Url)
    $isDirectConnection = $isBypassed -or !$proxyUri -or ($proxyUri.ToString() -eq $Url)
    
    if ($isDirectConnection) {
        Write-Host "Direct connection (no proxy)"
    } else {
        Write-Host "Using proxy: $proxyUri"
    }
}
PS > Test-ProxyConnection "http://example.com" # with proxy disabled
Direct connection (no proxy)
PS > Test-ProxyConnection "http://example.com" # with proxy enabled
Using proxy: http://proxy-server:808/
```

## WinHTTP Proxy Settings

WinHTTP has a different way to store proxy settings. If you have proxy settings enabled from the Windows Settings app, they won't be reflected in WinHTTP. Use `netsh winhttp show proxy` to confirm:

```powershell
PS> netsh winhttp show proxy

Current WinHTTP proxy settings:

    Direct access (no proxy server).
```

From an elevated PowerShell terminal, you can set WinHTTP proxy settings:

```powershell
PS> netsh winhttp set proxy proxy-server:8080

Current WinHTTP proxy settings:

    Proxy Server(s) :  proxy-server:8080
    Bypass List     :  (none)
```

You can then remove WinHTTP proxy settings using `netsh winhttp reset proxy`:

```powershell
PS> netsh winhttp reset proxy

Current WinHTTP proxy settings:

    Direct access (no proxy server).
```

## Hidden Proxy Settings

These are the nasty ones nobody told you about, and they get created automatically under **HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\iphlpsvc\Parameters\ProxyMgr** in addition to the ones under **HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings**.

```powershell
PS> Get-ChildItem "HKLM:\SYSTEM\CurrentControlSet\Services\iphlpsvc\Parameters\ProxyMgr" | Format-Table -AutoSize

Name                                   Property
----                                   --------
{6A42EAA0-3831-4006-8F95-7A6C372D26B1} StaticProxy : http://proxy-server:808
                                       LastUseTime : 133985369088357795
{9A02AD85-8292-4B3D-B9D0-36AAB45B42E9} StaticProxy : http://proxy-server:808
                                       LastUseTime : 133985369088357795
{C9A5E798-F5DF-460F-8AEE-837A463CBC27} StaticProxy : http://proxy-server:808
                                       LastUseTime : 133985369088357795
```

Unlike **Internet Settings*, the **ProxyMgr** apparently don't have a **ProxyEnable** registry key, and since they are stored under **HKEY_LOCAL_MACHINE**, they affect the entire system, not just the current user.


![ProxyMgr remaining registry keys](/images/posts/proxymgr-proxy-settings-in-registry.png)

From an elevated PowerShell terminal, remove the **ProxyMgr** registry keys:

```powershell
Remove-Item "HKLM:\SYSTEM\CurrentControlSet\Services\iphlpsvc\Parameters\ProxyMgr" -Recurse -ErrorAction SilentlyContinue
```
