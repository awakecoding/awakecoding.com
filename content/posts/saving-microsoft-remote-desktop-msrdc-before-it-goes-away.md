+++
title = "Saving Microsoft Remote Desktop (MSRDC) before it's gone"
slug = "saving-microsoft-remote-desktop-msrdc-before-its-gone"
date = 2025-07-18
description = "Microsoft’s Remote Desktop client (MSRDC) is being deprecated, and recent updates have broken MsRdpEx support. Learn how to download and pin a stable version, disable auto-updates, and preserve access before MSRDC goes away for good."

[taxonomies]
tags = ["RDP", "Windows", "PowerShell", "CTO"]

[extra]
banner = "/images/banners/saving-microsoft-remote-desktop-msrdc-before-its-gone.png"
+++

Microsoft's Remote Desktop client for Windows (MSRDC) [is being deprecated](https://techcommunity.microsoft.com/blog/windows-itpro-blog/prepare-for-the-remote-desktop-client-for-windows-end-of-support/4397724) — and recent updates have broken [MsRdpEx integration](https://github.com/Devolutions/MsRdpEx).

If you rely on MSRDC for features the new Windows App or mstsc don't handle well, now's the time to lock in a stable version and disable automatic updates before it disappears completely.

## Downloading a Stable MSRDC Build

