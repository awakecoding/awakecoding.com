---
title: 'New-HubSystemVaultPermission'
date: 2024-11-06
---


# New-HubSystemVaultPermission

## SYNOPSIS

## SYNTAX

### UserWithRolePermissions
```
New-HubSystemVaultPermission -UserId <Guid> -VaultRoleId <Guid> [-HubContext <HubContext>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### UserWithCustomPermissions
```
New-HubSystemVaultPermission -UserId <Guid> -SystemVaultPermission <VaultPermission> [-HubContext <HubContext>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### GroupWithRolePermissions
```
New-HubSystemVaultPermission -GroupId <Guid> -VaultRoleId <Guid> [-HubContext <HubContext>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### GroupWithCustomPermissions
```
New-HubSystemVaultPermission -GroupId <Guid> -SystemVaultPermission <VaultPermission>
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

### -SystemVaultPermission
Set custom system vault permission

```yaml
Type: VaultPermission
Parameter Sets: UserWithCustomPermissions, GroupWithCustomPermissions
Aliases:

Required: True
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

### -VaultRoleId
Set predefined permissions based on Hub Vault Roles

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
For more information, type "Get-Help New-HubSystemVaultPermission -detailed".
For technical information, type "Get-Help New-HubSystemVaultPermission -full".

## RELATED LINKS
