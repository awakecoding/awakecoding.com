---
title: 'Get-RDMUser'
date: 2024-11-06
---


# Get-RDMUser

## SYNOPSIS
Retrieve the list of available users.

## SYNTAX

```
Get-RDMUser [[-Name] <String>] [-CaseSensitive] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Retrieve the list of available users for the current selected data source.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMUser
```

Retrieves the list of available user.

### EXAMPLE 2
```
PS C:\> $list = Get-RDMUser; $list[0]
```

Retrieves the list of available users and displays the first item.

### EXAMPLE 3
```
PS C:\> $list = Get-RDMUser; $list[1].Description = "New Description";Set-RDMUser $list[1]
```

Retrieves the list of available users, modify the name of the second user, update the user.

### EXAMPLE 4
```
PS C:\> $user = Get-RDMUser -Name MyUser;
        $user.UserInfo.UserProfile.Company = 'UsersCompany';
        $user.UserInfo.UserProfile.Department = 'UsersDepartment';
        $user.UserInfo.UserProfile.Address = '123 UsersAddress';
        $user.UserInfo.UserProfile.Phone = '555-0100';
        Set-RDMUser -User $user
```

Update information about the user MyUser.

## PARAMETERS

### -CaseSensitive
Case sensitive

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

### -Name
User name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSUserInfo[]
## NOTES
For more information, type "Get-Help Get-RDMUser -detailed".
For technical information, type "Get-Help Get-RDMUser -full".

## RELATED LINKS

[Set-RDMUser](http://127.0.0.1:1111/docs/Set-RDMUser/)

[Set-RDMUserProperty](http://127.0.0.1:1111/docs/Set-RDMUserProperty/)

[New-RDMUser](http://127.0.0.1:1111/docs/New-RDMUser/)

[Remove-RDMUser](http://127.0.0.1:1111/docs/Remove-RDMUser/)

