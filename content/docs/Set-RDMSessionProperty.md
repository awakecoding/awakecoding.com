---
title: 'Set-RDMSessionProperty'
date: 2024-11-06
---


# Set-RDMSessionProperty

## SYNOPSIS
Set the value of property given a session ID and path.

## SYNTAX

```
Set-RDMSessionProperty [-ID] <Guid> [-Refresh] [[-Path] <String>] [-Property] <String> [-Value] <Object>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Protected values will always return null.

Non value types will always return ".ToString()".

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Set-RDMSessionProperty -ID "{00000000-0000-0000-0000-000000000000}" -Property "Group" -Value "My New Group Name"
```

Set the Group value from the session with ID = "{00000000-0000-0000-0000-000000000000}".

### EXAMPLE 2
```
PS C:\> Set-RDMSessionProperty "{00000000-0000-0000-0000-000000000000}" "MetaInformation" "OS" "Windows Server 2008 R2"
```

Set the MetaInformation.OS value from the session with ID = "{00000000-0000-0000-0000-000000000000}".

### EXAMPLE 3
```
PS C:\> $list = Get-RDMSession; Set-RDMSessionProperty -ID $list[1].ID -Path "MetaInformation" -Property "OS" -Value "Windows Server 2008 R2"
```

Retrieves the list of available sessions and then sets the MetaInformation.OS value of the the second element in the list.

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
The path to the property being read (reference RDM export xml).
In the case of top level property do not specify parameter or pass empty string \[""\] or $null.

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
Property to set.

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

### -Refresh
Send refresh notification to Remote Desktop Manager application.

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
New value.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
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
For more information, type "Get-Help Set-RDMSessionProperty -detailed".
For technical information, type "Get-Help Set-RDMSessionProperty -full".

## RELATED LINKS

[Get-RDMSession](http://127.0.0.1:1111/docs/Get-RDMSession/)

[Get-RDMSessionProperty](http://127.0.0.1:1111/docs/Get-RDMSessionProperty/)

