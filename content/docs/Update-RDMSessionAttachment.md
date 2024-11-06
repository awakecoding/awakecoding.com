---
title: 'Update-RDMSessionAttachment'
date: 2024-11-06
---


# Update-RDMSessionAttachment

## SYNOPSIS
Update session attachment

## SYNTAX

```
Update-RDMSessionAttachment [-Attachment] <PSConnectionAttachment> [-Filename] <String> [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Update session attachment.
Only advanced data sources support attachment.
The user must have the permission to edit attachments.

## EXAMPLES

### EXAMPLE
```
PS C:\> $session = Get-RDMSession -Name MySession;
        $attachments = Get-RDMSessionAttachment -Session $session;
        Update-RDMSessionAttachment -Attachment $attachments[0] -Filename 'C:\\Mytestfile.txt'
```

Update the first attachment to the document at 'C:\Mytestfile.txt'.

## PARAMETERS

### -Attachment
Attachment to update the document to.

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

### -Filename
New document filename

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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
For more information, type "Get-Help Update-RDMSessionAttachment -detailed".
For technical information, type "Get-Help Update-RDMSessionAttachment -full".

## RELATED LINKS

[Add-RDMSessionAttachment](http://127.0.0.1:1111/docs/Add-RDMSessionAttachment/)

[Get-RDMSessionAttachment](http://127.0.0.1:1111/docs/Get-RDMSessionAttachment/)

[Set-RDMSessionAttachment](http://127.0.0.1:1111/docs/Set-RDMSessionAttachment/)

[Add-RDMPrivateSessionAttachment](http://127.0.0.1:1111/docs/Add-RDMPrivateSessionAttachment/)

[Get-RDMPrivateSessionAttachment](http://127.0.0.1:1111/docs/Get-RDMPrivateSessionAttachment/)

[Set-RDMPrivateSessionAttachment](http://127.0.0.1:1111/docs/Set-RDMPrivateSessionAttachment/)

[Remove-RDMSessionAttachment](http://127.0.0.1:1111/docs/Remove-RDMSessionAttachment/)

