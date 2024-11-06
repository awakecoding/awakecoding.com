---
title: 'Unprotect-RDMSealedEntry'
date: 2024-11-06
---


# Unprotect-RDMSealedEntry

## SYNOPSIS
Unseal an entry.

## SYNTAX

### Id
```
Unprotect-RDMSealedEntry -ID <Guid> [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### InputObject
```
Unprotect-RDMSealedEntry -InputObject <PSSealedConnection> [-VaultMode <VaultMode>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
To unseal entries, ensure that you are using a Devolutions Server data source, as only this type supports the operation.
To find the sealed entries, use Get-RDMSealedEntry.

## EXAMPLES

### EXAMPLE
```
PS C:\> Get-RDMSealedEntry -Name 'InCaseOfEmergency' | Unprotect-RDMSealedEntry;
PS C:\> $unsealedEntry = Get-RDMEntry -Name 'InCaseOfEmergency';
PS C:\> $password = Get-RDMEntryPassword -InputObject $unsealedEntry -AsPlainText;
PS C:\> $unsealedEntry.SealState = 'Sealed';
PS C:\> Set-RDMEntry -InputObject $unsealedEntry;
```

Unseal the entry 'InCaseOfEmergency', get its password, and reseal the entry

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
ID of the entry to seal

```yaml
Type: Guid
Parameter Sets: Id
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Entry to seal

```yaml
Type: PSSealedConnection
Parameter Sets: InputObject
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
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

### None
## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Unprotect-RDMSealedEntry -detailed".
For technical information, type "Get-Help Unprotect-RDMSealedEntry -full".

## RELATED LINKS

[Get-RDMSealedEntry](http://127.0.0.1:1111/docs/Get-RDMSealedEntry/)

