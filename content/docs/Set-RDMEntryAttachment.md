---
title: 'Set-RDMEntryAttachment'
date: 2024-11-06
---


# Set-RDMEntryAttachment

## SYNOPSIS
Save attachments

## SYNTAX

```
Set-RDMEntryAttachment [-InputObject] <PSConnectionAttachment[]> [-AllowExport <Boolean>]
 [-Description <String>] [-Password <SecureString>] [-Title <String>] [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Save attachments.
Only advanced data sources support attachment.
The user must have the right to edit the attachments.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMEntry -Name EntryA | Get-RDMEntryAttachment | Set-RDMEntryAttachment -AllowExport $false
```

Prevent the export of all EntryA's attachments.

### EXAMPLE 2
```
PS C:\> $pwd = New-RDMRandomPassword -Mode Strong;
    $securepwd = ConvertTo-SecureString -String $pwd -AsPlainText;
    Get-RDMEntry -Name EntryA | Get-RDMEntryAttachment -Title 'AttachmentA' | Set-RDMEntryAttachment -Title 'Attachment A' -Description 'New description' -Password $securepwd
```

Change the title, description, and password of the attachment named AttachmentA of the entry EntryA

## PARAMETERS

### -AllowExport
Allow or disallow the attachment to be exported.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

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
Attachments to save.
Can be obtained from Get-RDMEntryAttachment.

```yaml
Type: PSConnectionAttachment[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionAttachment[]
Array of PSConnectionAttachment to save.
Can be obtained from Get-RDMEntryAttachment.

## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Set-RDMEntryAttachment -detailed".
For technical information, type "Get-Help Set-RDMEntryAttachment -full".

## RELATED LINKS

[Add-RDMEntryAttachment](http://127.0.0.1:1111/docs/Add-RDMEntryAttachment/)

[Get-RDMEntryAttachment](http://127.0.0.1:1111/docs/Get-RDMEntryAttachment/)

[Remove-RDMEntryAttachment](http://127.0.0.1:1111/docs/Remove-RDMEntryAttachment/)

[Update-RDMEntryAttachment](http://127.0.0.1:1111/docs/Update-RDMEntryAttachment/)

