---
title: 'Register-DSServerLicense'
date: 2024-11-06
---


# Register-DSServerLicense

## SYNOPSIS
Register the server license

## SYNTAX

```
Register-DSServerLicense -Serial <String> [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Register the server license.
For the other licenses, use the cmdlet Register-DSLicense.
Using this cmdlet will overwrite the existing server serial if it is already set.

## EXAMPLES

### EXAMPLE
```
PS C:\> Register-DSServerLicense -Serial XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
```

Set the server license

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

### -Serial
Server serial

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
For more information, type "Get-Help Register-DSServerLicense -detailed".
For technical information, type "Get-Help Register-DSServerLicense -full".

## RELATED LINKS
