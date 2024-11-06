---
title: 'Remove-RDMTemplate'
date: 2024-11-06
---


# Remove-RDMTemplate

## SYNOPSIS
Delete an existing template.

## SYNTAX

### ID
```
Remove-RDMTemplate [-Force] [-ID] <Guid> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### PSConnection
```
Remove-RDMTemplate [-Force] [-Template] <PSTemplate[]> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
You will be prompted to confirm the delete.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $list = Get-RDMSession; Remove-RDMSession $list[1]
```

Retrieves the list of available template, deletes template at index 1.

### EXAMPLE 2
```
PS C:\> Remove-RDMTemplate "{00000000-0000-0000-0000-000000000000}"
```

Delete the template with the ID = "{00000000-0000-0000-0000-000000000000}".

### EXAMPLE 3
```
PS C:\> Remove-RDMTemplate -ID "{00000000-0000-0000-0000-000000000000}" -Force
```

Force delete the template with the ID = "{00000000-0000-0000-0000-000000000000}".

### EXAMPLE 4
```
PS C:\> $templates = Get-RDMTemplate; Remove-RDMTemplate -Template $templates[0] -Force
```

Force delete the first template

## PARAMETERS

### -Force
Forces removal of the templates without confirmation by the user.
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
Specifies the ID of the template to be deleted.

Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

```yaml
Type: Guid
Parameter Sets: ID
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Template
Specifies the templates to remove

```yaml
Type: PSTemplate[]
Parameter Sets: PSConnection
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
For more information, type "Get-Help Remove-RDMTemplate -detailed".
For technical information, type "Get-Help Remove-RDMTemplate -full".

## RELATED LINKS

[Get-RDMDataSource](http://127.0.0.1:1111/docs/Get-RDMDataSource/)

[Set-RDMDataSource](http://127.0.0.1:1111/docs/Set-RDMDataSource/)

[Get-RDMSession](http://127.0.0.1:1111/docs/Get-RDMSession/)

