---
title: 'Get-DSEntry'
date: 2024-11-06
---


# Get-DSEntry

## SYNOPSIS
Get entry(ies) from your Devolutions Server instance.

## SYNTAX

### GetPage (Default)
```
Get-DSEntry [[-FolderID] <Guid>] [[-PageNumber] <Int32>] [[-PageSize] <Int32>] [-SearchAllVaults]
 [-VaultID <Guid>] [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### GetAll
```
Get-DSEntry [-All] [-SearchAllVaults] [-VaultID <Guid>] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### GetById
```
Get-DSEntry [-AsRDMConnection] [-EntryId] <Guid> [-SearchAllVaults] [-VaultID <Guid>]
 [[-VaultPassword] <String>] [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Filter
```
Get-DSEntry [[-FilterBy] <SearchItemType>] [[-FilterMatch] <SearchItemText>] [-FilterValue] <String>
 [-SearchAllVaults] [-VaultID <Guid>] [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Using different parameter sets, returns either all entries (from one or all vaults), a specific entry by filter (Get-Help Get-DSEntry -Parameter FilterBy) or paginated results.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-DSEntry
```

Get the first page containing 25 entries directly in the root of the default vault.

### EXAMPLE 2
```
PS C:\> Get-DSEntry -SearchAllVaults $EntryId $entryId -AsRDMConnection
```

Get the entry by its ID.
The search covers all vaults.
The

### EXAMPLE 3
```
PS C:\> Get-DSEntry -VaultID $vaultID -All
```

Get all entries of the specified vault.

### EXAMPLE 4
```
PS C:\> Get-DSEntry -Filter Name -FilterMatch StartsWith -FilterValue ABC -SearchAllVaults
```

Get all entries whose name starts with "ABC" in all the vaults.

## PARAMETERS

### -All
Get all entries.

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

### -AsRDMConnection
Return a ConnectionInfoEntity instead of a partial connection

```yaml
Type: SwitchParameter
Parameter Sets: GetById
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EntryId
Id of the desired entry

```yaml
Type: Guid
Parameter Sets: GetById
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterBy
Field on which the filter will be applied.
It will be on the Name by default.

```yaml
Type: SearchItemType
Parameter Sets: Filter
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterMatch
Determine the condition of the search.
Default condition is Contains.

```yaml
Type: SearchItemText
Parameter Sets: Filter
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterValue
Value used in the filter

```yaml
Type: String
Parameter Sets: Filter
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FolderID
Folder where the entries will be fetched.
The default value will the root.

```yaml
Type: Guid
Parameter Sets: GetPage
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PageNumber
Determine which page is fetched.

```yaml
Type: Int32
Parameter Sets: GetPage
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PageSize
Number of entries in a page.
Default value is 25 entries per page.

```yaml
Type: Int32
Parameter Sets: GetPage
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SearchAllVaults
All vaults will bew considered for the search.

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

### -VaultID
Id of the vault to be searched

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VaultPassword
Password of the vault

```yaml
Type: String
Parameter Sets: GetById
Aliases:

Required: False
Position: 2
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
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=7.4.4.500, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]
### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=7.4.4.500, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]
### System.Management.Automation.PSObject[]
## NOTES
For more information, type "Get-Help Get-DSEntry -detailed".
For technical information, type "Get-Help Get-DSEntry -full".

## RELATED LINKS

[Get-DSEntryPasswordHistory](http://127.0.0.1:1111/docs/Get-DSEntryPasswordHistory/)

[Get-DSEntrySensitiveData](http://127.0.0.1:1111/docs/Get-DSEntrySensitiveData/)

[Get-DSEntrySubConnections](http://127.0.0.1:1111/docs/Get-DSEntrySubConnections/)

