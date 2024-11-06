---
title: 'Update-DSVault'
date: 2024-11-06
---


# Update-DSVault

## SYNOPSIS
Update a vault.

## SYNTAX

### VaultID
```
Update-DSVault -VaultID <Guid> [[-AllowedUsernameList] <String[]>] [[-AllowedApplicationList] <String[]>]
 [[-AllowedRolesList] <String[]>] [[-Description] <String>] [[-IsAllowedOffline] <Boolean>] [[-Name] <String>]
 [[-Password] <String>] [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### InputObject
```
Update-DSVault -InputObject <RepositoryEntity> [[-AllowedUsernameList] <String[]>]
 [[-AllowedApplicationList] <String[]>] [[-AllowedRolesList] <String[]>] [[-Description] <String>]
 [[-IsAllowedOffline] <Boolean>] [[-Name] <String>] [[-Password] <String>] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Update a vault using the supplied parameters.
If name is present, it cannot be null nor empty.
Backend does not verify password complexity, so use New-DSPassword to generate a strong password with house policy.

## EXAMPLES

### EXAMPLE
```
$UpdatedVault = @{
            VaultID                = "36120922-539d-4550-8567-fc4f21d77352"
            Name                   = "Test"
            Description            = "Test"
            IsAllowedOffline       = $false
            Password               = 'Pa$$w0rd!'
            AllowedUsersList       = @("User1")
            AllowedRolesList       = @("Role1")
            AllowedApplicationList = @("App1")
        }

    Update-DSVault @UpdatedVault -Verbose
```

Update an existing vault whose ID is 36120922-539d-4550-8567-fc4f21d77352.
All other fields are modified by the value specified in the hash table.

## PARAMETERS

### -AllowedApplicationList
Accept an array of strings containing application names (not app id) to add to the vault

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllowedRolesList
Accept an array of strings containing user group's name (not id) to add to the vault

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllowedUsernameList
Accept an array of strings containing usernames (not id) to add to the vault

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
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

### -Description
Vault's description

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Vault obtained from Get-DSVault

```yaml
Type: RepositoryEntity
Parameter Sets: InputObject
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IsAllowedOffline
Specify if the vault is allowed to be used while offline.
Its default value is true.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Vault's name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
Vault's master password.
Backend does not verify password complexity, so you should use New-DSPassword and choose a password in the list

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VaultID
Vault's ID to update

```yaml
Type: Guid
Parameter Sets: VaultID
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

### RemoteDesktopManager.PowerShellModule.Private.ServerResponse
## NOTES
For more information, type "Get-Help Update-DSVault -detailed".
For technical information, type "Get-Help Update-DSVault -full".

## RELATED LINKS

[Get-DSVault](http://127.0.0.1:1111/docs/Get-DSVault/)

[New-DSVault](http://127.0.0.1:1111/docs/New-DSVault/)

[Remove-DSVault](http://127.0.0.1:1111/docs/Remove-DSVault/)

