---
title: 'Get-DSRole'
date: 2024-11-06
---


# Get-DSRole

## SYNOPSIS
Fetch one or more existing roles.

## SYNTAX

### GetPage (Default)
```
Get-DSRole [-PageNumber <Int32>] [-PageSize <Int32>] [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### GetAll
```
Get-DSRole [-All] [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### GetByID
```
Get-DSRole -RoleID <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Fetch one or more existing roles.
Three alternative methods are possible: all roles, a single one or a page of roles.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-DSRole -All
```

Get all the roles

### EXAMPLE 2
```
PS C:\> Get-DSRole -RoleID $roleID
```

Get a specific role

### EXAMPLE 3
```
PS C:\> Get-DSRole -PageNumber 1 -PageSize 10
```

Get the first page containing 10 roles

## PARAMETERS

### -All
All roles will be fetched.

```yaml
Type: SwitchParameter
Parameter Sets: GetAll
Aliases: GetAll

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
Specify the page of roles fetched.
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
Number of roles per page.
10 roles per page by default.

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

### -RoleID
@{Text=}

```yaml
Type: Guid
Parameter Sets: GetByID
Aliases: Id

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

### Devolutions.RemoteDesktopManager.Business.Entities.RoleEntity
### Devolutions.Server.ApiWrapper.Models.RoleBaseReference[]
### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.ApiWrapper.Models.RoleBaseReference, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.RemoteDesktopManager.Business.Entities.RoleEntity, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help Get-DSRole -detailed".
For technical information, type "Get-Help Get-DSRole -full".

## RELATED LINKS

[New-DSRole](http://127.0.0.1:1111/docs/New-DSRole/)

[Remove-DSRole](http://127.0.0.1:1111/docs/Remove-DSRole/)

[Update-DSRole](http://127.0.0.1:1111/docs/Update-DSRole/)

