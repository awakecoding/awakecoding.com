---
title: 'Remove-RDMEntryAttachment'
date: 2024-11-06
---


# Remove-RDMEntryAttachment

## SYNOPSIS
Remove attachments

## SYNTAX

```
Remove-RDMEntryAttachment [-InputObject] <PSConnectionAttachment[]> [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Remove attachment.
Only advanced data sources support attachment.
The user must have the permission to delete attachments.

## EXAMPLES

### EXAMPLE
```
PS C:\> Get-RDMEntry -Name EntryA -VaultMode User | Get-RDMEntryAttachment | Remove-RDMEntryAttachment
```

Remove the attachments of the entry EntryA in the user vault.

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

### -InputObject
Attachments to delete.
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionAttachment[]
PSConnectionAttachment\[\] object of the attachments to delete.
Can be obtained from Get-RDMEntry.

## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Remove-RDMEntryAttachment -detailed".
For technical information, type "Get-Help Remove-RDMEntryAttachment -full".

## RELATED LINKS

[Add-RDMEntryAttachment](http://127.0.0.1:1111/docs/Add-RDMEntryAttachment/)

[Get-RDMEntryAttachment](http://127.0.0.1:1111/docs/Get-RDMEntryAttachment/)

[Set-RDMEntryAttachment](http://127.0.0.1:1111/docs/Set-RDMEntryAttachment/)

[Update-RDMEntryAttachment](http://127.0.0.1:1111/docs/Update-RDMEntryAttachment/)

