---
title: 'Remove-RDMUser'
date: 2024-11-06
---


# Remove-RDMUser

## SYNOPSIS
Delete an existing user.

## SYNTAX

### ID
```
Remove-RDMUser [-DeleteSQLLogin] [-Force] [-ID] <Guid> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### User
```
Remove-RDMUser [-DeleteSQLLogin] [-Force] [-User] <PSUserInfo[]> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
You will be prompted to confirm the delete.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $list = Get-User; Remove-RDMUser $list[1]
```

Retrieves the list of available users, deletes user at index 0 and from 1 from a list.

### EXAMPLE 2
```
PS C:\> $list = Get-User; $users = @($list[0], $list[1]); $Remove-RDMUser $users
```

Retrieves the list of available users, deletes user at index 1.

### EXAMPLE 3
```
PS C:\> Remove-RDMUser "{00000000-0000-0000-0000-000000000000}"
```

Delete security group with ID = "{00000000-0000-0000-0000-000000000000}".

### EXAMPLE 4
```
PS C:\> Remove-RDMUser -ID "{00000000-0000-0000-0000-000000000000}" -Force
```

Force delete of the user with ID = "{00000000-0000-0000-0000-000000000000}".

## PARAMETERS

### -DeleteSQLLogin
Forces removal of the SQL Login without confirmation by the user.
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

### -Force
Forces removal of the user without confirmation by the user.
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
Specifies the GUID of the user to be deleted from.

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

### -User
Specifies the array of users to be deleted.

Users must be retrieved by Get-RDMUser

```yaml
Type: PSUserInfo[]
Parameter Sets: User
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
For more information, type "Get-Help Remove-RDMUser -detailed".
For technical information, type "Get-Help Remove-RDMUser -full".

## RELATED LINKS

[Get-RDMUser](http://127.0.0.1:1111/docs/Get-RDMUser/)

[New-RDMUser](http://127.0.0.1:1111/docs/New-RDMUser/)

[New-RDMUser](http://127.0.0.1:1111/docs/New-RDMUser/)

[Remove-RDMUser](http://127.0.0.1:1111/docs/Remove-RDMUser/)

