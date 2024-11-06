---
title: 'Remove-RDMSessionAttachment'
date: 2024-11-06
---


# Remove-RDMSessionAttachment

## SYNOPSIS
Remove session attachment

## SYNTAX

```
Remove-RDMSessionAttachment [-Attachment] <PSConnectionAttachment> [-Force]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Remove session attachment.
Only advanced data sources support attachment.
The user must have the permission to delete attachments.

## EXAMPLES

### EXAMPLE
```
PS C:\> $session = Get-RDMSession -Name MySession;
        $attachments = Get-RDMSessionAttachment -Session $session;
        Remove-RDMSessionAttachment -Attachment $attachments[0]
```

Remove the first attachment in the session.

## PARAMETERS

### -Attachment
Connection.

```yaml
Type: PSConnectionAttachment
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Forces removal of the attachment without confirmation by the user.
Optional.

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
For more information, type "Get-Help Remove-RDMSessionAttachment -detailed".
For technical information, type "Get-Help Remove-RDMSessionAttachment -full".

## RELATED LINKS

[Add-RDMSessionAttachment](http://127.0.0.1:1111/docs/Add-RDMSessionAttachment/)

[Get-RDMSessionAttachment](http://127.0.0.1:1111/docs/Get-RDMSessionAttachment/)

[Set-RDMSessionAttachment](http://127.0.0.1:1111/docs/Set-RDMSessionAttachment/)

[Add-RDMPrivateSessionAttachment](http://127.0.0.1:1111/docs/Add-RDMPrivateSessionAttachment/)

[Get-RDMPrivateSessionAttachment](http://127.0.0.1:1111/docs/Get-RDMPrivateSessionAttachment/)

[Set-RDMPrivateSessionAttachment](http://127.0.0.1:1111/docs/Set-RDMPrivateSessionAttachment/)

[Update-RDMSessionAttachment](http://127.0.0.1:1111/docs/Update-RDMSessionAttachment/)

