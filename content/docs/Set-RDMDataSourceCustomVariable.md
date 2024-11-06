---
title: 'Set-RDMDataSourceCustomVariable'
date: 2024-11-06
---


# Set-RDMDataSourceCustomVariable

## SYNOPSIS
Add or edit custom variables in the current data source settings.

## SYNTAX

```
Set-RDMDataSourceCustomVariable [-InputObject] <DataSourceVariable[]> [-PassThru]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Add or edit custom variables in the current data source settings.
The path to access those variables in Remote Desktop Manager is Administration -\> System Settings -\> Common -\> Custom Variables.
        The user must have the rights to access the data source settings.
Only advanced data source have settings.

## EXAMPLES

### EXAMPLE
```
PS C:\> $cv = Get-RDMDataSourceCustomVariable -Name $MyVar1$;
        $cv.Value = 'MyVarNewValue';
        Set-RDMDataSourceCustomVariable -InputObject $cv
```

Update the value of the custom variable named $MyVar1$

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

### -InputObject
Custom variables to save.

```yaml
Type: DataSourceVariable[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -PassThru
Return the custom variables that have been saved.

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

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: False
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
For more information, type "Get-Help Set-RDMDataSourceCustomVariable -detailed".
For technical information, type "Get-Help Set-RDMDataSourceCustomVariable -full".

## RELATED LINKS
