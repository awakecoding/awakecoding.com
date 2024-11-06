---
title: 'Get-DSVault'
date: 2024-11-06
---


# Get-DSVault

## SYNOPSIS
Get vault(s) from the Devolutions Server instance.

## SYNTAX

### GetPage (Default)
```
Get-DSVault [-Descending] [-PageNumber <Int32>] [-PageSize <Int32>] [-SortField <String>] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### GetAll
```
Get-DSVault [-All] [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### GetAllLegacy
```
Get-DSVault [-Legacy] [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### GetOne
```
Get-DSVault -VaultID <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get vaults in the Devolutions Server instance in three ways: a single vault by its ID, all vaults, or a subset of vaults from pagination.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $vaults = Get-DSVault -All
```

Retrieve all vaults and store the ServerResponse\<RepositoryEntity\[\]\> in $vaults.

### EXAMPLE 2
```
PS C:\> $vault = Get-DSVault -VaultID 00000000-0000-0000-0000-000000000000
```

Retrieve the vault with the matching ID and store the ServerResponse\<RepositoryEntity\> in $vault.

### EXAMPLE 3
```
PS C:\> $vaults = Get-DSVault -PageNumber 2 -PageSize 10
```

Retrieve the second page of 10 vaults and store the ServerResponse\<RepositoryEntity\[\]\> in $vaults.

## PARAMETERS

### -All
Fetches all vaults.

```yaml
Type: SwitchParameter
Parameter Sets: GetAll
Aliases:

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

### -Descending
Sort the field in the descending order.

```yaml
Type: SwitchParameter
Parameter Sets: GetPage
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Legacy
Deprecated.
Do not use.

```yaml
Type: SwitchParameter
Parameter Sets: GetAllLegacy
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PageNumber
Specify the desired page.
If not specified, the first one will be returned.

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
Number of vaults in a page.
If not specified, there will be 25 vaults per page.

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

### -SortField
Specify the field on which the vaults will be ordered.

```yaml
Type: String
Parameter Sets: GetPage
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VaultID
Specify the ID of the desired vault.

```yaml
Type: Guid
Parameter Sets: GetOne
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

### Devolutions.RemoteDesktopManager.Business.Entities.RepositoryEntity[]
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.RemoteDesktopManager.Business.Entities.RepositoryEntity, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.RemoteDesktopManager.Business.Entities.RepositoryEntity, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help Get-DSVault -detailed".
For technical information, type "Get-Help Get-DSVault -full".

## RELATED LINKS

[New-DSVault](http://127.0.0.1:1111/docs/New-DSVault/)

[Remove-DSVault](http://127.0.0.1:1111/docs/Remove-DSVault/)

[Update-DSVault](http://127.0.0.1:1111/docs/Update-DSVault/)

