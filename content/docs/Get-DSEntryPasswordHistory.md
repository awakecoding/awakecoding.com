---
title: 'Get-DSEntryPasswordHistory'
date: 2024-11-06
---


# Get-DSEntryPasswordHistory

## SYNOPSIS
Return the password history for a given entry.

## SYNTAX

```
Get-DSEntryPasswordHistory -EntryId <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns the password history for a given entry.
The user must have the appropriate rights.

## EXAMPLES

### EXAMPLE
```
PS C:\> Get-DSEntryPasswordHistory -EntryId $entryId
```

Get the password historyfor the entry identified by $entryId.

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

### -EntryId
Id of the entry

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

### System.Management.Automation.PSObject[]
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.Management.Automation.PSObject[], System.Management.Automation, Version=7.4.4.500, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]
## NOTES
For more information, type "Get-Help Get-DSEntryPasswordHistory -detailed".
For technical information, type "Get-Help Get-DSEntryPasswordHistory -full".

## RELATED LINKS

[Get-DSEntry](http://127.0.0.1:1111/docs/Get-DSEntry/)

[Get-DSEntrySensitiveData](http://127.0.0.1:1111/docs/Get-DSEntrySensitiveData/)

[Get-DSEntrySubConnections](http://127.0.0.1:1111/docs/Get-DSEntrySubConnections/)

