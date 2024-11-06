---
title: 'New-HubEntryPermission'
date: 2024-11-06
---


# New-HubEntryPermission

## SYNOPSIS

## SYNTAX

### UserWithRolePermissions
```
New-HubEntryPermission -VaultId <Guid> -EntryId <Guid> -UserId <Guid> -EntryRoleId <Guid>
 [-HubContext <HubContext>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### UserWithCustomPermissions
```
New-HubEntryPermission -VaultId <Guid> -EntryId <Guid> -UserId <Guid> -EntryPermission <EntryPermissionRole>
 [-HubContext <HubContext>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### GroupWithRolePermissions
```
New-HubEntryPermission -VaultId <Guid> -EntryId <Guid> -GroupId <Guid> -EntryRoleId <Guid>
 [-HubContext <HubContext>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### GroupWithCustomPermissions
```
New-HubEntryPermission -VaultId <Guid> -EntryId <Guid> -GroupId <Guid> -EntryPermission <EntryPermissionRole>
 [-HubContext <HubContext>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -EntryId
Id of the Hub Entry

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

### -EntryPermission
Set custom entry permission

```yaml
Type: EntryPermissionRole
Parameter Sets: UserWithCustomPermissions, GroupWithCustomPermissions
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EntryRoleId
Set predefined permissions based on Hub Entry Roles

```yaml
Type: Guid
Parameter Sets: UserWithRolePermissions, GroupWithRolePermissions
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupId
Id of the Hub Group

```yaml
Type: Guid
Parameter Sets: GroupWithRolePermissions, GroupWithCustomPermissions
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HubContext
Hub context

```yaml
Type: HubContext
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserId
Id of the Hub User

```yaml
Type: Guid
Parameter Sets: UserWithRolePermissions, UserWithCustomPermissions
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VaultId
Id of the Hub Vault

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
For more information, type "Get-Help New-HubEntryPermission -detailed".
For technical information, type "Get-Help New-HubEntryPermission -full".

## RELATED LINKS
