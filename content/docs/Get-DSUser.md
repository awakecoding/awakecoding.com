---
title: 'Get-DSUser'
date: 2024-11-06
---


# Get-DSUser

## SYNOPSIS
Get one or more users

## SYNTAX

### GetPage (Default)
```
Get-DSUser [-PageNumber <Int32>] [-PageSize <Int32>] [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### GetAll
```
Get-DSUser [-All] [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### GetByID
```
Get-DSUser -UserID <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get a single user, a page of users, or all users.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-DSUser -All
```

Get all the users

### EXAMPLE 2
```
PS C:\> Get-DSUser -UserID $userID
```

Get a specific user

### EXAMPLE 3
```
PS C:\> Get-DSUser -PageNumber 1 -PageSize 10
```

Get the first page containing 10 users

## PARAMETERS

### -All
All users will be fetched.

```yaml
Type: SwitchParameter
Parameter Sets: GetAll
Aliases:

Required: True
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

### -PageNumber
Specify the page of users fetched.
First page is fetched by default.

```yaml
Type: Int32
Parameter Sets: GetPage
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PageSize
Number of users per page.
10 users per page by default.

```yaml
Type: Int32
Parameter Sets: GetPage
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserID
@{Text=}

```yaml
Type: Guid
Parameter Sets: GetByID
Aliases: CandidUserID

Required: True
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

### Devolutions.RemoteDesktopManager.Business.Entities.UserEntity
### Devolutions.RemoteDesktopManager.Business.Models.UserListItem[]
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.RemoteDesktopManager.Business.Entities.UserEntity, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.RemoteDesktopManager.Business.Models.UserListItem, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help Get-DSUser -detailed".
For technical information, type "Get-Help Get-DSUser -full".

## RELATED LINKS

[New-DSUser](http://127.0.0.1:1111/docs/New-DSUser/)

[Remove-DSUSer](http://127.0.0.1:1111/docs/Remove-DSUSer/)

[Update-DSUser](http://127.0.0.1:1111/docs/Update-DSUser/)

