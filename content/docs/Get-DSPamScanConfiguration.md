---
title: 'Get-DSPamScanConfiguration'
date: 2024-11-06
---


# Get-DSPamScanConfiguration

## SYNOPSIS
Get the PAM scan configurations

## SYNTAX

### Name
```
Get-DSPamScanConfiguration [[-Name] <String>] [-CaseSensitive] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### Literal
```
Get-DSPamScanConfiguration [-LiteralName] <String> [-CaseSensitive] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Get the PAM scan configurations, which can be filtered by name. 
Use the 'Name' parameter for wildcard searches, and the 'LiteralName' parameter for exact matches as it doesn't interpret characters as wildcards.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $configurations = Get-DSPamScanConfiguration -Name 'Config*'
```

Get all PAM scan configurations with names starting with 'Config'

### EXAMPLE 2
```
PS C:\> $configuration = Get-DSPamScanConfiguration -LiteralName 'Config [A]'
```

Get the PAM scan configuration named 'Config \[A\]'.
The 'LiteralName' parameter ensures that the characters '\[' and '\]' are not treated as wildcards.

## PARAMETERS

### -CaseSensitive
Case sensitive search

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

### -LiteralName
Filter the scan configurations by their name.
No characters will be interpreted as wildcards.

```yaml
Type: String
Parameter Sets: Literal
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Filter the scan configurations by their name

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: False
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

### Devolutions.Server.NetworkDiscovery.Dto.ScanConfigurationDto[]
## NOTES
For more information, type "Get-Help Get-DSPamScanConfiguration -detailed".
For technical information, type "Get-Help Get-DSPamScanConfiguration -full".

## RELATED LINKS

[Get-DSPamScanResult](http://127.0.0.1:1111/docs/Get-DSPamScanResult/)

