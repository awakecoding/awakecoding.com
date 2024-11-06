---
title: 'Get-RDMEntry'
date: 2024-11-06
---


# Get-RDMEntry

## SYNOPSIS
Retrieve entries in the specified vault

## SYNTAX

### Name (Default)
```
Get-RDMEntry [[-Name] <String[]>] [[-GroupName] <String[]>] [-Type <ConnectionType[]>] [-CaseSensitive]
 [-IncludeDocumentsStoredInDatabase] [-IncludeLocalPlaylists] [-IncludeSubFolders]
 [-IncludeUserSpecificSettings] [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Id
```
Get-RDMEntry [[-ID] <Guid[]>] [-IncludeDocumentsStoredInDatabase] [-IncludeLocalPlaylists]
 [-IncludeUserSpecificSettings] [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Literal
```
Get-RDMEntry [[-LiteralName] <String[]>] [[-LiteralGroupName] <String[]>] [-Type <ConnectionType[]>]
 [-CaseSensitive] [-IncludeDocumentsStoredInDatabase] [-IncludeLocalPlaylists] [-IncludeSubFolders]
 [-IncludeUserSpecificSettings] [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Retrieve entries in the specified vault.
The vault is specified by the VaultMode parameter.
    The parameter GroupName search for entries in a specific folder.
The switch IncludeSubFolders is required to look in all subfolders of the specified groups.
It is also possible to use the wildcard '*' at the end of the GroupName to look in the subfolders.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMEntry -IncludeDocumentsStoredInDatabase -IncludeLocalPlaylists -IncludeUserSpecificSettings
```

Retrieves all available entries in the current vault.
Documents, playlists and user specific settings will be included in the returned entries.

### EXAMPLE 2
```
PS C:\> Get-RDMEntry -Name Folder?, *Folder -VaultMode Global -CaseSensitive
```

Retrieves all available entries whose name is Folder appended with a character or is ending with Folder in the system vault.
The search is case sensitive.

### EXAMPLE 3
```
PS C:\> Get-RDMEntry -GroupName Folder\SubFolder -VaultMode User -IncludeSubFolders
```

Retrieves all available entries in the group named Folder\SubFolder and its subfolders.

## PARAMETERS

### -CaseSensitive
Filtering by name and group name will be case sensitive.

```yaml
Type: SwitchParameter
Parameter Sets: Name, Literal
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
Filter the entries by the group.
Support wildcard characters.

```yaml
Type: String[]
Parameter Sets: Name
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ID
Filter the entries by their ID

```yaml
Type: Guid[]
Parameter Sets: Id
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeDocumentsStoredInDatabase
Document entries returned will include attachment from documents

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
PlayList entries will include dependable connections and local playlists from playlist connection

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
Filtering by group name will include entries in subfolders

```yaml
Type: SwitchParameter
Parameter Sets: Name, Literal
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeUserSpecificSettings
Entries returned will include user specific settings

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

### -LiteralGroupName
Filter the entries by the group.
Support wildcard characters.

```yaml
Type: String[]
Parameter Sets: Literal
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LiteralName
Filter the entries by their name.
No wildcard supports.

```yaml
Type: String[]
Parameter Sets: Literal
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Filter the entries by their name.
Support wildcard characters.

```yaml
Type: String[]
Parameter Sets: Name
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
Filter the result by the connection type

```yaml
Type: ConnectionType[]
Parameter Sets: Name, Literal
Aliases:

Required: False
Position: Named
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]
## NOTES
For more information, type "Get-Help Get-RDMEntry -detailed".
For technical information, type "Get-Help Get-RDMEntry -full".

## RELATED LINKS

[New-RDMEntry](http://127.0.0.1:1111/docs/New-RDMEntry/)

[Remove-RDMEntry](http://127.0.0.1:1111/docs/Remove-RDMEntry/)

[Set-RDMEntry](http://127.0.0.1:1111/docs/Set-RDMEntry/)

