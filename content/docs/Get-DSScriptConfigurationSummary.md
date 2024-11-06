---
title: 'Get-DSScriptConfigurationSummary'
date: 2024-11-06
---


# Get-DSScriptConfigurationSummary

## SYNOPSIS
Get a summary of the PAM script configurations

## SYNTAX

```
Get-DSScriptConfigurationSummary [[-Name] <String>] [-CaseSensitive] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Get a summary of the PAM script configurations.
The summary includes the configuration's ID, name, and template ID.

## EXAMPLES

### EXAMPLE
```
PS C:\> Get-DSScriptConfigurationSummary -Name 'My script config' | Select -ExpandProperty ID
```

Retrieve the ID of the configuration named 'My script config'

## PARAMETERS

### -CaseSensitive
Case sensitive search.

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

### -Name
Filter the script configurations by their name.

```yaml
Type: String
Parameter Sets: (All)
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

### RemoteDesktopManager.PowerShellModule.Private.models.PamScriptConfigurationSummary[]
## NOTES
For more information, type "Get-Help Get-DSScriptConfigurationSummary -detailed".
For technical information, type "Get-Help Get-DSScriptConfigurationSummary -full".

## RELATED LINKS
