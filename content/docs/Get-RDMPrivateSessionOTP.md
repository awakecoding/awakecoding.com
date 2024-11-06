---
title: 'Get-RDMPrivateSessionOTP'
date: 2024-11-06
---


# Get-RDMPrivateSessionOTP

## SYNOPSIS
Get the One Time Password from the specified session.

## SYNTAX

### ID
```
Get-RDMPrivateSessionOTP [-Comment <String>] [-ID] <Guid> [-TicketID <String>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### PSConnection
```
Get-RDMPrivateSessionOTP [-Comment <String>] [-Session] <PSConnection> [-TicketID <String>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get the One Time Password from the specified session.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMUserVaultSessionOTP "{00000000-0000-0000-0000-000000000000}"
```

Get the OTP from the session with ID = "{00000000-0000-0000-0000-000000000000}".

### EXAMPLE 2
```
PS C:\> $list = Get-RDMUserVaultSession; Get-RDMUserVaultSessionOTP $list[1]
```

Retrieves the list of available sessions and gets the OTP from the the second element in the list.

### EXAMPLE 3
```
PS C:\> Get-RDMPrivateSession -Name AnOTPCred | Get-RDMPrivateSessionOTP -TicketID 123 -Comment "It is a comment."
```

Get the OTP from the session AnOTPCred while filling the credential viewed log, avoiding the prompt.

## PARAMETERS

### -Comment
Comment for the credential viewed log.

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
Specifies the ID of the session to get the OTP from.

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
Specifies the session to get the OTP from

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

### -TicketID
Ticket number for the credential viewed log

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

### System.Guid
ID of the OTP entry

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection
OTP entry obtained from Get-RDMPrivateSession

## OUTPUTS

### System.Management.Automation.PSCustomObject
## NOTES
For more information, type "Get-Help Get-RDMPrivateSessionOTP -detailed".
For technical information, type "Get-Help Get-RDMPrivateSessionOTP -full".

## RELATED LINKS

[Get-RDMPrivateSession](http://127.0.0.1:1111/docs/Get-RDMPrivateSession/)

[Set-RDMPrivateSessionDomain](http://127.0.0.1:1111/docs/Set-RDMPrivateSessionDomain/)

[Get-RDMPrivateSessionUserName](http://127.0.0.1:1111/docs/Get-RDMPrivateSessionUserName/)

[Set-RDMPrivateSessionUsername](http://127.0.0.1:1111/docs/Set-RDMPrivateSessionUsername/)

[Get-RDMPrivateSessionPassword](http://127.0.0.1:1111/docs/Get-RDMPrivateSessionPassword/)

[Set-RDMPrivateSessionPassword](http://127.0.0.1:1111/docs/Set-RDMPrivateSessionPassword/)

[Get-RDMSessionOTP](http://127.0.0.1:1111/docs/Get-RDMSessionOTP/)

