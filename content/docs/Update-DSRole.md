---
title: 'Update-DSRole'
date: 2024-11-06
---


# Update-DSRole

## SYNOPSIS
Create a new role.

## SYNTAX

```
Update-DSRole -RoleId <Guid> [-Name <String>] [-Description <String>] [-IsAdministrator <Boolean>]
 [-AllowDragAndDrop <Boolean>] [-CanAdd <Boolean>] [-CanEdit <Boolean>] [-CanDelete <Boolean>]
 [-CanImport <Boolean>] [-CanExport <Boolean>] [-DenyAddInRoot <Boolean>] [-OfflineMode <OfflineMode>]
 [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a new role and pre-validate offlineMode value, if supplied.

## EXAMPLES

### EXAMPLE
```
PS C:\> Update-DSRole -RoleId $roleID -IsAdministrator $false -AllowDragAndDrop $false -CanAdd $false -CanEdit $false -CanDelete $false -CanImport $false -CanExport $false -DenyAddInRoot $true -OfflineMode Disabled
```

Remove all rights (add, delete, edit, export, import, drag and drop, add in root), admistrator status and offline access of the role whose id is $roleID.

## PARAMETERS

### -AllowDragAndDrop
Allow the drag and drop option

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

### -CanAdd
Allow the user to add

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

### -CanDelete
Allow the user to delete

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

### -CanEdit
Allow the user to edit

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

### -CanExport
Allow the user to export

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
Allow the user to import

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

### -DenyAddInRoot
Prevent the user from adding entries in the root.

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

### -IsAdministrator
Give the administrative rights

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

### -Name
Role's name

```yaml
Type: String
Parameter Sets: (All)
Aliases: DisplayName

Required: False
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

### -RoleId
Id of the role to be updated.

```yaml
Type: Guid
Parameter Sets: (All)
Aliases: CandidRoleId

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

### RemoteDesktopManager.PowerShellModule.Private.ServerResponse
## NOTES
For more information, type "Get-Help Update-DSRole -detailed".
For technical information, type "Get-Help Update-DSRole -full".

## RELATED LINKS

[Get-DSRole](http://127.0.0.1:1111/docs/Get-DSRole/)

[New-DSRole](http://127.0.0.1:1111/docs/New-DSRole/)

[Remove-DSRole](http://127.0.0.1:1111/docs/Remove-DSRole/)

