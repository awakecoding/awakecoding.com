---
title: 'Get-RDMSessionDocumentation'
date: 2024-11-06
---


# Get-RDMSessionDocumentation

## SYNOPSIS
Get documentation from a session.

## SYNTAX

### Name (Default)
```
Get-RDMSessionDocumentation [-Filter <String>] [-Name] <String> [[-Page] <String>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### ID
```
Get-RDMSessionDocumentation [-ID] <Guid> [-Filter <String>] [[-Page] <String>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Session
```
Get-RDMSessionDocumentation [-Filter <String>] [[-Page] <String>] [-Session] <PSConnection>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Must have the right to export.
All information of the documentation pages are accessible.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMRootSession | Get-RDMSessionDocumentation
```

Get the documentation of the root session in the current data source.

### EXAMPLE 2
```
PS C:\> Get-RDMSession -Name "ASession" | Get-RDMSessionDocumentation -Name "APage"
```

Get the documentation page "APage" of the session ASession.

### EXAMPLE 3
```
PS C:\> Get-RDMSessionDocumentation -ID "{00000000-0000-0000-0000-000000000000}" -Name "APage"
```

Get the documentation page "APage" of the session with ID = "{00000000-0000-0000-0000-000000000000}" of the current data source.

## PARAMETERS

### -Filter
Filter the pages by looking for the value in the page's name and content.
The value of the filter is case insensitive.

```yaml
Type: String
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

### -ID
Current data source session\`s ID from which to extract the documentation.

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

### -Name
Current data source session\`s name from which to extract the documentation.

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Page
Filter the handbook pages by the name.

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

### -Session
Session from which to extract the documentation.

```yaml
Type: PSConnection
Parameter Sets: Session
Aliases:

Required: True
Position: 1
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSHandbook
## NOTES
For more information, type "Get-Help Get-RDMSessionDocumentation -detailed".
For technical information, type "Get-Help Get-RDMSessionDocumentation -full".

## RELATED LINKS

[Get-RDMRootSession](http://127.0.0.1:1111/docs/Get-RDMRootSession/)

[Get-RDMSession](http://127.0.0.1:1111/docs/Get-RDMSession/)

[Set-RDMSessionDocumentation](http://127.0.0.1:1111/docs/Set-RDMSessionDocumentation/)

[Remove-RDMSessionDocumentation](http://127.0.0.1:1111/docs/Remove-RDMSessionDocumentation/)

