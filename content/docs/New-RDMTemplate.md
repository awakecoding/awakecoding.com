---
title: 'New-RDMTemplate'
date: 2024-11-06
---


# New-RDMTemplate

## SYNOPSIS
Create a new template instance.

## SYNTAX

```
New-RDMTemplate [-Name] <String> [-SetTemplate] [-Type] <String> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [-Destination] <String> [<CommonParameters>]
```

## DESCRIPTION
Create a new template instance.
The instance has not yet been saved.
Assign the result to a variable then call "Set-RDMTemplate $s" to save the template.

## EXAMPLES

### EXAMPLE
```
PS C:\> $session = New-RDMTemplate -Destination Database -Name "New Template"-Type "RDPConfigured";Set-RDMTemplate $template
```

Create & save new session.

## PARAMETERS

### -Destination
Template destination

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForcePromptAnswer
Switch to use with caution.
It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions.
In case of multiple prompts, multiple values can be passed to this parameter.
Here are the accepted values:
- Yes: Accept the prompt.
Cover the OK and Automatic value.
- No: Refuse the yes/no/cancel prompt.
Cancel is the fallback option if there is not an option No.
- Cancel: Cancel the yes/no/cancel prompt.
No is the fallback option if there is not an option Cancel.

```yaml
Type: DialogResult[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
New PSSession name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetTemplate
Save the session in the current data source

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
New session kind.
Must be on of the following:

"ADConsole", "AddOn", "AppleRemoteDesktop", "ApplicationTool", "Aws", "Azure", "AzureQueueStorage", "AzureStorage", "BeyondTrustPasswordSafeConsole", "ChromeRemoteDesktop"CitrixWeb", "CommandLine", "Computer", "Contact", "ControlUp", "Credential", "Customer", "Dameware", "Database", "DataEntry", "DataReport", "DataSource", "DeskRoll", "Desktone", "DevolutionsProxy", "Document", "DropBox", "Ftp", "Gateway", "Group", "Host", "HpRgs", "HyperV", "ICA", "IDrac", "Ilo", "IntelAMT", "InventoryReport", "Iterm", "LogMeIn", "PCAnywhere", "PlayList", "PortForward", "PowerShell", "PowerShellRemoteConsole", "ProxyTunnel", "PSExec", "Putty", "Radmin", "RDCommander", "RDPConfigured", "RDPFilename", "ResetPassword", "S3", "ScreenConnect", "ScreenHero", "SecureCRT",  "Serial",  "SessionTool" , "Sheet" , "SkyDrive", "SNMPReport"),"Spiceworks", "Splunk", "SSHShell", "SSHTunnel", "Sync", "TeamViewer", "TeamViewerConsole", "Telnet",""TemplateGroup", "TerminalConsole", "VirtualBox", "VirtualPC", "VMRC", "VMWare", "VMWareConsole", "VNC", "VPN", "Wayk", "WebBrowser", , "WebDav", "WindowsVirtualPC", "XenServer",  "XWindow"

```yaml
Type: String
Parameter Sets: (All)
Aliases: ConnectionType

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSTemplate
## NOTES
For more information, type "Get-Help New-RDMTemplate -detailed".
For technical information, type "Get-Help New-RDMTemplate -full".

## RELATED LINKS

[Get-RDMTemplate](http://127.0.0.1:1111/docs/Get-RDMTemplate/)

[Set-RDMTemplate](http://127.0.0.1:1111/docs/Set-RDMTemplate/)

[Remove-RDMTemplate](http://127.0.0.1:1111/docs/Remove-RDMTemplate/)

