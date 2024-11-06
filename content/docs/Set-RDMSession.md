---
title: 'Set-RDMSession'
date: 2024-11-06
---


# Set-RDMSession

## SYNOPSIS
Save/set the session.

## SYNTAX

```
Set-RDMSession [-Refresh] [-Session] <PSConnection[]> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Save/set the session.
Session must be first fetch via Session property of the Get-RDM-Session cmdlet or via the New-RDMSession result.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $list = Get-RDMSession; $list[1].Name = "New Name";Set-RDMSession $list[1]
```

Retrieves the list of available sessions, modify the name of the second session, update the session.

### EXAMPLE 2
```
PS C:\> $session = New-RDMSession -Name "New Session" -Host "myServer" -Kind "RDPConfigured";Set-RDMSession $session
```

Create & save new session.

### EXAMPLE 3
```
PS C:\> [Devolutions.Generated.Models.Connection].DeclaredFields | Where-Object -Property Name -like "*ConnectionID" | Select-Object -Property Name; $session = Get-RDMSession -Name ARDP"; $session.CredentialConnectionID = [Devolutions.Generated.Models.Connection]::MyDefaultCredentialConnectionID; Set-RDMSession $session
```

The user looks at the options for the type of credentials for entries.
After finding the desired one, he gets the session ARDP.
He sets the credentials to 'My Personal Credentials' and save the modification.

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

### -Session
PSSession object, must be retrieved from Get-RDMSession or created via New-RDMSession.

```yaml
Type: PSConnection[]
Parameter Sets: (All)
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
For more information, type "Get-Help Set-RDMSession -detailed".
For technical information, type "Get-Help Set-RDMSession -full".

## RELATED LINKS

[Get-RDMDataSource](http://127.0.0.1:1111/docs/Get-RDMDataSource/)

[Set-RDMDataSource](http://127.0.0.1:1111/docs/Set-RDMDataSource/)

[Get-RDMSession](http://127.0.0.1:1111/docs/Get-RDMSession/)

[New-RDMSession](http://127.0.0.1:1111/docs/New-RDMSession/)

[Remove-RDMSession](http://127.0.0.1:1111/docs/Remove-RDMSession/)

