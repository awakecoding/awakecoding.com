---
title: 'New-RDMDataSourceCustomVariable'
date: 2024-11-06
---


# New-RDMDataSourceCustomVariable

## SYNOPSIS
Create a new custom variable stored in the current data source

## SYNTAX

```
New-RDMDataSourceCustomVariable [[-Description] <String>] [-Name] <String> [-SetCustomVariable]
 [-Value] <String> [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Create a new custom variable stored in the current data source.
The path to access those variables in Remote Desktop Manager is Administration -\> System Settings -\> Common -\> Custom Variables.
        The user must have the rights to access the data source settings.
Only advanced data source have settings.

## EXAMPLES

### EXAMPLE
```
PS C:\> New-RDMDataSourceCustomVariable -Name MyVarName -Value MyVarValue -Description MyVarDesc -SetCustomVariable
```

Create or update a custom variable in the data source settings.

## PARAMETERS

### -Description
Description of the custom variable

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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
Name of the variable.
Two special characters can be used: '_' everywhere and '$' at the start and the end.
Other characters are not allowed.
All lower letters will be converted to upper characters.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetCustomVariable
Save the new custom variable in the data source

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

### -Value
Value of the variable

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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

### Devolutions.RemoteDesktopManager.Business.DataSourceVariable
## NOTES
For more information, type "Get-Help New-RDMDataSourceCustomVariable -detailed".
For technical information, type "Get-Help New-RDMDataSourceCustomVariable -full".

## RELATED LINKS
