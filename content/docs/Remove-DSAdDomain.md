---
title: 'Remove-DSAdDomain'
date: 2024-11-06
---


# Remove-DSAdDomain

## SYNOPSIS
Remove a domain.

## SYNTAX

```
Remove-DSAdDomain -DomainID <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Remove a domain identified by the supplied id.

## EXAMPLES

### EXAMPLE
```
PS C:\> $domains = Get-DSAdDomain; Remove-DSAdDomain -DomainID $domains.Data[0].ID
```

Get all domains.
After spotting the ID of the domain to delete (first one in this case), delete the domain.

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

### -DomainID
Id of the domain to delete.

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

### RemoteDesktopManager.PowerShellModule.Private.ServerResponse
## NOTES
For more information, type "Get-Help Remove-DSAdDomain -detailed".
For technical information, type "Get-Help Remove-DSAdDomain -full".

## RELATED LINKS

[Get-DSAdDomain](http://127.0.0.1:1111/docs/Get-DSAdDomain/)

