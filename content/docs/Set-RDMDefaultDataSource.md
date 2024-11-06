---
title: 'Set-RDMDefaultDataSource'
date: 2024-11-06
---


# Set-RDMDefaultDataSource

## SYNOPSIS
Set the data source loaded when the application starts

## SYNTAX

### Name (Default)
```
Set-RDMDefaultDataSource [[-Name] <String>] [[-OnStartUpOption] <String>] [-CaseSensitive]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Id
```
Set-RDMDefaultDataSource [-ID] <Guid> [[-OnStartUpOption] <String>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Set the data source loaded when the application starts.
It is possible to modify the 'On start up' option to choose how the loaded data source is chosen.
The choices are: LastUsed, Prompt, and UseDefault.
Modifying this option will not alter the current default or last used data source.
To change the data source loaded on the next application start, the parameter ID or Name must be used.
This will modify the last used or default data source to load.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Set-RDMDefaultDataSource -Name MyDefaultDS -OnStartUpOption UseDefault
```

Set the data source 'MyDefaultDS' as the default one that will be loaded on every application starts.

### EXAMPLE 2
```
PS C:\> Set-RDMDefaultDataSource -Name MyDefaultDs -CaseSensitive
```

Set the data source 'MyDefaultDs' as the default or last used data source.
The search for the data source is case sensitive.

## PARAMETERS

### -CaseSensitive
Case sensitive search of the data source

```yaml
Type: SwitchParameter
Parameter Sets: Name
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

### -ID
ID of the data source to set as default or last used

```yaml
Type: Guid
Parameter Sets: Id
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Name of the data source to set as default or last used

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

### -OnStartUpOption
Option to determine which data source to open when the applications starts

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
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

### None
## NOTES
For more information, type "Get-Help Set-RDMDefaultDataSource -detailed".
For technical information, type "Get-Help Set-RDMDefaultDataSource -full".

## RELATED LINKS
