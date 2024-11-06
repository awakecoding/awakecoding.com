---
title: 'Remove-RDMDeletedEntry'
date: 2024-11-06
---


# Remove-RDMDeletedEntry

## SYNOPSIS
Delete the history of one or more deleted entries

## SYNTAX

### Id
```
Remove-RDMDeletedEntry [-ID] <Guid> [-PassThru] [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### InputObject
```
Remove-RDMDeletedEntry [-InputObject] <PSConnectionHistory[]> [-PassThru] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Delete the history of one or more deleted entries.
For the data source supporting this functionality, every time an entry is deleted it is logged.
This cmdlet will delete the entries from the log, permanently deleting them.
The user can permanently delete an entry by its ID, or by the result of the cmdlet Get-DSDeletedEntry.
The user must be an administrator or vault owner this use this cmdlet.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $today = (Get-Date).Date;
        $deletedEntries = Get-RDMDeletedEntry | Where ModifiedDate -ge $today
        Remove-RDMDeletedEntry -InputObject $deletedEntries
```

Delete all entries deleted today

### EXAMPLE 2
```
PS C:\> $deletedEntries = Get-RDMDeletedEntry | Where GroupName -eq 'a\group\name'
        Remove-RDMDeletedEntry -InputObject $deletedEntries
```

Delete all deleted entries whose groupName is 'a\group\name'.

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
Histories to delete of a specific entry

```yaml
Type: Guid
Parameter Sets: Id
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Histories to delete obtained from Get-RDMDeletedEntry

```yaml
Type: PSConnectionHistory[]
Parameter Sets: InputObject
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -PassThru
Return the InputObject input.

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
Parameter Sets: Id
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionHistory[]
Array of PSConnectionHistory obtained from Get-RDMDeletedEntry

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionHistory[]
## NOTES
For more information, type "Get-Help Remove-RDMDeletedEntry -detailed".
For technical information, type "Get-Help Remove-RDMDeletedEntry -full".

## RELATED LINKS
