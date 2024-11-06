---
title: 'New-DSSearchCriteria'
date: 2024-11-06
---


# New-DSSearchCriteria

## SYNOPSIS
Create a search criterion to be used in the Search-DSEntry

## SYNTAX

```
New-DSSearchCriteria [-By] <SearchItemType> [-ProgressAction <ActionPreference>] [-Match <SearchItemText>]
 -Value <String> [-CaseSensitive] [<CommonParameters>]
```

## DESCRIPTION
Create a search criterion to be used in the Search-DSEntry.
The vaults to be searched are determined in the Search-DSEntry cmdlet.
A criterion is determined at two fields: By, to indicate the field where the seach will be applied, and Value, the value whose type depend of the field.
For a standard string value, the parameter Match indicates how to search is conducted.
For date values, to use a custom interval, the value must be set to Custom and specified with the parameters After and Before.
Search by ConnectionType or Description will ignore PAM vaults.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> New-DSSearchCriteria -By Name -Match StartsWith -Value ThePrefix | Search-DSEntry
```

Search all entries whose name starts with ThePrefix in all vaults, excluding the User vault and the PAM vaults.

### EXAMPLE 2
```
PS C:\> $criteria = @();
        $criteria += New-DSSearchCriteria -By Username -Value AUsername;
        $criteria += New-DSSearchCriteria -By CreationDate -Value Last30Days;
        Search-DSEntry -InputObject $criteria -IncludePamVaults -IncludeVault @()
```

Search all PAM entries whose username contains AUsername created in the last 30 days.
Only the PAM vaults will be searched.

## PARAMETERS

### -By
Field on which the expression will be applied

```yaml
Type: SearchItemType
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Value
Search date interval for the creation or the last update.
For a custom value, use After and Before parameters.
By default, it will be set to Last Week.

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

### -CaseSensitive
Case sensitive search

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

### -Match
Condition the expression must respect.
By default, the condition is 'Contains'.

```yaml
Type: SearchItemText
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

### Devolutions.RemoteDesktopManager.Business.MultiVaultSearchItemData
## NOTES
For more information, type "Get-Help New-DSSearchCriteria -detailed".
For technical information, type "Get-Help New-DSSearchCriteria -full".

## RELATED LINKS

[Search-DSEntry](http://127.0.0.1:1111/docs/Search-DSEntry/)

