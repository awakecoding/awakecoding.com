+++
title = "Everything Wrong with MSIX: Virtual Filesystem"
slug = "everything-wrong-with-msix-virtual-filesystem"
date = 2026-06-05
description = ""

[taxonomies]
tags = ["MSIX", "Windows", "PowerShell", "CTO"]

[extra]
banner = "/images/banners/everything-wrong-with-msix-no-system-context.png"
+++

```powershell
where.exe wt.exe
C:\Users\mamoreau\AppData\Local\Microsoft\WindowsApps\wt.exe

# aliases
"$Env:LocalAppData\Microsoft\WindowsApps"
```

```
Get-ChildItem 'C:\Program Files\WindowsApps'
Get-ChildItem: Access to the path 'C:\Program Files\WindowsApps' is denied.
```

```powershell
$UnpackagedWindowsTerminal = Join-Path $Env:TEMP "WindowsTerminal"
Remove-Item -Path $UnpackagedWindowsTerminal -Recurse -Force -ErrorAction SilentlyContinue | Out-Null
$PackagedWindowsTerminal = "$Env:ProgramFiles\WindowsApps\Microsoft.WindowsTerminal_1.24.11321.0_x64__8wekyb3d8bbwe"
$Dependencies="$Env:ProgramFiles\WindowsApps\Microsoft.UI.Xaml.2.8_8.2511.26001.0_x64__8wekyb3d8bbwe"
Copy-Item -Path "$PackagedWindowsTerminal\*" -Destination $UnpackagedWindowsTerminal -Container -Recurse -Force
Copy-Item -Path "$Dependencies\*" -Destination $UnpackagedWindowsTerminal -Container -Recurse -Force
& "$UnpackagedWindowsTerminal\wt.exe"
```

```powershell
"$Env:ProgramFiles\WindowsApps\Microsoft.WindowsTerminal_1.24.11321.0_x64__8wekyb3d8bbwe\WindowsTerminal.exe"
```

```powershell
Get-AppxPackage Microsoft.WindowsTerminal

Name              : Microsoft.WindowsTerminal
Publisher         : CN=Microsoft Corporation, O=Microsoft Corporation, L=Redmond, S=Washington, C=US
Architecture      : X64
ResourceId        :
Version           : 1.24.11321.0
PackageFullName   : Microsoft.WindowsTerminal_1.24.11321.0_x64__8wekyb3d8bbwe
InstallLocation   : C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.24.11321.0_x64__8wekyb3d8bbwe
IsFramework       : False
PackageFamilyName : Microsoft.WindowsTerminal_8wekyb3d8bbwe
PublisherId       : 8wekyb3d8bbwe
IsResourcePackage : False
IsBundle          : False
IsDevelopmentMode : False
NonRemovable      : False
Dependencies      : {Microsoft.UI.Xaml.2.8_8.2511.26001.0_x64__8wekyb3d8bbwe}
IsPartiallyStaged : False
SignatureKind     : Store
Status            : Ok
```

C:\Users\mamoreau\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState

```powershell
Get-ChildItem "$Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe"

    Directory: C:\Users\mamoreau\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d----          2024-10-01  1:38 PM                AC
d----          2024-03-21 10:20 AM                AppData
d----          2024-10-01  1:38 PM                LocalCache
d----          2026-06-05  2:54 AM                LocalState
d----          2024-03-21 10:20 AM                RoamingState
d----          2024-10-01  1:38 PM                Settings
d----          2024-10-01  1:38 PM                SystemAppData
d----          2024-03-21 10:20 AM                TempState
```

```powershell
$Env:LocalAppData\Apps
```

## winget

```powershell
Get-AppxPackage Microsoft.DesktopAppInstaller

$PackageName = "Microsoft.DesktopAppInstaller"

function Export-AppxPackage {
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string] $PackageName
    )

    $Appx = Get-AppxPackage $PackageName | Select-Object -First 1
    $UnpackagedPath = Join-Path $Env:TEMP $PackageName
    Remove-Item -Path $UnpackagedPath -Recurse -Force -ErrorAction SilentlyContinue | Out-Null
    New-Item -Path $UnpackagedPath -ItemType Directory -Force | Out-Null
    $PackagedPath = $Appx.InstallLocation

    Write-Host $UnpackagedPath
    return
    Copy-Item -Path "$PackagedPath\*" -Destination $UnpackagedPath -Container -Recurse -Force
    $appx.Dependencies | ForEach-Object {
        $DependencyPath = $_.InstallLocation
        Copy-Item -Path "$DependencyPath\*" -Destination $UnpackagedPath -Container -Recurse -Force
    }
    $UnpackagedPath
}
```