---
title: 'Remove-RDMRoleToUser'
date: 2024-11-06
---


# Remove-RDMRoleToUser

## SYNOPSIS
Remove a role to an user.

## SYNTAX

```
Remove-RDMRoleToUser [-Role] <PSRoleInfo> [-User] <PSUserInfo> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Remove a role to an user.

## EXAMPLES

### EXAMPLE
```
PS C:\> Remove-RDMRoleToUser -Role $role -User $user
```

Remove role to an user.

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

### -Role
Role object, must be retrieved from Get-RDMRole or created via New-RDMRole.

```yaml
Type: PSRoleInfo
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -User
User object, must be retrieved from Get-RDMUser or created via New-RDMUser.

```yaml
Type: PSUserInfo
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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

### None
## NOTES
For more information, type "Get-Help Remove-RDMRoleToUser -detailed".
For technical information, type "Get-Help Remove-RDMRoleToUser -full".

## RELATED LINKS

[Add-RDMRoleToUser](http://127.0.0.1:1111/docs/Add-RDMRoleToUser/)

[Get-RDMUser](http://127.0.0.1:1111/docs/Get-RDMUser/)

[Set-RDMUser](http://127.0.0.1:1111/docs/Set-RDMUser/)

[New-RDMUser](http://127.0.0.1:1111/docs/New-RDMUser/)

[Get-RDMRole](http://127.0.0.1:1111/docs/Get-RDMRole/)

[New-RDMRole](http://127.0.0.1:1111/docs/New-RDMRole/)

