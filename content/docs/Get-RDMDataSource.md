---
title: 'Get-RDMDataSource'
date: 2024-11-06
---


# Get-RDMDataSource

## SYNOPSIS
Retrieve the list of available data sources.

## SYNTAX

```
Get-RDMDataSource [-CaseSensitive] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Retrieve the list of available data sources.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $list = Get-RDMDataSource
```

Retrieves the list of available data sources.

### EXAMPLE 2
```
PS C:\> $list = Get-RDMDataSource; $list[0]
```

Retrieves the list of available data sources and displays the first item.

### EXAMPLE 3
```
PS C:\> $list = Get-RDMDataSource; Set-RDMDataSource $list[1].ID
```

Retrieves the list of available data sources and sets the current data source the the second element in the list.

## PARAMETERS

### -CaseSensitive
Case sensitive

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

### -Name
Data source name

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

### None
## NOTES
For more information, type "Get-Help Get-RDMDataSource -detailed".
For technical information, type "Get-Help Get-RDMDataSource -full".

## RELATED LINKS
