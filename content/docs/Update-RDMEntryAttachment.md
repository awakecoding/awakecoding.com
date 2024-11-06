---
title: 'Update-RDMEntryAttachment'
date: 2024-11-06
---


# Update-RDMEntryAttachment

## SYNOPSIS
Update an entry's attachment file

## SYNTAX

```
Update-RDMEntryAttachment [-InputObject] <PSConnectionAttachment> [-Filename] <String> [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Update an entry's attachment file.
Only advanced data sources support attachment.
The user must have the permission to edit attachments.

## EXAMPLES

### EXAMPLE
```
PS C:\> Get-RDMEntry -Name EntryA | Get-RDMEntryAttachment -Title 'UniqueTitle' | Update-RDMEntryCommand -Filename 'revisedFile.txt' -Refresh
```

Update the document of the attachment 'UniqueTitle' with the file 'revisedFile.txt' in the current session directory.

## PARAMETERS

### -Filename
Attachment filename.

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

### -InputObject
Attachment to update.
Can be obtained from Get-RDMEntryAttachment.

```yaml
Type: PSConnectionAttachment
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
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

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: False
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionAttachment
PSConnectionAttachment to update.
Can be obtained from Get-RDMEntryAttachment.

## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Update-RDMEntryAttachment -detailed".
For technical information, type "Get-Help Update-RDMEntryAttachment -full".

## RELATED LINKS

[Add-RDMEntryAttachment](http://127.0.0.1:1111/docs/Add-RDMEntryAttachment/)

[Get-RDMEntryAttachment](http://127.0.0.1:1111/docs/Get-RDMEntryAttachment/)

[Remove-RDMEntryAttachment](http://127.0.0.1:1111/docs/Remove-RDMEntryAttachment/)

[Set-RDMEntryAttachment](http://127.0.0.1:1111/docs/Set-RDMEntryAttachment/)

