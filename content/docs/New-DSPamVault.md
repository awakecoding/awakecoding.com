---
title: 'New-DSPamVault'
date: 2024-11-06
---


# New-DSPamVault

## SYNOPSIS
Create a new PAM vault

## SYNTAX

```
New-DSPamVault -Name <String> [-Description <String>] [-Visibility <VaultAllowAccessRequestRole>]
 [-Owner <String[]>] [-User <String[]>] [-Role <String[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Create a new PAM vault.
To set permissions for the vault, you must apply them at the root level.
The root connection has the same id as the vault.
Either use 'Get-DSPamFolder' combined with Update-DSPamFolder or 'Set-DSEntityPermission' to update the permissions.

## EXAMPLES

### EXAMPLE
```
PS C:\> $entities = @('Bob', 'UserGroupA', '12345678-1234-1234-1234-123456781234')
PS C:\> New-DSPamVault -Name 'MyNewVault' -Description 'A description' -Owner $entities
```

Create a PAM vault named 'MyNewVault' owned by the users 'Bob' and '12345678-1234-1234-1234-123456781234', and the user group 'UserGroupA'

## PARAMETERS

### -Description
Description of the PAM vault

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

### -Name
Name of the PAM vault

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Owner
Assign owners to the vault with their ID or name

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

### -Role
Give the user groups access to the vault

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
Give the users access to the vault

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

### -Visibility
Visibility of the vault

```yaml
Type: VaultAllowAccessRequestRole
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRepositoryInfo
## NOTES
For more information, type "Get-Help New-DSPamVault -detailed".
For technical information, type "Get-Help New-DSPamVault -full".

## RELATED LINKS

[Get-DSPamVault](http://127.0.0.1:1111/docs/Get-DSPamVault/)

[Remove-DSPamVault](http://127.0.0.1:1111/docs/Remove-DSPamVault/)

[Update-DSPamVault](http://127.0.0.1:1111/docs/Update-DSPamVault/)

