---
title: 'Remove-RDMRepository'
date: 2024-11-06
---


# Remove-RDMRepository

## SYNOPSIS
Delete an existing repository.

## SYNTAX

```
Remove-RDMRepository [-Force] [-ID] <Guid> [[-RepositoryDestination] <PSRepositoryInfo>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
You will be prompted to confirm the delete.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $list = Get-RDMRepository; Remove-RDMRepository $list[1].ID
```

Retrieves the list of available repositories, deletes repository at index 1.

### EXAMPLE 2
```
PS C:\> Remove-RDMRepository "{00000000-0000-0000-0000-000000000000}"
```

Delete repository with ID = "{00000000-0000-0000-0000-000000000000}".

### EXAMPLE 3
```
PS C:\> Remove-RDMRepository-ID "{00000000-0000-0000-0000-000000000000}" -Force
```

Force delete of the repository with ID = "{00000000-0000-0000-0000-000000000000}".

## PARAMETERS

### -Force
Forces removal of the repository without confirmation by the user.
Optional.

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

### -ID
Specifies the GUID of the repository to be deleted from.

Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -RepositoryDestination
Specifies the new repository to move the sessions from the deleted repository to.

```yaml
Type: PSRepositoryInfo
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
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
For more information, type "Get-Help Remove-RDMRepository -detailed".
For technical information, type "Get-Help Remove-RDMRepository -full".

## RELATED LINKS

[Get-RDMRepository](http://127.0.0.1:1111/docs/Get-RDMRepository/)

[Set-RDMRepository](http://127.0.0.1:1111/docs/Set-RDMRepository/)

[New-RDMRepository](http://127.0.0.1:1111/docs/New-RDMRepository/)

[Remove-RDMRepository](http://127.0.0.1:1111/docs/Remove-RDMRepository/)

