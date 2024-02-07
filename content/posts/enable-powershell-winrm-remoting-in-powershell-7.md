+++
title = "Enable PowerShell WinRM Remoting in PowerShell 7"
slug = "enable-powershell-winrm-remoting-in-powershell-7"
date = 2024-02-07

[extra]
banner = "/images/posts/enable-powershell-winrm-remoting-in-powershell-7.png"
+++

Do you often wonder how to use PowerShell 7 in the *server* without switching to [SSH-based remoting](https://learn.microsoft.com/en-us/powershell/scripting/learn/remoting/ssh-remoting-in-powershell)? If [WinRM](https://learn.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management) already works well, why would you want to deal with SSH keys when all you want is PowerShell 7? While WinRM-based remoting is not officially supported on non-Windows, it remains a decent choice for PowerShell remoting in Windows environments. If you want a code snippet you can just copy/paste to enable PowerShell 7 in WinRM without the whole explanation, just skip to the summary section at the end of this blog. Otherwise, read on!

## Installing PowerShell

There are several ways to install [PowerShell 7 on Windows](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows), but my favorite method is this PowerShell code snippet which I run from an elevated shell:

```powershell
[Environment]::SetEnvironmentVariable("POWERSHELL_TELEMETRY_OPTOUT", "1", "Machine")
iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI -Quiet -EnablePSRemoting"
```

Otherwise, just download the latest MSI installer from the [PowerShell GitHub releases](https://github.com/PowerShell/PowerShell/releases). From the **Optional Actions** dialog, make sure to enable PowerShell remoting. Feel free to disable telemetry if that's not your thing:

![PowerShell MSI installer Options Enable PSRemoting](/images/posts/psremoting7-pwsh-msi-options-enable-psremoting.png)

The "Enable PowerShell Remoting" option of the MSI installer just runs the `Enable-PSRemoting` command in pwsh.exe automatically.

## Enabling PowerShell Remoting

On the server machine, launch PowerShell 7 (pwsh.exe) as administrator, then run `Enable-PSRemoting`:

```powershell
PS > Enable-PSRemoting
WARNING: PowerShell remoting has been enabled only for PowerShell 6+ configurations and does not affect Windows PowerShell remoting configurations. Run this cmdlet in Windows PowerShell to affect all PowerShell remoting configurations.
WinRM is already set up to receive requests on this computer.
WinRM is already set up for remote management on this computer.
```

Verify that `Get-PSSessionConfiguration` now lists a configuration named **PowerShell.7**:

```powershell
PS > Get-PSSessionConfiguration PowerShell.7* | Select-Object Name,PSVersion,Filename

Name              PSVersion Filename
----              --------- --------
PowerShell.7      7.2       %windir%\system32\PowerShell\7.2.17\pwrshplugin.dll
PowerShell.7.2.17 7.2       %windir%\system32\PowerShell\7.2.17\pwrshplugin.dll
```

It is very important to note that Enable-PSRemoting and Get-PSSessionConfiguration work differently in powershell.exe and pwsh.exe: the listing is different, and registration needs to be done separately for Windows PowerShell (powershell.exe) and PowerShell 7 (pwsh.exe). The default Windows PowerShell configuration names also begin with "microsoft." instead of "PowerShell.":

```powershell
Get-PSSessionConfiguration microsoft.* | Select-Object Name,PSVersion,Filename

Name                                     PSVersion Filename
----                                     --------- --------
microsoft.powershell                     5.1       %windir%\system32\pwrshplugin.dll
microsoft.powershell.workflow            5.1       %windir%\system32\pwrshplugin.dll
microsoft.powershell32                   5.1       %windir%\system32\pwrshplugin.dll
microsoft.windows.servermanagerworkflows 3.0       C:\Windows\system32\pwrshplugin.dll
```

Do not make the mistake of using powershell.exe: use pwsh.exe at all times for PowerShell 7 remoting configuration management, even if PowerShell 7 configuration names somehow end up listed in powershell.exe. It's a trap, don't fall into it like I did.

## Connecting with PowerShell Remoting

On the client machine, launch PowerShell, and define a few variables we're going to reuse for `Enter-PSSession` commands. The client machine can be the same as the server machine for local testing, but for real-world usage this is not normally the case:

```powershell
$UserName = "Administrator@ad.it-help.ninja"
$ComputerName = "IT-HELP-TEST.ad.it-help.ninja"
$Credential = Get-Credential -UserName $UserName
```

Open a new PowerShell remoting session using the **PowerShell.7** configuration name, then print $PSVersionTable from the PowerShell server to confirm what version it is using:

```powershell
Enter-PSSession -ComputerName $ComputerName -Credential $Credential -ConfigurationName "PowerShell.7"
[IT-HELP-TEST.ad.it-help.ninja]: > $PSVersionTable

Name                           Value
----                           -----
PSVersion                      7.2.17
PSEdition                      Core
GitCommitId                    7.2.17
OS                             Microsoft Windows 10.0.20348
Platform                       Win32NT
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0…}
PSRemotingProtocolVersion
SerializationVersion           1.1.0.1
WSManStackVersion              3.0
```

If it didn't work, here are the most common errors and their meaning:

> The WinRM client cannot process the request because the server name cannot be resolved.

Check the computer name and your DNS configuration, as the target computer name cannot be resolved. You can also try connecting by IP address instead.

> The WS-Management service cannot process the request. Cannot find the PowerShell.7 session configuration in the WSMan: drive on the remote computer.

The WinRM service on the target computer could be reached, but it doesn't know about the "PowerShell.7" session configuration. Check that you have run the `Enable-PSRemoting` command from pwsh.exe (PowerShell 7) and not powershell.exe (Windows PowerShell 5.1), and then try connecting again.

> WinRM cannot complete the operation. Verify that the specified computer name is valid, that the computer is accessible over the network, and that a firewall exception for the WinRM service is enabled and allows access from this computer. By default, the WinRM firewall exception for public profiles limits access to remote computers within the same local subnet

The target computer name could be resolved, but the WinRM service either isn't listening on TCP/5985 or a firewall is blocking the connection.

> The WinRM client cannot process the request. If the authentication scheme is different from Kerberos, or if the client computer is not joined to a domain, then HTTPS transport must be used or the destination machine must be added to the TrustedHosts configuration setting. Use winrm.cmd to configure TrustedHosts. Note that computers in the TrustedHosts list might not be authenticated.

See my blog ["PowerShell Remoting Trusted Hosts: What does it mean?"](https://awakecoding.com/posts/powershell-remoting-trusted-hosts-what-does-it-mean/) which is dedicated just to that one cryptic error.

## Hyper-V PowerShell 7 Direct

If you manage virtual machines in Hyper-V, did you know it was possible to use PowerShell remoting over the VMBus? [PowerShell Direct](https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-guide/powershell-direct) is extremely useful to configure Windows virtual machines guests from the host *without networking* (!). I use this feature extensively to configure guest VM networking, but also to [automate entire Hyper-V labs with scripts driven from the host](https://github.com/Devolutions/devolutions-labs). Either launch an elevated PowerShell terminal, or ensure you are a member of the local Hyper-V Administrators group, then use the `-VMName` parameter instead of `-ComputerName` with the `Enter-PSSession` cmdlet:

```powershell
$VMName = "IT-HELP-TEST"
$UserName = "Administrator@ad.it-help.ninja"
$Credential = Get-Credential -UserName $UserName
Enter-PSSession -VMName $VMName -Credential $Credential -ConfigurationName "PowerShell.7"
```

It is not properly documented anywhere, but the same PSSessionConfiguration used for WinRM is also used by the Hyper-V PSDirect service. Another "trick" is to delete `powershell.exe` from the Windows guest which will force `pwsh.exe` to be used instead:

![PowerShell MSI installer Options Enable PSRemoting](/images/posts/psremoting7-hyper-v-psdirect-pwsh-fallback.png)

However, this "solution" is not recommended for obvious reasons.

## Updating PowerShell 7

Enabling PowerShell remoting is great, but what happens when you update PowerShell? Most of the time it *should* work, but problems often arise with outdated and broken session configuration data. On the client, this often manifests itself as a weird assembly loading error:

> New-PSSession:  failed with the following error message : Could not load file or assembly 'System.Security.Cryptography, Version=7.0.0.0, Culture=neutral, . The system cannot find the file specified. For more information, see the about_Remote_Troubleshooting Help topic.

To fix this, on the server, unregister the previous PowerShell 7 session configurations, then run `Enable-PSRemoting` again:

```powershell
Get-PSSessionConfiguration PowerShell.7* | Unregister-PSSessionConfiguration; Enable-PSRemoting
```

You should now have proper PowerShell session configurations pointing to the currently installed version:

```powershell
Get-PSSessionConfiguration PowerShell.7* | Select-Object Name,PSVersion,Filename

Name             PSVersion Filename
----             --------- --------
PowerShell.7     7.4       %windir%\system32\PowerShell\7.4.1\pwrshplugin.dll
PowerShell.7.4.1 7.4       %windir%\system32\PowerShell\7.4.1\pwrshplugin.dll
```

From the client, you can try connecting again:

```powershell
Enter-PSSession -ComputerName $ComputerName -Credential $Credential -ConfigurationName "PowerShell.7"
[IT-HELP-TEST.ad.it-help.ninja]: PS > $PSVersionTable

Name                           Value
----                           -----
PSVersion                      7.4.1
PSEdition                      Core
GitCommitId                    7.4.1
OS                             Microsoft Windows 10.0.20348
Platform                       Win32NT
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0…}
PSRemotingProtocolVersion
SerializationVersion           1.1.0.1
WSManStackVersion              3.0
```

To prevent future PSSessionConfiguration breakage, a quick and dirty solution is to create a scheduled task:

```powershell
$TaskCommand = "`$PSVersion = `$PSVersionTable.PSVersion.ToString(); " +
    "if (-Not (Get-PSSessionConfiguration PowerShell.`$PSVersion)) { " +
    "Get-PSSessionConfiguration PowerShell.7* | Unregister-PSSessionConfiguration; " +
    "Enable-PSRemoting }"
$TaskAction = New-ScheduledTaskAction -Execute 'pwsh.exe' -Argument "-Command $TaskCommand"
$TaskTrigger = New-ScheduledTaskTrigger -AtStartup
$Params = @{
    Action = $TaskAction;
    Trigger = $TaskTrigger;
    User = "NT AUTHORITY\SYSTEM";
    TaskName = "Update PowerShell 7 remoting configuration";
    Description = "Update PowerShell 7 remoting configuration";
}
Register-ScheduledTask @Params
```

However, the scheduled task is not guaranteed to run right after PowerShell 7 is updated, so it may still break. What if we simply didn't need to update the registration information, such that it remained valid after a PowerShell upgrade? Let's remove the version-specific PSSessionConfiguration, then edit the PowerShell.7 configuration to point to the pwrshplugin.dll plugin DLL in its installation path. Since the `Enable-PSRemoting` cmdlet doesn't overwrite existing configurations, it won't be overwritten if you select "Enable PowerShell Remoting" in the MSI installer:

```powershell
Get-PSSessionConfiguration PowerShell.7.* | Unregister-PSSessionConfiguration
$WSManPluginPath = Join-Path $PSHOME.Replace($Env:ProgramFiles, '%ProgramFiles%') "pwrshplugin.dll"
Set-Item -Path "WSMan:\localhost\Plugin\PowerShell.7\Filename" -Value $WSManPluginPath
Set-Item -Path "WSMan:\localhost\Plugin\PowerShell.7\InitializationParameters\PSVersion" -Value "7"
Get-Item "$Env:WinDir\system32\PowerShell\7.*" | Remove-Item -Recurse -Force
Get-Item "$Env:WinDir\system32\PowerShell\7\*.dll" | Remove-Item -Force
Restart-Service WinRM
```

From PowerShell 7, you should now have a single PSSessionConfiguration named "PowerShell 7":

```powershell
Get-PSSessionConfiguration | Select-Object *

MaxMemoryPerShellMB           : 2147483647
PSVersion                     : 7
ResourceUri                   : http://schemas.microsoft.com/powershell/PowerShell.7
MaxIdleTimeoutms              : 2147483647
XmlRenderingType              : text
MaxShells                     : 2147483647
MaxProcessesPerShell          : 2147483647
RunAsPassword                 :
RunAsUser                     :
MaxShellsPerUser              : 25
SecurityDescriptorSddl        : O:NSG:BAD:P(A;;GA;;;BA)(A;;GA;;;RM)(A;;GA;;;IU)S:P(AU;FA;GA;;;WD)(AU;SA;GXGW;;;WD)
MaxConcurrentUsers            : 2147483647
ExactMatch                    : False
IdleTimeoutms                 : 7200000
OutputBufferingMode           : Block
RunAsVirtualAccount           : false
AutoRestart                   : false
Capability                    : {Shell}
Filename                      : %ProgramFiles%\PowerShell\7\pwrshplugin.dll
UseSharedProcess              : false
Enabled                       : True
SDKVersion                    : 2
RunAsVirtualAccountGroups     :
ParentResourceUri             : http://schemas.microsoft.com/powershell/PowerShell.7
Architecture                  : 64
Name                          : PowerShell.7
lang                          : en-US
MaxConcurrentCommandsPerShell : 2147483647
ProcessIdleTimeoutSec         : 0
SupportsOptions               : true
xmlns                         : http://schemas.microsoft.com/wbem/wsman/1/config/PluginConfiguration
Uri                           : http://schemas.microsoft.com/powershell/PowerShell.7
Permission                    : NT AUTHORITY\INTERACTIVE AccessAllowed, BUILTIN\Administrators AccessAllowed, BUILTIN\Remote Management Users AccessAllowed
```

That's it! You can now upgrade or downgrade PowerShell 7, the "PowerShell.7" PSSessionConfiguration won't need manual updating to keep working.

## Summary

If you just want to enable PowerShell WinRM remoting in PowerShell 7 with just one code snippet, here it is. Don't forget to run it from pwsh.exe (PowerShell 7) and not Windows PowerShell (powershell.exe):

```powershell
Get-PSSessionConfiguration PowerShell.7* | Unregister-PSSessionConfiguration; Enable-PSRemoting
$WSManPluginPath = Join-Path $PSHOME.Replace($Env:ProgramFiles, '%ProgramFiles%') "pwrshplugin.dll"
Set-Item -Path "WSMan:\localhost\Plugin\PowerShell.7\Filename" -Value $WSManPluginPath
Set-Item -Path "WSMan:\localhost\Plugin\PowerShell.7\InitializationParameters\PSVersion" -Value "7"
Get-Item "$Env:WinDir\system32\PowerShell\7.*" | Remove-Item -Recurse -Force
Get-Item "$Env:WinDir\system32\PowerShell\7\*.dll" | Remove-Item -Force
Restart-Service WinRM
```

You can then connect using the "PowerShell.7" configuration name with the `Enter-PSSession` cmdlet:

```powershell
$UserName = "Administrator@ad.it-help.ninja"
$ComputerName = "IT-HELP-TEST.ad.it-help.ninja"
$Credential = Get-Credential -UserName $UserName
Enter-PSSession -ComputerName $ComputerName -Credential $Credential -ConfigurationName "PowerShell.7"
```

You can now start migrating to PowerShell 7 for all your PSRemoting needs, instead of using PowerShell 7 to connect to Windows PowerShell!
