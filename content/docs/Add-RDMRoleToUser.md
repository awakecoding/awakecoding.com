---
title: 'Add-RDMRoleToUser'
date: 2024-11-06
---


# Add-RDMRoleToUser

## SYNOPSIS
Add role to an user

## SYNTAX

### NameParams
```
Add-RDMRoleToUser [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [-RoleName] <String> [-UserName] <String> [<CommonParameters>]
```

### ObjectParams2
```
Add-RDMRoleToUser [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [-RoleName] <String> [-UserObject] <PSUserInfo> [<CommonParameters>]
```

### ObjectParams
```
Add-RDMRoleToUser [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [-RoleObject] <PSRoleInfo> [-UserObject] <PSUserInfo> [<CommonParameters>]
```

### NameParams2
```
Add-RDMRoleToUser [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [-RoleObject] <PSRoleInfo> [-UserName] <String> [<CommonParameters>]
```

## DESCRIPTION
Add role to an user

## EXAMPLES

### EXAMPLE
```
PS C:\> Add-RDMRoleToUser -RoleObject $role -UserObject $user;Set-RDMUser $user
```

Add role to an user.

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

### -RoleName
Role name

```yaml
Type: String
Parameter Sets: NameParams, ObjectParams2
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RoleObject
Role object, must be retrieved from Get-RDMRole or created via New-RDMRole.

```yaml
Type: PSRoleInfo
Parameter Sets: ObjectParams, NameParams2
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserName
User name

```yaml
Type: String
Parameter Sets: NameParams, NameParams2
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserObject
User object, must be retrieved from Get-RDMSecurityGroup or created via New-RDMUser.

```yaml
Type: PSUserInfo
Parameter Sets: ObjectParams2, ObjectParams
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

### System.String
The name of the role and/or user

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRoleInfo
The Role to which the user will be assigned

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSUserInfo
The user to which a role will be assigned

## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Add-RDMRoleToUser -detailed".
For technical information, type "Get-Help Add-RDMRoleToUser -full".

## RELATED LINKS
