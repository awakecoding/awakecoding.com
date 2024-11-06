---
title: 'Import-RDMDataSource'
date: 2024-11-06
---


# Import-RDMDataSource

## SYNOPSIS
Import RDM DataSource from a file

## SYNTAX

```
Import-RDMDataSource -Path <String> [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Import RDM DataSource from a file

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Import-RDMDataSource -Path "C:\MyFile.rdd" | Set-RDMDataSource
```

Import the data source from a configuration and save it

### EXAMPLE 2
```
PS C:\> $ds = Import-RDMDataSource -Path "C:\MyFile.rdd"; $ds.Name = "ANewName"; Set-RDMDataSource -DataSource $ds
```

Import the data source from a configuration file, rename it "ANewName" and save it

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

### -Path
Path where the file is loaded.
Must end with .rdd

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
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

### None
## NOTES
For more information, type "Get-Help Import-RDMDataSource -detailed".
For technical information, type "Get-Help Import-RDMDataSource -full".

## RELATED LINKS
