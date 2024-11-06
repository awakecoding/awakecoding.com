---
title: 'Set-RDMSessionStatus'
date: 2024-11-06
---


# Set-RDMSessionStatus

## SYNOPSIS
Set a status to a given session.

## SYNTAX

### Id
```
Set-RDMSessionStatus [-ID] <Guid> [[-Message] <String>] [-Status] <String>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### InputObject
```
Set-RDMSessionStatus [[-Message] <String>] [-Session] <PSConnection[]> [-Status] <String>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Set a status to a given session.

## EXAMPLES

### EXAMPLE
```
PS C:\> $list = Get-RDMSession; Set-RDMSessionStatus -Session $list[1] -Status Locked -Message 'Locked Message'
```

Set the status locked to the the second element in the list.

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
Specifies the ID of the session to set the status to.

Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

```yaml
Type: Guid
Parameter Sets: Id
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Message
Status message

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Session
Specifies the session to set the status to

```yaml
Type: PSConnection[]
Parameter Sets: InputObject
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Status
Status type

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
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
For more information, type "Get-Help Set-RDMSessionStatus -detailed".
For technical information, type "Get-Help Set-RDMSessionStatus -full".

## RELATED LINKS

[Get-RDMSession](http://127.0.0.1:1111/docs/Get-RDMSession/)

[Set-RDMSessionDomain](http://127.0.0.1:1111/docs/Set-RDMSessionDomain/)

[Get-RDMSessionUserName](http://127.0.0.1:1111/docs/Get-RDMSessionUserName/)

[Set-RDMSessionUsername](http://127.0.0.1:1111/docs/Set-RDMSessionUsername/)

[Get-RDMSessionPassword](http://127.0.0.1:1111/docs/Get-RDMSessionPassword/)

[Set-RDMSessionPassword](http://127.0.0.1:1111/docs/Set-RDMSessionPassword/)

[Get-RDMSessionStatus](http://127.0.0.1:1111/docs/Get-RDMSessionStatus/)

