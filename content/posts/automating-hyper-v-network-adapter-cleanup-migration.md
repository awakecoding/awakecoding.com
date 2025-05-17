+++
title = "Automating Hyper-V Network Adapter Cleanup and IP Migration"
slug = "automating-hyper-v-network-adapter-cleanup-migration"
date = 2025-05-17
description = ""

[taxonomies]
tags = ["Windows", "PowerShell", "CTO"]

[extra]
banner = "/images/banners/automating-hyper-v-network-adapter-cleanup-migration.png"
+++

If you've ever built Hyper-V lab environments with static IP configurations and later reused the VHDX files on a different host, you may have encountered the following issue:

1. The old network adapter disappears but still retains the static IP configuration in the registry.
2. The new network adapter created on import doesn't inherit the previous IP settings automatically.

This leads to network conflicts, unreachable VMs, and tedious manual reconfiguration. In this post, I'll show you how to use PowerShell to automatically clean up Hyper-V network adapters and migrate static IP configurations to the correct adapter.

First, let's simulate the problem. Delete the network adapter from an existing test VM that was previously configured with a static IP. Then, add a new network adapter and attach it to the same Hyper-V virtual switch:

![Hyper-V virtual machine delete network adapter](/images/posts/hvnetadapter-virtual-machine-delete-network-adapter.png)

Boot the virtual machine. If you have DHCP enabled, it should obtain an IP address different from the one that was previously assigned statically. Open the Device Manager (devmgmt.msc), then under **View**, enable **Show Hidden Devices**. The old network adapter should be listed with a half-transparent "ghost" icon:

![Device Manager show hidden devices](/images/posts/hvnetadapter-device-manager-show-hidden-devices.png)

```powershell
PS> Get-NetAdapter -IncludeHidden | Where-Object { $_.InterfaceDescription -Like "*Hyper-V*" }

Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet                  Microsoft Hyper-V Network Adapter             7 Up           00-15-5D-32-78-38        10 Gbps
```

```powershell
function Get-HyperVNetworkAdapterInfo {
    [CmdletBinding()]
    param()

    $PnpDevices = @(Get-PnpDevice -Class Net | Where-Object { $_.FriendlyName -like '*Hyper-V Network Adapter*' })
    
    $PnpDevices | ForEach-Object {
        $ClassGuid = $_.ClassGuid
        $DeviceDriverProperty = Get-PnpDeviceProperty -InstanceId $_.InstanceId -KeyName 'DEVPKEY_Device_Driver' -ErrorAction SilentlyContinue
        if ($DeviceDriverProperty.Data -match '\\(?<subkey>\d{4})$') {
            $DeviceRegPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Class\$ClassGuid\$($matches.subkey)"
            $NetCfgInstanceId = Get-ItemPropertyValue -Path $DeviceRegPath -Name NetCfgInstanceId -ErrorAction SilentlyContinue
            $NetCfgInstanceRegPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$NetCfgInstanceId"
            $NetCfg = Get-ItemProperty -Path $NetCfgInstanceRegPath | Select-Object IPAddress, SubnetMask, DefaultGateway, NameServer, EnableDHCP
            $NetConnectionRegPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Network\$ClassGuid\$NetCfgInstanceId\Connection"
            $NetAdapterName = Get-ItemPropertyValue -Path $NetConnectionRegPath -Name Name
            [PSCustomObject]@{
                FriendlyName     = $_.FriendlyName
                NetAdapterName   = $NetAdapterName
                Status           = $_.Status
                InstanceId       = $_.InstanceId
                NetCfgInstanceId = $NetCfgInstanceId
                IPAddress        = if ($NetCfg.IPAddress) { $NetCfg.IPAddress[0] } else { '' }
                SubnetMask       = if ($NetCfg.SubnetMask) { $NetCfg.SubnetMask[0] } else { '' }
                DefaultGateway   = if ($NetCfg.DefaultGateway) { $NetCfg.DefaultGateway[0] } else { '' }
                NameServer       = $NetCfg.NameServer
                EnableDHCP       = $NetCfg.EnableDHCP
            }
        }
    }
}
```

