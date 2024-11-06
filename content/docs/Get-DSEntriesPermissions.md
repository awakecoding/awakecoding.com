---
title: 'Get-DSEntriesPermissions'
date: 2024-11-06
---


# Get-DSEntriesPermissions

## SYNOPSIS
Gets the permissions for all entries in a vault or for a specific entry

## SYNTAX

### VaultID (Default)
```
Get-DSEntriesPermissions [-VaultID] <Guid> [-IncludePrincipalsName] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### EntryID
```
Get-DSEntriesPermissions [-EntryID] <Guid> [-IncludePrincipalsName] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### VaultName
```
Get-DSEntriesPermissions [-VaultName] <String> [-IncludePrincipalsName] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Recursivly gets all permissions for all entries in a given vault or for a specific entry.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-DSEntriesPermissions -VaultID $vaultID
```

Get all permisissions in the vault whose ID is stored in $vaultID.

### EXAMPLE 2
```
PS C:\> Get-DSEntriesPermissions -VaultName 'My Vault'
```

Get all permisissions in the vault name 'My Vault'.

### EXAMPLE 3
```
PS C:\> Get-DSEntriesPermissions -Entry $entryID
```

Get all permisissions for the entry whose ID is stored in $entryID.

## PARAMETERS

### -EntryID
ID of the entry

```yaml
Type: Guid
Parameter Sets: EntryID
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludePrincipalsName
Add a PrincipalsName field containing the name associated with the ids of the Principals field.

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
Id of the vault containing the entries

```yaml
Type: Guid
Parameter Sets: VaultID
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VaultName
Name of the vault containing the entries.
Case sensitive.

```yaml
Type: String
Parameter Sets: VaultName
Aliases:

Required: True
Position: 1
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

### System.Management.Automation.PSCustomObject[]
## NOTES
For more information, type "Get-Help Get-DSEntriesPermissions -detailed".
For technical information, type "Get-Help Get-DSEntriesPermissions -full".

## RELATED LINKS
