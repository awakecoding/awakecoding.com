---
title: 'Get-RDMDataSourceCustomVariable'
date: 2024-11-06
---


# Get-RDMDataSourceCustomVariable

## SYNOPSIS
Get the custom variables stored in the current data source

## SYNTAX

```
Get-RDMDataSourceCustomVariable [[-Name] <String>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get the custom variables stored in the current data source.
The path to access those variables in Remote Desktop Manager is Administration -\> System Settings -\> Common -\> Custom Variables.
        The user must have the rights to access the data source settings.
Only advanced data source have settings.

## EXAMPLES

### EXAMPLE
```
PS C:\> $customVars = Get-RDMDataSourceCustomVariable -Name $VAR*
```

Obtain all custom variables stored in the data source whose name start with $Var.

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

### -Name
Filter the custom variables by their name.

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

### Devolutions.RemoteDesktopManager.Business.DataSourceVariable[]
## NOTES
For more information, type "Get-Help Get-RDMDataSourceCustomVariable -detailed".
For technical information, type "Get-Help Get-RDMDataSourceCustomVariable -full".

## RELATED LINKS
