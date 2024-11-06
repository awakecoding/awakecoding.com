---
title: 'Add-RDMEntryAttachment'
date: 2024-11-06
---


# Add-RDMEntryAttachment

## SYNOPSIS
Add new attachments to an existing entry

## SYNTAX

```
Add-RDMEntryAttachment [-InputObject] <PSConnection> [-Filename] <String[]> [-PassThru] [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Add new attachments to an existing entry.
Entries of the type SessionTool do not allow attachments.
The type of an entry is the property ConnectionType of a PSConnection.
    To modify properties of the attachments, use Set-RDMEntryAttachment.
To update a file of an existing attachment, use Update-RDMEntryAttachment. 
    Only advanced data sources support attachment.
The user must have the permission to add attachments.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMEntry -Name EntryA | Add-RDMEntryAttachment -Filename 'C:\my\path\filename.txt', 'localFile.txt'
```

Attach the files filename.txt, located in 'C:\my\path\', and localFile.txt, located in the current session directory, to the session named EntryA.

### EXAMPLE 2
```
PS C:\> $entry = Get-RDMEntry -Name EntryA;
    $attachment = Add-RDMEntryAttachment -InputObject $entry -Filename 'filename.txt' -PassThru;
    Set-RDMEntryAttachment -InputObject $attachment -Title 'Filename' -Description 'This is an important file'
```

Attach the file filename.txt, located in 'C:\my\path\', to the session named EntryA.

## PARAMETERS

### -Filename
Attachment filenames.

```yaml
Type: String[]
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

### -InputObject
Entry to add the attachment to.

```yaml
Type: PSConnection
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -PassThru
Return the all attachments as a PSConnectionAttachment\[\].

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

### -Refresh
Refresh the entries in the vault.
For modification in bulk, use Update-RDMEntries after the modifications instead of this switch.

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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection
PSConnection object of the entry where the attachments will be.
Can be obtained from Get-RDMEntry.

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionAttachment[]
## NOTES
For more information, type "Get-Help Add-RDMEntryAttachment -detailed".
For technical information, type "Get-Help Add-RDMEntryAttachment -full".

## RELATED LINKS

[Get-RDMEntryAttachment](http://127.0.0.1:1111/docs/Get-RDMEntryAttachment/)

[Remove-RDMEntryAttachment](http://127.0.0.1:1111/docs/Remove-RDMEntryAttachment/)

[Set-RDMEntryAttachment](http://127.0.0.1:1111/docs/Set-RDMEntryAttachment/)

[Update-RDMEntryAttachment](http://127.0.0.1:1111/docs/Update-RDMEntryAttachment/)

