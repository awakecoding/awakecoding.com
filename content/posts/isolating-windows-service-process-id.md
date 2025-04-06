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

```powershell
PS> Get-ServiceGroupMembers LocalServiceNetworkRestricted
TimeBrokerSvc
WarpJITSvc
eventlog
AudioSrv
WinHttpAutoProxySvc
wscsvc
LmHosts
AppIDSvc
WFDSConMgrSvc
vmictimesync
btagservice
SmsRouter
NgcCtnrSvc
icssvc
RmSvc
wlpasvc
DusmSvc
DHCP
wcmsvc
```
