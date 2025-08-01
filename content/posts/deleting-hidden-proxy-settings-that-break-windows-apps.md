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

Ever disabled proxy settings in Windows only to find that some apps still can't connect to the internet? You're not alone. Windows has a sneaky habit of leaving behind hidden proxy configurations that continue to interfere with network connections long after you've "turned off" proxy settings through the GUI. This isn't just an annoyance—it's a design flaw that can break everything from Windows Store apps to enterprise software.

In my case, my first experience with this problem was after installing *and uninstalling* [Fiddler Everywhere](https://www.telerik.com/fiddler/fiddler-everywhere). Through my work at [Devolutions](https://devolutions.net/), I had been pulling my hair wondering why KDC proxying was broken. Using [Process Monitor](https://learn.microsoft.com/en-us/sysinternals/downloads/procmon), I could see failed connections from lsass.exe going to a localhost proxy that was no longer there.

In this post, I'll show you how to identify these phantom proxy settings and completely eliminate them from your system.

## Enable and Disable Proxy Settings

Follow these steps to enable and disable proxy settings in Windows, which is sufficient to reproduce the problem. Do not worry, I will show you how to remove the hidden proxy settings after:

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

Beware that if you leave bogus proxy settings **enabled**, you will experience networking issues.

## Hidden Proxy Settings: The Real Problem

Here's where things get ugly. Windows automatically creates additional proxy settings that the GUI **never shows you** and **never cleans up**. These phantom settings live under:

**`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\iphlpsvc\Parameters\ProxyMgr`**

Let's expose these hidden configurations:

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

Unlike **Internet Settings**, **ProxyMgr** don't have a **ProxyEnable** registry key, and since they are stored under **HKEY_LOCAL_MACHINE**, they affect the entire system, not just the current user.

![ProxyMgr remaining registry keys](/images/posts/proxymgr-proxy-settings-in-registry.png)

From an elevated PowerShell terminal, remove the **ProxyMgr** registry keys:

```powershell
Remove-Item "HKLM:\SYSTEM\CurrentControlSet\Services\iphlpsvc\Parameters\ProxyMgr" -Recurse -ErrorAction SilentlyContinue
```

If you have already tried everything to disable proxy settings which were mysteriously still used by some applications, this is the command that will finally fix things.

## Internet Proxy Settings

The proxy settings for the current user are stored under the "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings":

![ProxyMgr internet settings registry](/images/posts/proxymgr-internet-settings-registry.png)

You can also inspect them through PowerShell:

```powershell
PS> Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" |
    Select-Object ProxyEnable, ProxyServer, ProxyOverride, AutoConfigURL

ProxyEnable ProxyServer             ProxyOverride AutoConfigURL
----------- -----------             ------------- -------------
          0 http://proxy-server:808
```

These settings are also often called the "Internet Explorer" proxy settings. This is what the Windows Settings app lets you see.

### Testing .NET Proxy Detection

In .NET, applications dynamically detect proxy settings based on the target URL. You can easily test this behavior using some PowerShell:

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

This is a good code snippet to have at hand, because I once investigated a weird customer issue where complex proxy resolution logic was not the same between .NET Framework (Windows PowerShell) and .NET Core (PowerShell 7).

## WinHTTP Proxy Settings

WinHTTP maintains a completely separate proxy configuration from Internet Settings. This separation is by design—WinHTTP is used by system services and applications that need more control over networking. You can inspect those settings using the `netsh winhttp show proxy` command:

```powershell
PS> netsh winhttp show proxy

Current WinHTTP proxy settings:

    Direct access (no proxy server).
```

While the Settings app doesn't modify the WinHTTP proxy settings, the **ProxyMgr** registry keys *can affect system components using WinHTTP*, such as KDC proxying in lsass.exe. Yes, this means that simply enabling and disabling bogus proxy settings from your unelevated user context can result in broken Kerberos with an NTLM downgrade. If you have malicious intents, this is also a good way to redirect KDC proxying traffic somewhere else without elevated permissions.

You can manually configure WinHTTP proxy settings (requires elevated privileges):

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

## Conclusion

Windows proxy management has a fundamental design flaw that creates persistent networking issues long after you think you've disabled proxy settings. The root cause is simple: when you enable proxy settings, Windows creates per-interface configurations in both user (`HKCU`) and system (`HKLM`) registry locations, but when you disable them, only the user-level settings get cleared.

This leaves behind hidden ProxyMgr registry entries that continue affecting system services and applications. The most concerning impact is on WinHTTP-based components like the Kerberos KDC proxying client in `lsass.exe`, where a simple proxy configuration mistake can break enterprise authentication and force NTLM downgrades—all from an unprivileged user context.

From a security perspective, this design flaw is troubling. Regular users can configure proxy settings that persist at the system level, affecting privileged processes without any indication in the Windows UI. Malicious users could potentially redirect system traffic through proxies to intercept sensitive data, all without requiring elevated permissions.
