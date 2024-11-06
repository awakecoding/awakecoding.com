---
title: 'Set-RDMRole'
date: 2024-11-06
---


# Set-RDMRole

## SYNOPSIS
Save/set the role.

## SYNTAX

```
Set-RDMRole [-Role] <PSRoleInfo> [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Save/set the role.
Role must be first fetch via role property of the Get-RDMRole cmdlet or via the New-RDMRole result.

## EXAMPLES

### EXAMPLE
```
PS C:\> $role = New-RDMRole -Name "New Role" ;Set-RDMRole $role
```

Create & save new role.

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
For more information, type "Get-Help Set-RDMRole -detailed".
For technical information, type "Get-Help Set-RDMRole -full".

## RELATED LINKS

[Get-RDMRole](http://127.0.0.1:1111/docs/Get-RDMRole/)

[New-RDMRole](http://127.0.0.1:1111/docs/New-RDMRole/)

[Set-RDMRoleProperty](http://127.0.0.1:1111/docs/Set-RDMRoleProperty/)

