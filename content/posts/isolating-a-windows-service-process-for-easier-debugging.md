+++
title = "Isolating a Windows Service Process for Easier Debugging"
slug = "isolating-a-windows-service-process-for-easier-debugging"
date = 2025-04-06
description = "Learn how to isolate a Windows system service into its own process for easier debugging. This guide walks you through identifying service process IDs, listing service group members, and using PowerShell to move a service into a new, dedicated service group."

[taxonomies]
tags = ["Windows", "PowerShell", "CTO"]

[extra]
banner = "/images/banners/isolating-a-windows-service-process-for-easier-debugging.png"
+++

Have you ever wanted to identify which process hosts a specific system service, only to realize that they all show up as "svchost.exe" in [Process Monitor](https://learn.microsoft.com/en-us/sysinternals/downloads/procmon) or [Process Explorer](https://learn.microsoft.com/en-us/sysinternals/downloads/process-explorer)?

![Process Explorer system services](/images/posts/services-svchost-process-explorer.png)

Some system services like TermService (Remote Desktop Services) leave some obvious clues like a child "rdpclip.exe" process. However, most of the time, you won't be so lucky.

## Finding the Service Process Id

The most accurate method to find the process id matching a system service is through WMI. Here's a simple `Get-ServiceProcessId` PowerShell cmdlet you can paste and use wherever needed:

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

You can try it out with the Diagnostic Process Service (DPS), which should be in the running state on most systems:

```powershell
PS> Get-ServiceProcessId DPS
6340

Get-Service DPS | Get-ServiceProcessId
6340
```

Neat! Now you can use the process id to filter events in Process Monitor and learn more what a specific services does.

## Finding the Service Group Name

Ah ha! You thought this was the end of it, didn't you? Unfortunately, you may notice that many system services share the *same* svchost.exe process. Uh oh - that's not good if you want to filter on a specific *service*. This is a side effect of service groups, a feature used to pool multiple services together for performance reasons. You can use the `Get-ServiceGroupName` PowerShell cmdlet to find the optional service group name associated with a service:

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

How does it work? Members of a service group register svchost.exe as their executable and pass the service group name in the `-k` command-line parameter. When the Service Control Manager (SCM) sees this parameter, it will launch a single process for all members of the same group. Let's try it with a few system services:

```powershell
PS> Get-ServiceGroupName DPS
LocalServiceNoNetwork

PS> Get-ServiceGroupName WinHttpAutoProxySvc
LocalServiceNetworkRestricted
```

**LocalServiceNoNetwork** and **LocalServiceNetworkRestricted** are built-in service groups in Windows. There are several others which I'll let you discover on your own.

## Finding Service Group Members

Now that we know the service group name for the service of interest, how can we find other members of the same group? Luckily for us, service group membership is stored as a list in the registry:

![service group members in registry](/images/posts/services-svchost-group-members.png)

Here's the `Get-ServiceGroupMembers` PowerShell cmdlet that simplifies obtaining service group members:

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

The **LocalServiceNoNetwork** service group contains just a few services:

```powershell
PS> Get-ServiceGroupMembers LocalServiceNoNetwork
DPS
PLA
CoreMessagingRegistrar
NcdAutoSetup
```

The **LocalServiceNetworkRestricted** service group, on the other hand, is quite big:

```powershell
Get-ServiceGroupMembers LocalServiceNetworkRestricted
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

If you were hoping to learn more about one of those services, this can make your work harder.

## Moving Service to a New Group

Welcome to the danger zone: for this last part, please use a test virtual machine, as we're going to be fiddling with service registrations, and there is a potential to break things.

How can one isolate a system service such that it can run in its own process without other services in it? Service groups are not mandatory, but modifying a service registration to *not* use a service group can be difficult. The simplest approach is to create a new service group similar to the original one, and move the service of interest into it. Hold your breath for the `Move-ServiceToNewGroup` PowerShell cmdlet:

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

Yes, it's a lot more complicated than the previous cmdlets. Let's just try it with **WinHttpAutoProxySvc**, the Windows Proxy Auto Detect (WPAD) service in Windows. It is a member of the **LocalServiceNetworkRestricted** service group, but we'll move it to a new service group matching its own name (WinHttpAutoProxySvc). Run this command from an elevated PowerShell terminal:

```powershell
PS> Move-ServiceToNewGroup WinHttpAutoProxySvc LocalServiceNetworkRestricted WinHttpAutoProxySvc
```

If everything worked, you just need to reboot the virtual machine. Avoid manually starting or stopping this service - other services depend on it, and it may behave as unexpectedly. If you look in the registry, you should now see the new service group configuration under `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost\WinHttpAutoProxySvc`:

![service group configuration in registry](/images/posts/services-svchost-group-configuration.png)

The service configuration under `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc` should also have a new value for **ImagePath**:

![service configuration in registry](/images/posts/services-svchost-service-configuration.png)

Now make sure that the **WinHttpAutoProxySvc** service is running:

```powershell
PS> Get-Service WinHttpAutoProxySvc | Format-List

Name                : WinHttpAutoProxySvc
DisplayName         : WinHTTP Web Proxy Auto-Discovery Service
Status              : Running
DependentServices   : {NcaSvc, iphlpsvc}
ServicesDependedOn  : {Dhcp}
CanPauseAndContinue : False
CanShutdown         : True
CanStop             : False
ServiceType         : Win32ShareProcess
```

```powershell
PS> Get-ServiceProcessId WinHttpAutoProxySvc
1484
```

Last but not least, let's confirm that none of the other services in the original service group have a matching process id:

```powershell
PS> Get-ServiceGroupMembers LocalServiceNetworkRestricted | ForEach-Object {
    [PSCustomObject]@{ ServiceName = $_; ProcessId = Get-ServiceProcessId $_ }
}

ServiceName   ProcessId
-----------   ---------
TimeBrokerSvc      1220
WarpJITSvc
eventlog           1220
AudioSrv
LmHosts            1220
AppIDSvc
vmictimesync       1220
NgcCtnrSvc
RmSvc
wcmsvc             1820
DHCP               1220
AJRouter
```

Success! None of the running services share the same process.

## Taking a Shortcut I Wish I Knew Earlier

The most observant of you will have noticed that the **wcmsvc** service has a different process id despite being a member of the **LocalServiceNetworkRestricted** service group. How can that be? Let's look at the **wcmsvc** service more closely:

```powershell
PS> Get-Service wcmsvc | Format-List

Name                : wcmsvc
DisplayName         : Windows Connection Manager
Status              : Running
DependentServices   : {}
ServicesDependedOn  : {RpcSs, NSI}
CanPauseAndContinue : False
CanShutdown         : True
CanStop             : True
ServiceType         : Win32OwnProcess
```

A service type of **Win32OwnProcess**, despite being a member of a service group? Does that mean one can just change this service type instead of moving the service to a new service group? Let's look in the registry:

![service win32 own process type](/images/posts/services-svchost-win32-own-process.png)

The **WinHttpAutoProxySvc** service has a type of **Win32ShareProcess** with corresponding value of 32 in the registry. Let's just change that to **Win32OwnProcess** with a value of 16 instead:

```powershell
function Set-ServiceTypeOwnProcess {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position = 0)]
        [string] $ServiceName
    )

    $ServiceRegPath = "HKLM:\SYSTEM\CurrentControlSet\Services\$ServiceName"
    Set-ItemProperty -Path $ServiceRegPath -Name "Type" -Value 16 -Type DWORD
}

