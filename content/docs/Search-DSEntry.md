---
title: 'Search-DSEntry'
date: 2024-11-06
---


# Search-DSEntry

## SYNOPSIS
Search an entry in the DVLS instance

## SYNTAX

### InputObject
```
Search-DSEntry [-InputObject] <MultiVaultSearchItemData[]> [-ExcludeVault <Guid[]>] [-IncludeVault <Guid[]>]
 [-IncludePAMVaults] [-IncludeUserVault] [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### Search
```
Search-DSEntry [-By] <SearchItemType> [-Match <SearchItemText>] -Value <String> [-ExcludeVault <Guid[]>]
 [-IncludeVault <Guid[]>] [-IncludePAMVaults] [-IncludeUserVault] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Search an entry in the DVLS instance.
There are two way to execute a search.
This cmdlet allows a simple search with a single criterion using three parameters: By, Match, and Value.
For a more complex search or ease of use, criteria can be created with the cmdlet New-DSSearchCriteria.
The InputObject will accept an array of those criteria.
By default, all vaults are searched, except the User vault and the PAM vaults.
For those two vaults, each will be included by using the corresponding parameter: IncludeUserVault and IncludePAMVaults.
It is also possible to search only a subset of vaults by using one of IncludeVault and ExcludeVault.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Search-DSEntry -By Name -Match ExactExpression -Value 'SomeValue' -IncludeVault @($pamVaultAID, $pamVaultBID)
```

Search in the two vaults identified by the IDs stored in $pamvaultAID and $pamVaultBID for an entry whose name named 'SomeValue'

### EXAMPLE 2
```
PS C:\> New-DSSearchCriteria -By Name -Match StartsWith -Value ThePrefix | Search-DSEntry
```

Search all entries whose name starts with ThePrefix in all vaults, excluding the User vault and the PAM vaults.

### EXAMPLE 3
```
PS C:\> $criteria = @();
        $criteria += New-DSSearchCriteria -By Username -Value AUsername;
        $criteria += New-DSSearchCriteria -By CreationDate -Value Last30Days;
        Search-DSEntry -InputObject $criteria -IncludePamVaults -IncludeVault @()
```

Search all PAM entries whose username contains AUsername created in the last 30 days.
Only the PAM vaults will be searched.

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

### -By
Field on which the expression will be applied

```yaml
Type: SearchItemType
Parameter Sets: Search
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeVault
Vaults to be excluded from the search.

```yaml
Type: Guid[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludePAMVaults
Include the PAM Vaults

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

### -IncludeUserVault
Include the user vault

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

### -IncludeVault
Vaults to be searched.
If not specified, all of them will be searched except the PAM Vaults and User vault.
For the PAM vaults or User vault, use the corresponding switch.

```yaml
Type: Guid[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Search criteria created from New-DSSearchCriteria

```yaml
Type: MultiVaultSearchItemData[]
Parameter Sets: InputObject
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Match
Condition the expression must respect.
By default, the condition is 'Contains'.

```yaml
Type: SearchItemText
Parameter Sets: Search
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Value
String value

```yaml
Type: String
Parameter Sets: Search
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

### Devolutions.RemoteDesktopManager.Business.MultiVaultSearchItemData[]
Array of criteria created by New-DSSearchCriteria calls.

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=7.4.4.500, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]
## NOTES
For more information, type "Get-Help Search-DSEntry -detailed".
For technical information, type "Get-Help Search-DSEntry -full".

## RELATED LINKS

[New-DSSearchCriteria](http://127.0.0.1:1111/docs/New-DSSearchCriteria/)

