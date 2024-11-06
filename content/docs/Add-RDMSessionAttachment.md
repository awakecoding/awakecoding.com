---
title: 'Add-RDMSessionAttachment'
date: 2024-11-06
---


# Add-RDMSessionAttachment

## SYNOPSIS
Add a new attachment to a session

## SYNTAX

```
Add-RDMSessionAttachment [-Description <String>] [-Filename] <String> [-Password <SecureString>] [-Refresh]
 [-Session] <PSConnection> [-Title <String>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Add a new attachment to a session.
    Two parameters are required: Filename, path to the file to attach, and Session, where the file is attached.
Additional information can be provided via the title and description.
The attachment can be protected by a password.
    Only advanced data sources support attachment.
The user must have the permission to add attachments.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $entry = Get-RDMSession -Name EntryA;
        Add-RDMSessionAttachment -Filename 'C:\my\path\filename.ext' -Session $entry
```

Attach the file filename.ext, located in 'C:\my\path\', to the session named EntryA.

### EXAMPLE 2
```
PS C:\> $entry = Get-RDMSession -Name EntryA;
        $password = Read-Host -AsSecureString;
        Add-RDMSessionAttachment -Filename 'C:\my\path\filename.ext' -Session $entry -Description 'A description of the attachment' -Title 'Essential' -Password $password -Refresh
```

Attach the file filename.ext, located in 'C:\my\path\', to the session named EntryA.
The attachment will be protected by the password entered with Read-Host.
Additional information is stored.
The refresh parameter will update the RDM UI.

## PARAMETERS

### -Description
Attachment description.

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

### -Filename
Attachment filename.

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

### -Password
Attachment password.

```yaml
Type: SecureString
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
Session to add the attachment to.

```yaml
Type: PSConnection
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
Attachment title.

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

### None
## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Add-RDMSessionAttachment -detailed".
For technical information, type "Get-Help Add-RDMSessionAttachment -full".

## RELATED LINKS

[Get-RDMSessionAttachment](http://127.0.0.1:1111/docs/Get-RDMSessionAttachment/)

[Set-RDMSessionAttachment](http://127.0.0.1:1111/docs/Set-RDMSessionAttachment/)

[Add-RDMPrivateSessionAttachment](http://127.0.0.1:1111/docs/Add-RDMPrivateSessionAttachment/)

[Get-RDMPrivateSessionAttachment](http://127.0.0.1:1111/docs/Get-RDMPrivateSessionAttachment/)

[Set-RDMPrivateSessionAttachment](http://127.0.0.1:1111/docs/Set-RDMPrivateSessionAttachment/)

[Remove-RDMSessionAttachment](http://127.0.0.1:1111/docs/Remove-RDMSessionAttachment/)

[Update-RDMSessionAttachment](http://127.0.0.1:1111/docs/Update-RDMSessionAttachment/)

