---
title: 'Update-DSUser'
date: 2024-11-06
---


# Update-DSUser

## SYNOPSIS
Update a user

## SYNTAX

```
Update-DSUser -UserID <Guid> [-CustomRoles <String[]>] [-UserType <UserType>] [-UserLicenceType <Object>]
 [-Username <String>] [-Password <String>] [-FirstName <String>] [-LastName <String>] [-Email <String>]
 [-Language <String>] [-Enabled <Boolean>] [-UserMustChangePasswordAtNextLogin <Boolean>]
 [-CompanyName <String>] [-JobTitle <String>] [-Department <String>] [-GravatarEmail <String>]
 [-Address <String>] [-State <String>] [-CountryName <String>] [-Phone <String>] [-Workphone <String>]
 [-CellPhone <String>] [-Fax <String>] [-HasAccessRDM <Boolean>] [-HasAccessWebLogin <Boolean>]
 [-HasAccessLauncher <Boolean>] [-HasAccessWeb <Boolean>] [-HasAccessCLI <Boolean>]
 [-AllowDragAndDrop <Boolean>] [-CanViewInformations <Boolean>] [-CanViewGlobalLogs <Boolean>]
 [-CanImport <Boolean>] [-CanExport <Boolean>] [-OfflineMode <OfflineMode>] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Update a user with the supplied parameters.

## EXAMPLES

### EXAMPLE
```
PS C:\> Update-DSUSer -UserId $uid -CustomRoles "d8f94f53-e073-48fd-85b7-d4bfb127bd2d"
```

Assign the role "d8f94f53-e073-48fd-85b7-d4bfb127bd2d" to the user whose id is $uid.
All others previous roles are unassigned.

## PARAMETERS

### -Address
Address of the user.

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

### -AllowDragAndDrop
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AsLegacyResponse
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object.
Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

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

### -CanExport
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CanImport
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CanViewGlobalLogs
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CanViewInformations
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CellPhone
Cell phone number to contact the user.

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

### -CompanyName
Company name that employs the user.

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

### -CountryName
Country of the user.

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

### -CustomRoles
Role ids the user will be assigned to.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Department
Department in which the user is working.

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

### -Email
Email of the user.

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

### -Enabled
Determine if the user is activated.
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Fax
Fax number to contact the user.

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

### -FirstName
First name of the user.

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

### -GravatarEmail
Gravatar email to obtain the user's avatar.

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

### -HasAccessCLI
Allow the user to use to CLI (command line interface).
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HasAccessLauncher
Allow the user can open remote connections with Devolutions Launcher.
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HasAccessRDM
Allow the user to access to Devolutions Server through RDM.
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HasAccessWeb
Allow the user to use Devolutions Server web interface.
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HasAccessWebLogin
Allow the user to auto fill username and passwords on websites with Devolutions Web Login.
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -JobTitle
Job title of the user.

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

### -Language
Language of the user's web interface.
English by default.

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

### -LastName
Last name of the user.

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

### -OfflineMode
Offline mode.
Read/Write by default.

```yaml
Type: OfflineMode
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
Password of the user.

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

### -Phone
Phone number to contact the user.

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

### -State
State of the user.

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

### -UserID
Id of the user to update.

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserLicenceType
Select the type of the license that the user has: Default: Connection Management.
| Connection Management: for users who open remote connections.
| Password Management: for users who only use Devolutions Server as a password manager.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserMustChangePasswordAtNextLogin
Force the user to change the password next time they log on.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Username
Ignored.
User login name.

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

### -UserType
User type defining his rights.
User by default.
Choices: Administrator: grant full administrative rights to the user.
| Read only user: grant only the View access to the user.
| Restricted user: select which rights to grant to the user.
| User: grant all basic rights to the user (Add, Edit, Delete).

```yaml
Type: UserType
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Workphone
Work phone number to contact the user.

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

### RemoteDesktopManager.PowerShellModule.Private.ServerResponse
## NOTES
For more information, type "Get-Help Update-DSUser -detailed".
For technical information, type "Get-Help Update-DSUser -full".

## RELATED LINKS

[Get-DSUser](http://127.0.0.1:1111/docs/Get-DSUser/)

[New-DSUser](http://127.0.0.1:1111/docs/New-DSUser/)

[Remove-DSUSer](http://127.0.0.1:1111/docs/Remove-DSUSer/)

