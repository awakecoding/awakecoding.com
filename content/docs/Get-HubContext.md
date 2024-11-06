---
title: 'Get-HubContext'
date: 2024-11-06
---


# Get-HubContext

## SYNOPSIS
Get the current context or all available contexts

## SYNTAX

```
Get-HubContext [-ListAvailable] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
If ListAvailable provided, list all PSHubContext set in PowerShell session.
If ListAvailable not provided, get the current PSHubContext who will be used for all other Hub commands.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-HubContext
```

Obtain the current context

### EXAMPLE 2
```
PS C:\> Get-HubContext -ListAvailable
```

Obtain the available contexts

## PARAMETERS

### -ListAvailable
List all Hub context

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

### Devolutions.Hub.PowerShell.Entities.PowerShell.PSHubContext
### System.Collections.Generic.List`1[[Devolutions.Hub.PowerShell.Entities.PowerShell.PSHubContext, Devolutions.PowerShell, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help Get-HubContext -detailed".
For technical information, type "Get-Help Get-HubContext -full".

## RELATED LINKS