Here are direct download links to version **1.2.6228.0**, which is the last version of MSRDC that still works well with [MsRdpEx](https://github.com/Devolutions/MsRdpEx):

- [MSRDC 1.2.6228.0 x64 MSI](https://res.cdn.office.net/remote-desktop-windows-client/ff46c1a3-9b23-4752-a79c-d13a309ca9d3/RemoteDesktop_1.2.6228.0_x64.msi)
- [MSRDC 1.2.6228.0 ARM64 MSI](https://res.cdn.office.net/remote-desktop-windows-client/cb804398-63fd-494a-9ad5-34c1803296ac/RemoteDesktop_1.2.6228.0_ARM64.msi)

Starting with MSRDC 1.2.6277.0, loading the RDP ActiveX from rdclientax.dll fails with error code 4872, and I couldn't figure out what changed. Launching msrdc.exe from MsRdpEx still worked until MSRDC 1.2.6353.0, but now AVD connections fail with the connection information tampering error.

With the MSRDC end of support date set to March 27, 2026, it just doesn't seem to be worth the effort anymore.

## Disabling MSRDC Automatic Updates

By default, MSRDC is set to automatically update itself. Disable automatic updates so you can pin a version of MSRDC that is known to work:

```powershell
$MsrdcPoliciesRegPath = "HKLM:\Software\Microsoft\MSRDC\Policies"
New-Item -Path $MsrdcPoliciesRegPath -Force | Out-Null
Set-ItemProperty -Path $MsrdcPoliciesRegPath -Name 'AutomaticUpdates' -Value 0 -Type DWORD
```

You can then check that automatic updates are disabled from the Remote Desktop client GUI (msrdcw.exe):

![MSRDC automatic updates disabled](/images/posts/save-msrdc-auto-update-disabled.png)

## Finding MSRDC CDN Download URLs using winget

Let's say you want to save a different version of MSRDC for later, how do you go about it? The simplest is to extract the information from winget, like this:

```powershell
PS > winget show --id Microsoft.RemoteDesktopClient --version 1.2.6228.0 --exact --source winget
Found Remote Desktop [Microsoft.RemoteDesktopClient]
Version: 1.2.6228.0
Publisher: Microsoft Corporation
Publisher Url: https://www.microsoft.com/
Publisher Support Url: https://support.microsoft.com/
Author: Microsoft Corporation
Moniker: msrdc
Description: You can access Windows Virtual Desktop resources on devices with Windows 7, Windows 10, and Windows 10 IoT Enterprise using the Windows Desktop client.
Homepage: https://learn.microsoft.com/azure/virtual-desktop/users/connect-windows
License: Proprietary
License Url: https://www.microsoft.com/legal/terms-of-use
Privacy Url: https://privacy.microsoft.com/privacystatement
Copyright: © Microsoft Corporation
All rights reserved.
Copyright Url: https://www.microsoft.com/legal/intellectualproperty/trademarks
Tags:
  remote-desktop
  virtual-desktop
Installer:
  Installer Type: wix
  Installer Url: https://res.cdn.office.net/remote-desktop-windows-client/ff46c1a3-9b23-4752-a79c-d13a309ca9d3/RemoteDesktop_1.2.6228.0_x64.msi
  Installer SHA256: d39ae50b56e115d9bf9c0f86c8ab2029fefaeddfbc2c4a1c8cfb523d72c6a888
  Offline Distribution Supported: true
```

By default, winget shows package information for your current platform, but you can use the architecture parameter (`-a x64` or `-a ARM64`) to force a different one.

## Finding MSRDC CDN Download URLs using PowerShell

If you just want to find the MSRDC CDN download URLs once to save them, calling winget works. However, if you'd like to automate it to bulk-download a lot of versions, you'll want to extract the information using PowerShell. Let's get a bit fancy by fetching the winget manifest files straight from GitHub.

First, install the [Yayaml PowerShell module](https://github.com/jborean93/PowerShell-Yayaml) to parse YAML:

```powershell
Install-Module -Name Yayaml -Force
```

You can find the manifest file on GitHub for [MSRDC version 1.2.6228.0 here](https://github.com/microsoft/winget-pkgs/blob/master/manifests/m/Microsoft/RemoteDesktopClient/1.2.6228.0/Microsoft.RemoteDesktopClient.installer.yaml). Use [git-rawify.vercel.app](https://git-rawify.vercel.app/) to convert the GitHub browser link to a "raw" GitHub URL that can be fetched directly in PowerShell. Run the following PowerShell code snippet:

```powershell
$Version = "1.2.6228.0"
$YamlUrl = "https://raw.githubusercontent.com/microsoft/winget-pkgs/master/manifests/m/Microsoft/RemoteDesktopClient/$Version/Microsoft.RemoteDesktopClient.installer.yaml"
$YamlText = Invoke-WebRequest -Uri $YamlUrl -UseBasicParsing | Select-Object -ExpandProperty Content
$Manifest = ConvertFrom-Yaml -Yaml $YamlText
$Manifest.Installers | ForEach-Object {
    [PSCustomObject]@{
        Architecture    = $_.Architecture
        InstallerUrl    = $_.InstallerUrl
        InstallerSha256 = $_.InstallerSha256
    }
} | Format-List
```

The output should now include package information for all architectures at once:

```powershell
Architecture    : x86
InstallerUrl    : https://res.cdn.office.net/remote-desktop-windows-client/e2971a84-ac0d-4836-a23c-7990bf81238e/RemoteDesktop_1.2.6228.0_x86.msi
InstallerSha256 : E55987A83A42FF3B1AB1C96EC215B69B87A7173D8DA9D272B8EECC9BD7A47538

Architecture    : x64
InstallerUrl    : https://res.cdn.office.net/remote-desktop-windows-client/ff46c1a3-9b23-4752-a79c-d13a309ca9d3/RemoteDesktop_1.2.6228.0_x64.msi
InstallerSha256 : D39AE50B56E115D9BF9C0F86C8AB2029FEFAEDDFBC2C4A1C8CFB523D72C6A888

Architecture    : arm64
InstallerUrl    : https://res.cdn.office.net/remote-desktop-windows-client/cb804398-63fd-494a-9ad5-34c1803296ac/RemoteDesktop_1.2.6228.0_ARM64.msi
InstallerSha256 : 8BD1D9DB7DCD716B5A8741E69BD76F34AF868F6D29B9AD24EED8700C74AB3B6D
```

## Saving MSRDC for later

It’s unclear how long the CDN download URLs for MSRDC will remain active after end of support. They’ll likely be unlisted from the website first, but may eventually be removed entirely. To be safe, keep a local backup of the installer files.

Even if the downloads disappear, the SHA256 hashes will remain available in the winget manifest history, which can still be used for integrity verification.

## Closing Note

MSRDC's end is near. This workaround won't last forever — but pinning a known-good version should buy you some time.
