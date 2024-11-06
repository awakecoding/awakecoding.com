---
title: 'New-DSEntityPermission'
date: 2024-11-06
---


# New-DSEntityPermission

## SYNOPSIS
Create a permission object for an entity

## SYNTAX

```
New-DSEntityPermission -Override <SecurityRoleOverride> -Right <SecurityRoleRight> [-User <String[]>]
 [-Role <String[]>] [-Application <String[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a permission object for an entity.
The entity can be an entry, a folder, a PAM entry, or the PAM root.

## EXAMPLES

### EXAMPLE
```
PS C:\> $permission = New-DSEntityPermission -Override Custom -Right Delete -User MyUserA, MyUserB
        $pamRoot = Get-DSPamFolder -VaultID $pamVaultID -Root
        Set-DSEntityPermission -EntityID $pamRoot.ID -Permissions $permission
```

For the PAM accounts in the PAM vault whose ID is $pamVaultID, the default right to delete will be assigned to MyUserA and MyUserB.

## PARAMETERS

### -Application
Application identities allowed to access the right

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

### -Override
Defines how the permissions are determined

```yaml
Type: SecurityRoleOverride
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Right
Defines which right is modified

```yaml
Type: SecurityRoleRight
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Role
Roles (User groups) allowed to access the right

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

### -User
Users allowed to access the right

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

### Devolutions.RemoteDesktopManager.Business.ConnectionPermission
## NOTES
For more information, type "Get-Help New-DSEntityPermission -detailed".
For technical information, type "Get-Help New-DSEntityPermission -full".

## RELATED LINKS
