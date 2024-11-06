---
title: 'Set-RDMCurrentDataSource'
date: 2024-11-06
---


# Set-RDMCurrentDataSource

## SYNOPSIS
Set current active data source.

## SYNTAX

### PSDatasource
```
Set-RDMCurrentDataSource [[-DataSource] <PSDataSource>] [[-Password] <SecureString>] [[-Username] <String>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### ID
```
Set-RDMCurrentDataSource [-ID] <Guid> [[-Password] <SecureString>] [[-Username] <String>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Set current active data source.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Set-RDMCurrentDataSource "{00000000-0000-0000-0000-000000000000}"
```

Set active data source to the data source with ID = "{00000000-0000-0000-0000-000000000000}".

### EXAMPLE 2
```
PS C:\> $list = Get-RDMDataSource; Set-RDMCurrentDataSource $list[1].ID
```

Retrieves the list of available data sources and sets the current data source the the second element in the list.

## PARAMETERS

### -DataSource
Specifies the datasource to set current

```yaml
Type: PSDataSource
Parameter Sets: PSDatasource
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
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
Specifies the GUID of the data source to set as the current.

The value must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}

```yaml
Type: Guid
Parameter Sets: ID
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Password
Data source password

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Username
Data source username

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
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
For more information, type "Get-Help Set-RDMCurrentDataSource -detailed".
For technical information, type "Get-Help Set-RDMCurrentDataSource -full".

## RELATED LINKS

[Get-RDMDataSource](http://127.0.0.1:1111/docs/Get-RDMDataSource/)

