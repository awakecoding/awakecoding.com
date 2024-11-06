---
title: 'New-DSRole'
date: 2024-11-06
---


# New-DSRole

## SYNOPSIS
Create a new role.

## SYNTAX

```
New-DSRole [-AuthenticationType <ServerUserType>] -Name <String> [-Description <String>] [-IsAdministrator]
 [-AllowDragAndDrop] [-CanAdd] [-CanEdit] [-CanDelete] [-OfflineMode <OfflineMode>] [-DomainName <String>]
 [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a new role and pre-validate offlineMode value, if supplied.

## EXAMPLES

### EXAMPLE
```
PS C:\> New-DSRole -AuthenticationType Builtin -Name NoDeleteNoOffline -Description "Role where the user can not delete and offline mode is disabled." -CanAdd -CanEdit -AllowDragAndDrop -OfflineMode Disabled
```

Create a role where the user is allowed to add and edit entries.
Deleting entries is not allowed.

## PARAMETERS

### -AllowDragAndDrop
Allow the drag and drop option

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

### -AuthenticationType
Authentication type.
Builtin by default.

```yaml
Type: ServerUserType
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CanAdd
Allow the user to add

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

### -CanDelete
Allow the user to delete

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

### -CanEdit
Allow the user to edit

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

### -Description
Role's description

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

### -DomainName
Domain name

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

### -IsAdministrator
Give the administrative rights

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

### -Name
Role's name

```yaml
Type: String
Parameter Sets: (All)
Aliases: DisplayName

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OfflineMode
Offline access permissions.
Disabled \< Read Only \< Read/Write

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
For more information, type "Get-Help New-DSRole -detailed".
For technical information, type "Get-Help New-DSRole -full".

## RELATED LINKS

[Get-DSRole](http://127.0.0.1:1111/docs/Get-DSRole/)

[Remove-DSRole](http://127.0.0.1:1111/docs/Remove-DSRole/)

[Update-DSRole](http://127.0.0.1:1111/docs/Update-DSRole/)

