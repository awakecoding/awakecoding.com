---
title: 'New-DSVault'
date: 2024-11-06
---


# New-DSVault

## SYNOPSIS
Create a new vault

## SYNTAX

```
New-DSVault [[-AllowedApplicationList] <String[]>] [[-AllowedRolesList] <String[]>]
 [[-AllowedUsernameList] <String[]>] [[-Description] <String>] [[-IsAllowedOffline] <Boolean>] -Name <String>
 [[-Password] <String>] [-SecurityLevel <VaultSecurityLevel>] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a new vault and add users, applications and roles to it if the respective list is supplied.

## EXAMPLES

### EXAMPLE
```
$Vault = @{
        Name                   = 'NewVault'
        Description            = 'This is a description for the new vault.'
        IsAllowedOffline       = $true
        Password               = 'Pa$$w0rd!'
        AllowedUsernameList    = @("User1")
        AllowedRolesList       = @("Role1", "Role2")
        AllowedApplicationList = @("App1")
        }

        $response = New-DSVault @Vault
```

Create the vault NewVault who can be accessed by User1, App1 and the roles Role1 and Role2.

## PARAMETERS

### -AllowedApplicationList
Accept an array of strings containing application names (not app id) to add to the vault

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

### -AllowedRolesList
Accept an array of strings containing user group's name (not id) to add to the vault

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

### -AllowedUsernameList
Accept an array of strings containing usernames (not id) to add to the vault

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
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
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IsAllowedOffline
Specify if the vault is allowed to be used while offline.
It is allowed by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Name of the vault

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

### -Password
Vault's master password.
Backend does not verify password complexity, so you should use New-DSPassword and choose a password in the list

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

### -SecurityLevel
Set the security level.
A high security level disables the offline mode.
The default value is High.

```yaml
Type: VaultSecurityLevel
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
For more information, type "Get-Help New-DSVault -detailed".
For technical information, type "Get-Help New-DSVault -full".

## RELATED LINKS

[Get-DSVault](http://127.0.0.1:1111/docs/Get-DSVault/)

[Remove-DSVault](http://127.0.0.1:1111/docs/Remove-DSVault/)

[Update-DSVault](http://127.0.0.1:1111/docs/Update-DSVault/)

