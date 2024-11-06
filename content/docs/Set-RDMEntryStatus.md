---
title: 'Set-RDMEntryStatus'
date: 2024-11-06
---


# Set-RDMEntryStatus

## SYNOPSIS
Set the status on the specified entry.

## SYNTAX

### Id
```
Set-RDMEntryStatus [-ID] <Guid[]> [-Status] <String> [[-Message] <String>] [-PassThru] [-Refresh] [-Set]
 [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

### InputObject
```
Set-RDMEntryStatus [-InputObject] <PSConnection[]> [-Status] <String> [[-Message] <String>] [-PassThru]
 [-Refresh] [-Set] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Set the status on the specified entry.
To persist the new status, the switch Set must be used.
    To modify the status, the user must have the appropriate rights: add for a new entry, and edit for an existing one.

## EXAMPLES

### EXAMPLE
```
PS C:\> $entry = Get-RDMEntry -Name 'EntryA';
    Set-RDMEntrystatus -InputObject $entry -Status 'Expired' -Set
```

Update the specified entry's status to 'Expired'

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
ID of the entries to modify.
Use the VaultMode parameter to search in the User vault or the Global vault.

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
Specifies the entries to set the status to

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

### -Message
Status message

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

### -PassThru
Return the modified entry.

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
Send refresh notification to Remote Desktop Manager application.
Use Set switch to persist the modification.

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

### -Set
Save the entry in the current data source.

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

### -Status
Status type

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection
PSConnection object of the entry to modify the status from.

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection
## NOTES
For more information, type "Get-Help Set-RDMEntryStatus -detailed".
For technical information, type "Get-Help Set-RDMEntryStatus -full".

## RELATED LINKS

[Get-RDMEntryDomain](http://127.0.0.1:1111/docs/Get-RDMEntryDomain/)

