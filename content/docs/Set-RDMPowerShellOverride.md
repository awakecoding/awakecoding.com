---
title: 'Set-RDMPowerShellOverride'
date: 2024-11-06
---


# Set-RDMPowerShellOverride

## SYNOPSIS
Save the module override values

## SYNTAX

```
Set-RDMPowerShellOverride [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Save the module override values.
Override must be first fetch via the Get-RDMPowerShellOverride cmdlet.

## EXAMPLES

### EXAMPLE
```
PS C:\> $override = Get-RDMPowerShellOverride;  $override.OptionFilePath = NewPathValue; Set-RDMPowerShellOverride
```

Change the option file path

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
For more information, type "Get-Help Set-RDMPowerShellOverride -detailed".
For technical information, type "Get-Help Set-RDMPowerShellOverride -full".

## RELATED LINKS
