---
title: 'Get-DSVaultPermission'
date: 2024-11-06
---


# Get-DSVaultPermission

## SYNOPSIS
Get the vault permissions.

## SYNTAX

```
Get-DSVaultPermission -PrincipalTypes <String[]> -VaultID <Guid> [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get the vault permissions.

## EXAMPLES

### EXAMPLE
```
PS C:\> $response = Get-DSVaultPermission -VaultID $vaultID -PrincipalType Applications;
        $apps = response.Data | Select Name, Description, IsMember;
        Set-DSVaultApplication -VaultID $vaultID -AllowedApplicationsList $apps[1].Name,$apps[3].Name -Update
```

Fetch all the applications for the vault $vaultID and keep only their name, description and isMember attributes.
Update the second and fourth applications of the list, changing their membership status.

## PARAMETERS

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

### -PrincipalTypes
Specify the type of users.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VaultID
Specify the ID of the desired vault.

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

### Devolutions.RemoteDesktopManager.Business.Entities.RepositoryAssignmentEntity[]
### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.RemoteDesktopManager.Business.Entities.RepositoryAssignmentEntity, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help Get-DSVaultPermission -detailed".
For technical information, type "Get-Help Get-DSVaultPermission -full".

## RELATED LINKS

[New-DSVault](http://127.0.0.1:1111/docs/New-DSVault/)

[Remove-DSVault](http://127.0.0.1:1111/docs/Remove-DSVault/)

[Update-DSVault](http://127.0.0.1:1111/docs/Update-DSVault/)

