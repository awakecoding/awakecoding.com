---
title: 'Get-RDMEntryProperty'
date: 2024-11-06
---


# Get-RDMEntryProperty

## SYNOPSIS
Get the specified property's value of an entry.

## SYNTAX

```
Get-RDMEntryProperty [-ID] <Guid> [[-Path] <String>] [-Property] <String> [-VaultMode <VaultMode>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get the specified property's value of an entry.
Protected values will always return null.
Those values are those who are ignored when entries are exported.
Non value types will always return ".ToString()".

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMEntryProperty -ID "{00000000-0000-0000-0000-000000000000}" -Property "Group"
```

Get the Group value from the entry with ID = "{00000000-0000-0000-0000-000000000000}".

### EXAMPLE 2
```
PS C:\> Get-RDMEntryProperty -ID "{00000000-0000-0000-0000-000000000000}" -Path "MetaInformation" -Property "OS"
```

Get the MetaInformation.OS value from the entry with ID = "{00000000-0000-0000-0000-000000000000}".

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

### -ID
Specifies the ID of the entry to get the property from.

Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Path
The path to the property being read (refernce RDM export xml).
If top level property do not sepcify parameter or pass empty string \[""\] or $null

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

### -Property
Property to read(get).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VaultMode
Vault where the command will be applied.
Three choices are offered:
- Default: Current vault that has been set.
- User: Vault specific to the current user.
- Global: Global vault of the data source.

```yaml
Type: VaultMode
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

### None
## NOTES
For more information, type "Get-Help Get-RDMEntryProperty -detailed".
For technical information, type "Get-Help Get-RDMEntryProperty -full".

## RELATED LINKS

[Get-RDMEntry](http://127.0.0.1:1111/docs/Get-RDMEntry/)

[Set-RDMEntryProperty](http://127.0.0.1:1111/docs/Set-RDMEntryProperty/)

