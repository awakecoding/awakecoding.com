---
title: 'Update-RDMEntryDocument'
date: 2024-11-06
---


# Update-RDMEntryDocument

## SYNOPSIS
Update the document of the specified entry.

## SYNTAX

### Filename
```
Update-RDMEntryDocument [-InputObject] <PSConnection> [-Filename] <String> [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### Attachment
```
Update-RDMEntryDocument [-InputObject] <PSConnection> [-Attachment] <PSConnectionAttachment> [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Update the document of the specified entry.
The entry must of the type Document, and the document must be stored in the database.
The updated document must be of the same type as the existing one.
It must also respect the maximum file size defined in the system settings.
This cmdlet cannot be used offline.
The data source must support attachments.
The user must have the right to modify the attachments.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $entry = Get-RDMEntry -Name MyDocumentEntry;
    Update-RDMEntryDocument -InputObject $entry -Filename 'C:\Mytestfile.txt' -Refresh
```

Update the document of the entry MyDocumentEntry with the file 'C:\Mytestfile.txt'

### EXAMPLE 2
```
PS C:\> $entry = Get-RDMEntry -Name MyDocumentEntry;
    $entryWithAttachment = Get-RDMEntry -Name MyEntryWithAttachment;
    $attachment = Get-RDMEntryAttachment -InputObject $entryWithAttachment -Title 'My Attachment File';
    Update-RDMEntryDocument -InputObject $entry -Attachment $attachment
```

Update the document of the entry MyDocumentEntry with the attachment 'My Attachment File' present in the entry MyEntryWithAttachment.

## PARAMETERS

### -Attachment
Attachment to update the document to.

```yaml
Type: PSConnectionAttachment
Parameter Sets: Attachment
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filename
New document filename

```yaml
Type: String
Parameter Sets: Filename
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
Entry to update the document to.

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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection
Document entry obtained from Get-RDMEntry

## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Update-RDMEntryDocument -detailed".
For technical information, type "Get-Help Update-RDMEntryDocument -full".

## RELATED LINKS
