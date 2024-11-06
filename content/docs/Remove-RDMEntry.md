---
title: 'Remove-RDMEntry'
date: 2024-11-06
---


# Remove-RDMEntry

## SYNOPSIS
Delete existing entries.

## SYNTAX

### Id
```
Remove-RDMEntry [-ID] <Guid[]> [-PassThru] [-Refresh] [-VaultMode <VaultMode>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### InputObject
```
Remove-RDMEntry [-InputObject] <PSConnection[]> [-PassThru] [-Refresh] [-VaultMode <VaultMode>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Delete existing entries.
If an entry is a folder, all entries it contains are also deleted.
For each entry, the user must have the delete permission.
Use the VaultMode parameter to specify the user vault ou global vault if required.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMEntry -Name Entry* | Remove-RDMEntry
```

Delete all entries whose name starts with Entry in the current vault.

### EXAMPLE 2
```
PS C:\> Get-RDMEntry -Name Entry* -VaultMode User | Remove-RDMEntry -VaultMode User -Confirm
```

Delete all entries whose name starts with Entry in the user vault.
The user will be prompted before each entry.

### EXAMPLE 3
```
PS C:\> $deletedEntries = Remove-RDMEntry -ID $folderID, $entryID -VaultMode Global -PassThru
```

Delete the entries specified by the ids stored in $folderID and $entryID in the system vault.
All deleted entries, including the entries contained in the folder specified by $folderID, are stored in $deletedEntries.

## PARAMETERS

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

### -ID
IDs of the entries be deleted.

```yaml
Type: Guid[]
Parameter Sets: Id
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Specifies the entries to delete.

```yaml
Type: PSConnection[]
Parameter Sets: InputObject
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -PassThru
Return all deleted entries, including entries in a deleted folder.

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

### -Refresh
Refresh the entries in the vault.
For modification in bulk, use Update-RDMEntries after the modifications instead of this switch.

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

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: False
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]
Entries to delete obtained from Get-RDMEntry for a specfic vault mode.

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]
## NOTES
For more information, type "Get-Help Remove-RDMEntry -detailed".
For technical information, type "Get-Help Remove-RDMEntry -full".

## RELATED LINKS

[Get-RDMEntry](http://127.0.0.1:1111/docs/Get-RDMEntry/)

[New-RDMEntry](http://127.0.0.1:1111/docs/New-RDMEntry/)

[Set-RDMEntry](http://127.0.0.1:1111/docs/Set-RDMEntry/)

