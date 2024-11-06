---
title: 'New-RDMRole'
date: 2024-11-06
---


# New-RDMRole

## SYNOPSIS
Create a new role instance.

## SYNTAX

```
New-RDMRole [-SetRole] [[-Description] <String>] [-Name] <String> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a role instance.
The instance has not yet been saved.
Assign the result to a variable then call "Set-RDMRole $s" to save the role.

## EXAMPLES

### EXAMPLE
```
PS C:\> $role = New-RDMRole -Name "New Role" ;Set-RDMRole $role
```

Create & save new role.

## PARAMETERS

### -Description
Role description.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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

### -Name
New role name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetRole
Save the new role.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRoleInfo
## NOTES
For more information, type "Get-Help New-RDMRole -detailed".
For technical information, type "Get-Help New-RDMRole -full".

## RELATED LINKS

[Get-RDMRole](http://127.0.0.1:1111/docs/Get-RDMRole/)

[Set-RDMRole](http://127.0.0.1:1111/docs/Set-RDMRole/)

[Set-RDMRoleProperty](http://127.0.0.1:1111/docs/Set-RDMRoleProperty/)

[Remove-RDMRole](http://127.0.0.1:1111/docs/Remove-RDMRole/)

