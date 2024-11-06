---
title: 'Unprotect-DSSealedEntry'
date: 2024-11-06
---


# Unprotect-DSSealedEntry

## SYNOPSIS
Unseal an entry.

## SYNTAX

```
Unprotect-DSSealedEntry -ID <Guid> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Unseal an entry.

## EXAMPLES

### EXAMPLE
```
PS C:\> $entry = Get-DSEntry -FilterBy Name -FilterMatch ExactExpression -FilterValue 'InCaseOfEmergency';
PS C:\> Unprotect-DSSealedEntry -ID $entry.ID;
PS C:\> $sensitiveData = Get-DSEntrySensitiveData -EntryID $entry.ID;
PS C:\> Update-DSEntryBase -FromRDMConnection $entry
```

Unseal the entry 'InCaseOfEmergency', get its sensitive data, and reseal the entry.
The entry is sealed because the seal state value in $entry has never been modified.

## PARAMETERS

### -ID
ID of the entry to unseal.

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

### None
## NOTES
For more information, type "Get-Help Unprotect-DSSealedEntry -detailed".
For technical information, type "Get-Help Unprotect-DSSealedEntry -full".

## RELATED LINKS

[Get-DSEntry](http://127.0.0.1:1111/docs/Get-DSEntry/)

