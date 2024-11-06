---
title: 'Remove-DSEntry'
date: 2024-11-06
---


# Remove-DSEntry

## SYNOPSIS
Remove a specified entry from the database.

## SYNTAX

```
Remove-DSEntry -EntryID <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Remove an entry specified by its id from the database.

## EXAMPLES

### EXAMPLE
```
PS C:\> Remove-DSEntry -EntrID $id
```

Delete the entry whose ID is stored in $id

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

### -EntryID
ID of the entry to delete

```yaml
Type: Guid
Parameter Sets: (All)
Aliases: CandidEntryID

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
For more information, type "Get-Help Remove-DSEntry -detailed".
For technical information, type "Get-Help Remove-DSEntry -full".

## RELATED LINKS

[Get-DSEntry](http://127.0.0.1:1111/docs/Get-DSEntry/)

