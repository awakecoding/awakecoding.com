---
title: 'Get-RDMSessionStatus'
date: 2024-11-06
---


# Get-RDMSessionStatus

## SYNOPSIS
Get the status from the specified session.

## SYNTAX

### ID
```
Get-RDMSessionStatus [-ID] <Guid> [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### PSConnection
```
Get-RDMSessionStatus [-Session] <PSConnection> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get the status from the specified session.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMSessionStatus "{00000000-0000-0000-0000-000000000000}"
```

Get the status from the session with ID = "{00000000-0000-0000-0000-000000000000}".

### EXAMPLE 2
```
PS C:\> $list = Get-RDMSession; Get-RDMSessionStatus $list[1]
```

Retrieves the list of available sessions and gets the status from the the second element in the list.

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
Specifies the ID of the session to get the status from.

Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

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

### -Session
Specifies the session to set the status to

```yaml
Type: PSConnection
Parameter Sets: PSConnection
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

### None
## NOTES
For more information, type "Get-Help Get-RDMSessionStatus -detailed".
For technical information, type "Get-Help Get-RDMSessionStatus -full".

## RELATED LINKS

[Get-RDMSession](http://127.0.0.1:1111/docs/Get-RDMSession/)

[Set-RDMSessionDomain](http://127.0.0.1:1111/docs/Set-RDMSessionDomain/)

[Get-RDMSessionUserName](http://127.0.0.1:1111/docs/Get-RDMSessionUserName/)

[Set-RDMSessionUsername](http://127.0.0.1:1111/docs/Set-RDMSessionUsername/)

[Get-RDMSessionPassword](http://127.0.0.1:1111/docs/Get-RDMSessionPassword/)

[Set-RDMSessionPassword](http://127.0.0.1:1111/docs/Set-RDMSessionPassword/)

[Set-RDMSessionStatus](http://127.0.0.1:1111/docs/Set-RDMSessionStatus/)

