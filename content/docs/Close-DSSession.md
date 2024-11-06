---
title: 'Close-DSSession'
date: 2024-11-06
---


# Close-DSSession

## SYNOPSIS
Terminate the connection with your Devolutions Server instance.

## SYNTAX

```
Close-DSSession [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Terminate the connection with your Devolutions Server by clearing global variables required to keep it up and running.

## EXAMPLES

### EXAMPLE
```
PS C:\\> Close-DSSession
```

Terminate the connection with your Devolutions Server instance.

## PARAMETERS

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
For more information, type "Get-Help Close-DSSession -detailed".
For technical information, type "Get-Help Close-DSSession -full".

## RELATED LINKS

[Get-DSIsLogged](http://127.0.0.1:1111/docs/Get-DSIsLogged/)

[New-DSSession](http://127.0.0.1:1111/docs/New-DSSession/)

