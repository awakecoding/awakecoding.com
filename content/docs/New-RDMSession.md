---
title: 'New-RDMSession'
date: 2024-11-06
---


# New-RDMSession

## SYNOPSIS
Create a new session instance.

## SYNTAX

```
New-RDMSession [-DocumentAttachment <PSConnectionAttachment>] [-DocumentFileName <String>] [[-Group] <String>]
 [[-Host] <String>] [[-Name] <String>] [-SetSession] [-TemplateID <Guid>] [[-Type] <String>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a new session instance.
The instance has not yet been saved.
Assign the result to a variable then call "Set-RDMSession $s" to save the session.

## EXAMPLES

### EXAMPLE
```
PS C:\> $session = New-RDMSession -Name "New Session" -Host "myServer" -Type "RDPConfigured";Set-RDMSession $session
```

Create & save new session.

## PARAMETERS

### -DocumentAttachment
New document attachement.

```yaml
Type: PSConnectionAttachment
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DocumentFileName
New document file name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
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

### -Group
Session group.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Host
New Session host.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
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

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetSession
Save the session in the current data source.

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

### -TemplateID
Create PSSession from template.

```yaml
Type: Guid
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

"ADConsole", "AddOn", "AppleRemoteDesktop", "ApplicationTool", "Aws", "Azure", "AzureQueueStorage", "AzureStorage", "BeyondTrustPasswordSafeConsole", "ChromeRemoteDesktop"CitrixWeb", "CommandLine", "Computer", "Contact", "ControlUp", "Credential", "Customer", "CyberArkJump", "CyberArkPSM", "Dameware", "Database", "DataEntry", "DataReport", "DataSource", "DeskRoll", "Desktone", "DevolutionsProxy", "Document", "DropBox", "FileExplorer", "Ftp", "FtpNative", "Gateway", "Group", "Host", "HpRgs", "HyperV", "ICA", "IDrac", "Ilo", "IntelAMT", "InventoryReport", "Iterm", "LogMeIn", "PCAnywhere", "PlayList", "PortForward", "PowerShell", "PowerShellRemoteConsole", "ProxyTunnel", "PSExec", "Putty", "Radmin", "RDCommander", "RDPConfigured", "RDPFilename", "ResetPassword", "S3", "Scp","ScreenConnect", "ScreenHero", "ScriptDashboard", "SecureCRT",  "Serial",  "SessionTool" , "Sftp" , "Sheet" , "SkyDrive", "SNMPReport"),"Spiceworks", "Splunk", "SSHShell", "SSHTunnel", "Sync", "TeamViewer", "TeamViewerConsole", "Telnet",""TemplateGroup", "TerminalConsole", "TFtp","VirtualBox", "VirtualPC", "VMRC", "VMWare", "VMWareConsole", "VNC", "VPN", "Wayk", "WaykDenConsole", "WebBrowser", , "WebDav", "WindowsAdminCenter", "WindowsVirtualPC", "XenServer",  "XWindow"

```yaml
Type: String
Parameter Sets: (All)
Aliases: ConnectionType

Required: False
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection
## NOTES
For more information, type "Get-Help New-RDMSession -detailed".
For technical information, type "Get-Help New-RDMSession -full".

## RELATED LINKS

[Get-RDMDataSource](http://127.0.0.1:1111/docs/Get-RDMDataSource/)

[Set-RDMDataSource](http://127.0.0.1:1111/docs/Set-RDMDataSource/)

[Set-RDMSession](http://127.0.0.1:1111/docs/Set-RDMSession/)

[Remove-RDMSession](http://127.0.0.1:1111/docs/Remove-RDMSession/)

