---
title: 'Get-DSEntrySubConnections'
date: 2024-11-06
---


# Get-DSEntrySubConnections

## SYNOPSIS
Return the subconnections of the entry.

## SYNTAX

```
Get-DSEntrySubConnections [-EntryID] <Guid> [[-VaultPassword] <String>] [-AsRDMConnections] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Return the subconnections of the entry.

## EXAMPLES

### EXAMPLE
```
PS C:\> Get-DSEntrySubConnections -EntryId $entryId
```

Get the subconnetions for the entry identified by $entryId.

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

### -AsRDMConnections
Return as ConnectionInfoEntity instead of a partial connection

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
Id of the entry

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VaultPassword
Password of the vault

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
### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=7.4.4.500, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]
## NOTES
For more information, type "Get-Help Get-DSEntrySubConnections -detailed".
For technical information, type "Get-Help Get-DSEntrySubConnections -full".

## RELATED LINKS

[Get-DSEntry](http://127.0.0.1:1111/docs/Get-DSEntry/)

[Get-DSEntryPasswordHistory](http://127.0.0.1:1111/docs/Get-DSEntryPasswordHistory/)

[Get-DSEntrySensitiveData](http://127.0.0.1:1111/docs/Get-DSEntrySensitiveData/)

