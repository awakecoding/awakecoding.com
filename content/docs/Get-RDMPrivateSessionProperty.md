---
title: 'Get-RDMPrivateSessionProperty'
date: 2024-11-06
---


# Get-RDMPrivateSessionProperty

## SYNOPSIS
Get the value of property given a session ID and path.

## SYNTAX

```
Get-RDMPrivateSessionProperty [-ID] <Guid> [[-Path] <String>] [-Property] <String>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Protected values will always return null.

Non value types will always return ".ToString()".

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMUserVaultSessionProperty -ID "{00000000-0000-0000-0000-000000000000}" -Property "Group"
```

Get the Group value from the session with ID = "{00000000-0000-0000-0000-000000000000}".

### EXAMPLE 2
```
PS C:\> Get-RDMUserVaultSessionProperty "{00000000-0000-0000-0000-000000000000}" "MetaInformation" "OS"
```

Get the MetaInformation.OS value from the session with ID = "{00000000-0000-0000-0000-000000000000}".

### EXAMPLE 3
```
PS C:\> $list = Get-RDMUserVaultSession; Get-RDMUserVaultSessionProperty -ID $list[1].ID -Path "MetaInformation" -Property "OS"
```

Retrieves the list of available sessions and then returns MetaInformation.OS value of the the second element in the list.

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
Specifies the ID of the session to get the password from.

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
For more information, type "Get-Help Get-RDMPrivateSessionProperty -detailed".
For technical information, type "Get-Help Get-RDMPrivateSessionProperty -full".

## RELATED LINKS

[Get-RDMSession](http://127.0.0.1:1111/docs/Get-RDMSession/)

[Set-RDMSessionProperty](http://127.0.0.1:1111/docs/Set-RDMSessionProperty/)

