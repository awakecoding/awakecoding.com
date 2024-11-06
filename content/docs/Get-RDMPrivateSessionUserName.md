---
title: 'Get-RDMPrivateSessionUserName'
date: 2024-11-06
---


# Get-RDMPrivateSessionUserName

## SYNOPSIS
Get the username from the specified session.

## SYNTAX

### ID
```
Get-RDMPrivateSessionUserName [-ID] <Guid> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### PSConnection
```
Get-RDMPrivateSessionUserName [-Session] <PSConnection> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get the username from the specified session.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMUserVaultSessionUserName "{00000000-0000-0000-0000-000000000000}"
```

Get the username from the session with ID = "{00000000-0000-0000-0000-000000000000}".

### EXAMPLE 2
```
PS C:\> $list = Get-RDMUserVaultSession; Get-RDMUserVaultSessionUserName $list[1].ID
```

Retrieves the list of available sessions and gets the password from the the second element in the list.

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
Specifies the ID of the session to get the username from.

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
Specifies the session to set the username to.

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
For more information, type "Get-Help Get-RDMPrivateSessionUserName -detailed".
For technical information, type "Get-Help Get-RDMPrivateSessionUserName -full".

## RELATED LINKS

[Get-RDMPrivateSession](http://127.0.0.1:1111/docs/Get-RDMPrivateSession/)

[Get-RDMPrivateSessionDomain](http://127.0.0.1:1111/docs/Get-RDMPrivateSessionDomain/)

[Set-RDMPrivateSessionDomain](http://127.0.0.1:1111/docs/Set-RDMPrivateSessionDomain/)

[Set-RDMPrivateSessionUsername](http://127.0.0.1:1111/docs/Set-RDMPrivateSessionUsername/)

[Get-RDMPrivateSessionPassword](http://127.0.0.1:1111/docs/Get-RDMPrivateSessionPassword/)

[Set-RDMPrivateSessionPassword](http://127.0.0.1:1111/docs/Set-RDMPrivateSessionPassword/)