```powershell
PS> Get-HyperVNetworkAdapterInfo

FriendlyName     : Microsoft Hyper-V Network Adapter
NetAdapterName   : Ethernet
Status           : OK
InstanceId       : VMBUS\{F8615163-DF3E-46C5-913F-F2D2F965ED0E}\{B22F1BF5-12F6-480D-8F16-702AC7BE5CAA}
NetCfgInstanceId : {20BE1EE8-E115-4A5F-B1C0-B295B293E127}
IPAddress        :
SubnetMask       :
DefaultGateway   :
NameServer       :
EnableDHCP       : 1

FriendlyName     : Microsoft Hyper-V Network Adapter #3
NetAdapterName   : vEthernet (LAN)
Status           : Unknown
InstanceId       : VMBUS\{F8615163-DF3E-46C5-913F-F2D2F965ED0E}\{19E87F3D-4849-4959-B43D-75381017DB77}
NetCfgInstanceId : {99439FE2-D5F1-4E92-AEA3-4988838F2201}
IPAddress        : 10.10.0.9
SubnetMask       : 255.255.255.0
DefaultGateway   : 10.10.0.2
NameServer       : 10.10.0.3
EnableDHCP       : 0
```

```powershell
$NetAdapters = Get-HyperVNetworkAdapterInfo
$OldAdapter = $NetAdapters | Where-Object { $_.Status -eq 'Unknown' -and $_.IPAddress -Match "10.10.0.*" } | Select-Object -First 1
$NewAdapter = $NetAdapters | Where-Object { $_.Status -eq 'OK' -and [string]::IsNullOrEmpty($_.IPAddress) } | Select-Object -First 1

if ($OldAdapter -and $NewAdapter) {
    Write-Host "Removing old network adapter: '$($OldAdapter.NetAdapterName)'"
    & pnputil /remove-device "$($OldAdapter.InstanceId)"

    $NetAdapterName = $OldAdapter.NetAdapterName
    $IPAddress = $OldAdapter.IPAddress
    $SubnetMask = $OldAdapter.SubnetMask
    $DefaultGateway = $OldAdapter.DefaultGateway
    $NameServer = $OldAdapter.NameServer
    Write-Host "Renaming new network adapter to '$NetAdapterName'"
    Rename-NetAdapter -Name $NewAdapter.NetAdapterName -NewName $NetAdapterName
    $PrefixLength = ([System.Net.IPAddress]::Parse($SubnetMask).GetAddressBytes() |
        ForEach-Object { [Convert]::ToString($_, 2).PadLeft(8, '0') -split '' } | Where-Object { $_ -eq '1' }).Count
    $Params = @{
        IPAddress = $IPAddress;
        InterfaceAlias = $NetAdapterName;
        AddressFamily = "IPv4";
        PrefixLength = $PrefixLength;
        DefaultGateway = $DefaultGateway;
    }
    Write-Host "Configuring '$NetAdapterName':"
    Write-Host "`tIPAddress: $IPAddress`n`tSubnetMask: $SubnetMask`n`tDefaultGateway: $DefaultGateway"
    Set-NetIPInterface -InterfaceAlias $NetAdapterName -Dhcp Disabled
    New-NetIPAddress @Params
    Write-Host "Setting DNS server: $NameServer"
    Set-DnsClientServerAddress -InterfaceAlias $NetAdapterName -ServerAddresses $NameServer
}
```

```powershell
Get-HyperVNetworkAdapterInfo | Where-Object { $_.Status -eq 'Unknown' } | ForEach-Object {
    Write-Host "Removing ghost network adapter: '$($_.NetAdapterName)'"
    & pnputil /remove-device "$($_.InstanceId)"
}
```
