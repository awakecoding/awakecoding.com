---
title: 'Get-RDMCurrentDataSource'
date: 2024-11-06
---


# Get-RDMCurrentDataSource

## SYNOPSIS
Retrieve the active data source.

## SYNTAX

```
Get-RDMCurrentDataSource [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Retrieve the active data source.

## EXAMPLES

### EXAMPLE
```
PS C:\> $list = Get-RDMCurrentDataSource
```

The current active data sources.

## PARAMETERS

### -ForcePromptAnswer
Switch to use with caution.
It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions.
In case of multiple prompts, multiple values can be passed to this parameter.
Here are the accepted values:
- Yes: Accept the prompt.
Cover the OK and Automatic value.
- No: Refuse the yes/no/cancel prompt.
Cancel is the fallback option if there is not an option No.
- Cancel: Cancel the yes/no/cancel prompt.
No is the fallback option if there is not an option Cancel.

```yaml
Type: DialogResult[]
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSDataSource
## NOTES
For more information, type "Get-Help Get-RDMCurrentDataSource -detailed".
For technical information, type "Get-Help Get-RDMCurrentDataSource -full".

## RELATED LINKS
