+++
title = "Isolating Windows service process for easier debugging"
slug = "isolating-windows-service-process-for-easier-debugging"
date = 2025-04-02
description = ""

[taxonomies]
tags = ["Windows", "PowerShell", "CTO"]

[extra]
banner = "/images/banners/windows-virtual-network-using-wintun-and-tun2socks.png"
+++

## Finding the service process id

```powershell
function Get-ServiceProcessId {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string] $Name
    )

    process {
        $svc = Get-CimInstance Win32_Service -Filter "Name='$Name'"
        if ($svc -and ($svc.ProcessId -ne 0)) {
            $svc.ProcessId
        }
    }
}
```

```powershell
PS> Get-ServiceProcessId DPS
6340

Get-Service DPS | Get-ServiceProcessId
6340
```

## Finding the service group name

```powershell
function Get-ServiceGroupName {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string] $Name
    )

    process {
        $svc = Get-CimInstance Win32_Service -Filter "Name='$Name'"
        if ($svc) {
            if ($svc.PathName -match '-k\s+(\w+)') {
                $matches[1]
            }
        }
    }
}
```

```powershell
PS> Get-ServiceGroupName DPS
LocalServiceNoNetwork

PS> Get-ServiceGroupName WinHttpAutoProxySvc
LocalServiceNetworkRestricted
```

## Finding service group members

```powershell
function Get-ServiceGroupMembers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string] $GroupName
    )

    try {
        $SvchostRegPath = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost'
        Get-ItemProperty -Path $SvchostRegPath | Select-Object -ExpandProperty $GroupName -ErrorAction Stop
    }
    catch {
        Write-Error "Group '$GroupName' not found in svchost registry."
    }
}
```

```powershell
PS> Get-ServiceGroupMembers LocalServiceNoNetwork
DPS
PLA
CoreMessagingRegistrar
NcdAutoSetup
```

## Moving Service to a new Group

```powershell
function Move-ServiceToNewGroup {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position = 0)]
        [string] $ServiceName,
        [Parameter(Mandatory, Position = 1)]
        [string] $OldGroupName,
        [Parameter(Mandatory, Position = 2)]
        [string] $NewGroupName
    )

    $SvchostRegPath = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost'
    $ServiceRegPath = "HKLM:\SYSTEM\CurrentControlSet\Services\$ServiceName"

    # Remove from old service group
    $OldGroupMembers = Get-ItemProperty -Path $SvchostRegPath | Select-Object -ExpandProperty $OldGroupName -ErrorAction Stop
    $OldGroupMembers = $OldGroupMembers | Where-Object { $_ -ne $ServiceName }
    Set-ItemProperty -Path $SvchostRegPath -Name $OldGroupName -Value $OldGroupMembers

    # Add to new service group
    $NewGroupMembers = Get-ItemProperty -Path $SvchostRegPath -Name $NewGroupName -ErrorAction SilentlyContinue
    if (-Not $NewGroupMembers) {
        $NewGroupMembers = @($ServiceName)
        New-ItemProperty -Path $SvchostRegPath -Name $NewGroupName -PropertyType MultiString -Value $NewGroupMembers | Out-Null
    } else {
        $NewGroupMembers = $NewGroupMembers | Select-Object -ExpandProperty $NewGroupName
        $NewGroupMembers = @($NewGroupMembers) + $ServiceName
        $NewGroupMembers = $NewGroupMembers | Sort-Object -Unique
        Set-ItemProperty -Path $SvchostRegPath -Name $NewGroupName -Value $NewGroupMembers
    }

    # Update ImagePath with -k parameter (group name) passed to svchost.exe
    $ImagePath = Get-ItemPropertyValue -Path $ServiceRegPath -Name ImagePath -ErrorAction Stop
    $ImagePath = $ImagePath -Replace "\s*-k\s+$OldGroupName", " -k $NewGroupName"
    Set-ItemProperty -Path $ServiceRegPath -Name ImagePath -Value $ImagePath

    # Copy service group configuration values
    $OldGroupConfig = "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost\$OldGroupName"
    $TempReg = Join-Path $Env:TEMP "svchost-$NewGroupName.reg"
    reg export "$OldGroupConfig" "$TempReg" /y | Out-Null
    (Get-Content $TempReg) -replace "\\$OldGroupName", "\\$NewGroupName" | Set-Content $TempReg
    reg import "$TempReg" | Out-Null
    Remove-Item $TempReg -Force
}
```

```powershell
PS> Move-ServiceToNewGroup WinHttpAutoProxySvc LocalServiceNetworkRestricted WinHttpAutoProxySvc
```
