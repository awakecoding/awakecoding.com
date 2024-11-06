---
title: 'New-RDMEntry'
date: 2024-11-06
---


# New-RDMEntry

## SYNOPSIS
Create a new entry.

## SYNTAX

```
New-RDMEntry [-Type] <ConnectionType> [[-Name] <String>] [[-Group] <String>] [[-Host] <String>]
 [[-TemplateID] <Guid>] [-DocumentAttachment <PSConnectionAttachment>] [-DocumentFileName <String>] [-Set]
 [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Create a new entry.
To save the new entry, the SetSession switch must be used.
To save in the user vault ou the system vault, use the VaultMode parameter.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> New-RDMEntry -Name 'New Entry' -Host 'myServer' -Type 'RDPConfigured' -Set -VaultMoode User
```

Create & save a new entry in the user vault.

### EXAMPLE 2
```
PS C:\> $folder = New-RDMEntry -Name 'New Folder' -Type 'Group';
        $folder.GroupDetails.UserName = 'MyUserName';
        $folder.GroupDetails.Domain = 'MyDomain';
        Set-RDMEntry -InputObject $folder
```

Create a new entry without saving it and store it in $folder.
Add some additionnal information in the GroupDetails.
Save the entry in the current vault.

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
Folder where the entry will be.
It is corresponding to the property 'Group' of the PSConnection object.

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
Host of the entry.
Value available for specific entry types only.

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
Name of the entry.
It can not be empty.
However, if the parameter Host is not empty, it will be use as a fallback.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Set
Save the entry based on the vault mode:
        - Default =\> In the current vault
        - User =\> In the user vault
        - Global =\> In the system vault

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
Id of the template used to create the entry.
It is mandatory for entry of the type 'TemplateGroup'.

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
Type of the entry to create.
Must be on of the following:
        'ADConsole', 'AddOn', 'Agent', 'AppleRemoteDesktop', 'ApplicationTool', 'Aws', 'Azure', 'AzureQueueStorage', 'AzureStorage', 'BeyondTrustPasswordSafeConsole',
        'ChromeRemoteDesktop', 'CitrixWeb', 'CommandLine', 'Computer', 'Contact', 'ControlUp', 'Credential', 'Customer', 'CyberArkJump', 'CyberArkPSM',
        'Dameware', 'Database', 'DataEntry', 'DataReport', 'DataSource', 'DeskRoll', 'Desktone', 'DevolutionsProxy, 'Document', 'DropBox', 'FileExplorer',
        'Ftp', 'FtpNative', 'Gateway', 'Group', 'Host', 'HpRgs, 'HyperV', 'ICA', 'IDrac', 'Ilo', 'IntelAMT', 'InventoryReport', 'Iterm',
        'LogMeIn', 'PCAnywhere', 'PlayList', 'PortForward', 'PowerShell', 'PowerShellRemoteConsole', 'ProxyTunnel', 'PSExec', 'Putty', 'Radmin', 'RDCommander',
        'RDPConfigured', 'RDPFilename', 'ResetPassword', 'S3', 'Scp','ScreenConnect', 'ScreenHero', 'ScriptDashboard', 'SecureCRT',  'Serial',  'SessionTool' , 'Sftp' , 'Sheet' ,
        'SkyDrive', 'SNMPReport', 'Spiceworks', 'Splunk', 'SSHShell', 'SSHTunnel', 'Sync', 'TeamViewer', 'TeamViewerConsole', 'Telnet', 'TemplateGroup', 'TerminalConsole',
        'TFtp','VirtualBox', 'VirtualPC', 'VMRC', 'VMWare', 'VMWareConsole', 'VNC', 'VPN', 'Wayk', 'WaykDenConsole', 'WebBrowser', , 'WebDav', 'WindowsAdminCenter',
        'WindowsVirtualPC', 'XenServer',  'XWindow'

```yaml
Type: ConnectionType
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VaultMode
Vault where the command will be applied.
Three choices are offered:
- Default: Current vault that has been set.
- User: Vault specific to the current user.
- Global: Global vault of the data source.

```yaml
Type: VaultMode
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
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
For more information, type "Get-Help New-RDMEntry -detailed".
For technical information, type "Get-Help New-RDMEntry -full".

## RELATED LINKS

[Get-RDMEntry](http://127.0.0.1:1111/docs/Get-RDMEntry/)

[Remove-RDMEntry](http://127.0.0.1:1111/docs/Remove-RDMEntry/)

[Set-RDMEntry](http://127.0.0.1:1111/docs/Set-RDMEntry/)

