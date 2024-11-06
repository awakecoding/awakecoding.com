---
title: 'Get-RDMSession'
date: 2024-11-06
---


# Get-RDMSession

## SYNOPSIS
Retrieve the list of available sessions.

## SYNTAX

```
Get-RDMSession [-CaseSensitive] [-GroupName <String>] [-ID <Guid>] [-Type <ConnectionType>]
 [-IncludeDocumentsStoredInDatabase] [-IncludeLocalPlaylists] [-IncludeSubFolders]
 [-IncludeUserSpecificSettings] [-LiteralName <String>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [-Name <String>] [<CommonParameters>]
```

## DESCRIPTION
Retrieve the list of available sessions for the current selected data source.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMSession
```

Retrieves the list of available sessions.

### EXAMPLE 2
```
PS C:\> $list = Get-RDMSession; $list[0]
```

Retrieves the list of available sessions and displays the first item.

### EXAMPLE 3
```
PS C:\> $list = Get-RDMSession; $list[1].Name = "New Name";Set-RDMSession $list[1]
```

Retrieves the list of available sessions, modify the name of the second session, update the session.

## PARAMETERS

### -CaseSensitive
Case sensitive

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

### -GroupName
GroupName

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

### -ID
ID of the desired session

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

### -IncludeDocumentsStoredInDatabase
Include attachment from documents

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

### -IncludeLocalPlaylists
Include dependable connections and local playlists from playlist connection

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

### -IncludeSubFolders
Include subfolders from the group name

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

### -IncludeUserSpecificSettings
Include user specific settings

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

### -LiteralName
Session name.
No characters are interpreted as wildcards.

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

### -Name
Session name

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

### -Type
Filter the result by the connection type

```yaml
Type: ConnectionType
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
For more information, type "Get-Help Get-RDMSession -detailed".
For technical information, type "Get-Help Get-RDMSession -full".

## RELATED LINKS

[Get-RDMDataSource](http://127.0.0.1:1111/docs/Get-RDMDataSource/)

[Set-RDMDataSource](http://127.0.0.1:1111/docs/Set-RDMDataSource/)

[Set-RDMSession](http://127.0.0.1:1111/docs/Set-RDMSession/)

