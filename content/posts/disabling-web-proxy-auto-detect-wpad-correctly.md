+++
title = "Disabling Web Proxy Auto Detect (WPAD) Correctly"
slug = "disabling-web-proxy-auto-detect-wpad-correctly"
date = 2022-02-22
description = "Explore the correct method to disable Web Proxy Auto Detect (WPAD) in Windows to enhance security without breaking essential components. This guide clarifies common misconceptions and provides a safe approach using registry modifications, avoiding potential pitfalls associated with service deactivation."

[taxonomies]
tags = ["Windows", "Kerberos", "CTO"]

[extra]
banner = "/images/banners/disabling-web-proxy-auto-detect-wpad-correctly.png"
+++

The Web Proxy Auto Detect (WPAD) feature in Windows makes it easier to automatically discover proxy settings on the local network. However, since it is commonly abused in a variety of attacks, security hardening guides often instruct to disable WPAD entirely. If you're like most people, your first thought will be to open services.msc, look for something that looks like it ("WinHTTP Web Proxy Auto-Discovery Service"), and... fall right into a trap.

**DO NOT DISABLE THE WPAD SERVICE! SOME WINDOWS COMPONENTS USING WINHTTP WILL BREAK!**

It is very counter-intuitive, but in order to disable WPAD correctly, one needs to [use a registry key](https://learn.microsoft.com/en-us/troubleshoot/windows-server/networking/disable-http-proxy-auth-features#how-to-disable-wpad), and leave the service running:

```powershell
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp' -Name DisableWpad -Value 1 -Force
```

Instead of using PowerShell, you can also download and import [DisableWpad.reg](/files/DisableWpad.reg) to set the registry key. The end result should look like this:

![WPAD Disabled with Service Running](/images/posts/wpad-disabled-with-service-running.png)

You can also check the status of the service with PowerShell:

```powershell
Get-Service WinHttpAutoProxySvc | Format-List -Property Status,Name,DisplayName

Status      : Running
Name        : WinHttpAutoProxySvc
DisplayName : WinHTTP Web Proxy Auto-Discovery Service
```

Disabling the WPAD service breaks some Windows components using WinHTTP. For instance, the [KDC proxying](https://syfuhs.net/kdc-proxy-for-remote-access) client often used with RDP, the RD Gateway, or DirectAccess to make Kerberos work outside of the corporate network will just... silently fail, causing a fallback to NTLM. I found out the hard way that IT fell into that trap when hardening our systems, and wasted quite a lot of time researching why Kerberos wouldn't kick in. The WPAD service is also required for [Windows Defender Application Guard (WDAG)](https://web.archive.org/web/20220222223025/https://github.com/MicrosoftDocs/windows-itpro-docs/issues/2965).

In both cases, the components don't care about WPAD - the problem is caused by WinHTTP APIs checking if the WPAD service is simply *running*.

*this blog post is based on [this twitter thread](https://twitter.com/awakecoding/status/1496243050032803840)*