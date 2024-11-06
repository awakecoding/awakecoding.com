---
title: 'New-RDMUser'
date: 2024-11-06
---


# New-RDMUser

## SYNOPSIS
Create a new user instance.

## SYNTAX

```
New-RDMUser [-Administrator] [-BypassAzureADValidationEvenIfUnsupported] [-Login <String>] [-SetUser]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-Email <String>]
 [-Password <SecureString>] [<CommonParameters>]
```

## DESCRIPTION
Create a user instance.
The instance has not yet been saved.
Use the SetUser parameter or assign the result to a variable then call "Set-RDMUser $s" to save the user.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $user = New-RDMUser -AuthenticationType SqlServer -Login 'PSTest' -Password (ConvertTo-SecureString -String 'password' -AsPlainText -Force) -SetUser
```

Create & save new user.

### EXAMPLE 2
```
PS C:\> $user = New-RDMUser -Login 'domain\username' -IntegratedSecurity -SkipCreateSQLServerLogin; $user.UserType = 'User'; Set-RDMUser $user
```

Before everything, the administrator add the login/user to the database.
Create the user domain\username with integrated security.
The SkipCreateSQLServerLogin switch indicates the administrator will manually add the information in the database.
Change the user type from read-only to user and save the user.

### EXAMPLE 3
```
PS C:\> $user = = New-RDMUser -AuthenticationType SqlServer -Login 'PSTest' -Password (ConvertTo-SecureString -String 'password' -AsPlainText -Force);
        $user.UserInfo.UserProfile.Company = 'UsersCompany';
        $user.UserInfo.UserProfile.Department = 'UsersDepartment';
        $user.UserInfo.UserProfile.Address = '123 UsersAddress';
        $user.UserInfo.UserProfile.Phone = '555-0100';
        Set-RDMUser -User $user
```

Create a user and add some details about him before saving him.

## PARAMETERS

### -Administrator
Gives the user administrator rights

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

### -BypassAzureADValidationEvenIfUnsupported
Bypass validation preventing creation of AzureAD user when connected with a database user.
Do so at your own risk.

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

### -Email
User email.
Available when using a all data source except DODB

```yaml
Type: String
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

### -Login
Login.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
User password.
Available when using a SQL Server data source and integrated security is not used

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetUser
Set the user in the data source

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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSUserInfo
## NOTES
For more information, type "Get-Help New-RDMUser -detailed".
For technical information, type "Get-Help New-RDMUser -full".

## RELATED LINKS

[Get-RDMUser](http://127.0.0.1:1111/docs/Get-RDMUser/)

[Set-RDMUser](http://127.0.0.1:1111/docs/Set-RDMUser/)

[Set-RDMUserProperty](http://127.0.0.1:1111/docs/Set-RDMUserProperty/)

[Remove-RDMUser](http://127.0.0.1:1111/docs/Remove-RDMUser/)

