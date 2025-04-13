+++
title = "Disable Bing Search in Start Menu for Faster Results"
slug = "disable-bing-search-in-start-menu-for-faster-results"
date = 2025-04-13
description = "Discover how to disable Bing search in the Windows Start Menu for faster, more responsive local search results. This step-by-step guide shows how to modify the registry with PowerShell or a .reg file, apply the setting for all users, and optionally use Group Policy or Intune to deploy the change across an organization. Improve Start Menu performance and streamline your Windows experience."

[taxonomies]
tags = ["Windows", "PowerShell", "CTO"]

[extra]
banner = "/images/banners/disable-bing-search-in-start-menu-for-faster-results.png"
+++

Modern Windows has a lot of features many users would consider bloat. Did you know what the Start menu always does a Bing search behind the scenes, introducing a significant delay in search results? Not only that, but it can also break search results completely, leaving you unable to start applications. I don't know about you, but launching applications is very high on the list of things the Start menu should do flawlessly at all times. Thankfully, there is a way to reclaim your Start menu performance, and ensure it doesn't randomly break its primary reason of existence for a feature you likely never wanted in the first place!

## Disabling Bing Search in Start Menu

Open PowerShell, and paste this command to set **BingSearchEnabled** to **0** and disable the Bing search Start menu "feature":

```powershell
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Value 0
```

Instead of using PowerShell, you can also download and import [DisableStartMenuBingSearch.reg](/files/DisableStartMenuBingSearch.reg) to set the registry key. The end result should look like this in regedit.exe, under `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search`:

![Start menu Bing search disabled in registry](/images/posts/start-menu-bing-search-disabled-registry.png)

Either reboot or force-restart all explorer.exe processes for the changes to become effective:

```powershell
Get-Process explorer | Stop-Process
```

There is unfortunately no **BingSearchEnabled** registry key under HKEY_LOCAL_MACHINE, so the next best thing to disable it by default for all users is to modify the default user registry hive:

```powershell
$DefaultUserReg = "HKLM\TempDefault"
$NtuserDatPath = "C:\Users\Default\NTUSER.DAT"
reg load $DefaultUserReg $NtuserDatPath
$HKDU = "Registry::$DefaultUserReg"
$RegPath = "$HKDU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search"
New-Item -Path $RegPath -Force | Out-Null
Set-ItemProperty -Path $RegPath -Name "BingSearchEnabled" -Value 1 -Type DWORD
[GC]::Collect()
[GC]::WaitForPendingFinalizers()
reg unload $DefaultUserReg
```

This last method is useful when creating a customized golden image of Windows, otherwise it is simpler to modify the registry key for the current user.

## Analyzing Start Menu Bing Search with the Kano Model

From the [Kano model of customer satisfaction](https://www.productplan.com/glossary/kano-model/), features are categorized based on how they influence user delight or frustration. The Bing search integration in the Windows Start Menu is a perfect example of a reverse performance or even indifferent feature:

When present, users often don’t notice it — or worse, they experience lag, irrelevant web results, or outright failure to launch local apps. This turns what should be a core system feature into a frustrating bottleneck.

When absent, most users feel no loss. In fact, disabling it typically improves the Start Menu experience, making it faster and more reliable — which is what users truly expect from a core UX feature like application search.

In this case, Bing search behaves more like a dissatisfier: it doesn’t add noticeable value when it works, and it actively degrades the experience when it doesn’t. From a Kano perspective, this makes it a low-ROI feature that may harm satisfaction more than it helps.

Disabling it aligns the system closer to user expectations: fast, local app search without noise or delays.
