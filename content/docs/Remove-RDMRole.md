---
title: 'Remove-RDMRole'
date: 2024-11-06
---


# Remove-RDMRole

## SYNOPSIS
Delete an existing role.

## SYNTAX

```
Remove-RDMRole [-Force] [-ID] <Guid> [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
You will be prompted to confirm the delete.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $list = Get-RDMRole; Remove-RDMRole $list[1].ID
```

Retrieves the list of available sessions, deletes role at index 1.

### EXAMPLE 2
```
PS C:\> Remove-RDMRole "{00000000-0000-0000-0000-000000000000}"
```

Delete session with ID = "{00000000-0000-0000-0000-000000000000}".

### EXAMPLE 3
```
PS C:\> Remove-RDMRole -ID "{00000000-0000-0000-0000-000000000000}" -Force
```

Force delete of the role with ID = "{00000000-0000-0000-0000-000000000000}".

## PARAMETERS

### -Force
Forces removal of the role without confirmation by the user.
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
Specifies the GUID of the role to be deleted from.

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
For more information, type "Get-Help Remove-RDMRole -detailed".
For technical information, type "Get-Help Remove-RDMRole -full".

## RELATED LINKS

[Get-RDMRole](http://127.0.0.1:1111/docs/Get-RDMRole/)

[New-RDMRole](http://127.0.0.1:1111/docs/New-RDMRole/)

[Set-RDMRoleProperty](http://127.0.0.1:1111/docs/Set-RDMRoleProperty/)

[Set-RDMRole](http://127.0.0.1:1111/docs/Set-RDMRole/)