Set-ServiceTypeOwnProcess "WinHttpAutoProxySvc"
```

Run this on a machine where the service hasn't been moved to a different group, then reboot. List process ids for all services in the **LocalServiceNetworkRestricted** group:

```powershell
PS> Get-ServiceGroupMembers LocalServiceNetworkRestricted | ForEach-Object {
    [PSCustomObject]@{ ServiceName = $_; ProcessId = Get-ServiceProcessId $_ }
}

ServiceName         ProcessId
-----------         ---------
TimeBrokerSvc            1072
WarpJITSvc
eventlog                 1072
AudioSrv
WinHttpAutoProxySvc      1920
LmHosts                  1072
AppIDSvc
vmictimesync             1072
NgcCtnrSvc
RmSvc
wcmsvc                   1960
DHCP                     1072
AJRouter
```

Congratulations, it worked! The **WinHttpAutoProxySvc** service is still a member of the **LocalServiceNetworkRestricted**, but it is now running in its own isolated process. This is obviously much simpler, and can be done manually with regedit.exe.

## Disabling Service Host Process Pooling

The **SvcHostSplitThresholdInKB** registry key value under `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control` can be used to disable svchost.exe process pooling entirely. By default, the threshold is set to 3670016 (0x380000) KB, which corresponds to approximately 3.5 GB of RAM:

![service svchost split threshold](/images/posts/services-svchost-split-threshold-in-kb.png)

If your system has more memory than the configured threshold, separate svchost.exe processes will be created for all services, including those with the Win32ShareProcess service type. If you have limited RAM in a test virtual machine, the threshold will be too high. Set the **SvcHostSplitThresholdInKB** value to **1** and to disable service host process pooling:

```powershell
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control' -Name 'SvcHostSplitThresholdInKB' -Value 1
```

Don't set **SvcHostSplitThresholdInKB** to **0** as it appears to be treated as a special value that doesn't do what we want. After rebooting, confirm that the change had the intended side effect:

```powershell
PS> Get-ServiceGroupMembers LocalServiceNetworkRestricted | ForEach-Object {
    [PSCustomObject]@{ ServiceName = $_; ProcessId = Get-ServiceProcessId $_ }
}

ServiceName         ProcessId
-----------         ---------
TimeBrokerSvc            1360
WarpJITSvc
eventlog                 1340
AudioSrv
WinHttpAutoProxySvc      2640
LmHosts                  1184
AppIDSvc
vmictimesync             1720
NgcCtnrSvc
RmSvc
wcmsvc                   2448
DHCP                     1412
AJRouter
```

This is yet another trick I wish I knew earlier, and is much simpler to work with!

## Closing Thoughts

Being able to isolate a system service into its own process is incredibly useful when you're trying to understand what it actually does. Whether you go the long route by creating a new service group or take the shortcut by switching the service type to Win32OwnProcess, the end result is the same: less background noise, cleaner traces, and a much easier time in tools like Process Monitor.
