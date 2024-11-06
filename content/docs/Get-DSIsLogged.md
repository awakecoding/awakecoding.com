---
title: 'Get-DSIsLogged'
date: 2024-11-06
---


# Get-DSIsLogged

## SYNOPSIS
Verify if the session is etablished.

## SYNTAX

```
Get-DSIsLogged [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Verify if the session is etablished by a previous call to New-DSSession.

## EXAMPLES

### EXAMPLE
```
PS C:\> Get-DSIsLogged
```

Verify if the session is still established.

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

### System.Boolean
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.Boolean, System.Private.CoreLib, Version=8.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
## NOTES
For more information, type "Get-Help Get-DSIsLogged -detailed".
For technical information, type "Get-Help Get-DSIsLogged -full".

## RELATED LINKS

[Close-DSSession](http://127.0.0.1:1111/docs/Close-DSSession/)

[New-DSSession](http://127.0.0.1:1111/docs/New-DSSession/)

