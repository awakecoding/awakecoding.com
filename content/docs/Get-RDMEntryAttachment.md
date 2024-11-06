---
title: 'Get-RDMEntryAttachment'
date: 2024-11-06
---


# Get-RDMEntryAttachment

## SYNOPSIS
Get attachments of an entry

## SYNTAX

```
Get-RDMEntryAttachment [-InputObject] <PSConnection> [-Filename <String[]>] [-Title <String[]>]
 [-CaseSensitive] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Get attachments of an entry.
They can filtered by their filename and title.
Only advanced data sources support attachments

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMEntry -Name EntryA | Get-RDMEntryAttachment
```

Get all the attachments of the entry EntryA

### EXAMPLE 2
```
PS C:\> Get-RDMEntry -Name EntryA | Get-RDMEntryAttachment -Title 'UniqueTitle' | Update-RDMEntryCommand -Filename 'revisedFile.txt' -Refresh
```

Update the document of the attachment 'UniqueTitle' with the file 'revisedFile.txt' in the current session directory.

### EXAMPLE 3
```
PS C:\> Get-RDMEntry -Name EntryA | Get-RDMEntryAttachment -Filename 'UniqueTitle' -CaseSensitive | Update-RDMEntryCommand -Filename 'revisedFile.txt' -Refresh
```

Update the document of the attachment 'UniqueTitle' with the file 'revisedFile.txt' in the current session directory.

### EXAMPLE 4
```
PS C:\> Get-RDMEntry -Name EntryA | Get-RDMEntryAttachment | Set-RDMEntryAttachment -AllowExport $false
```

Prevent the export of all EntryA's attachments.

## PARAMETERS

### -CaseSensitive
Filtering by the title and the filename will be case sensitive.

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

### -Filename
Filter the attachments based on their filename.

```yaml
Type: String[]
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
Specifies the connection to get the attachments from.

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

### -Title
Filter the attachments based on their title.

```yaml
Type: String[]
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
For more information, type "Get-Help Get-RDMEntryAttachment -detailed".
For technical information, type "Get-Help Get-RDMEntryAttachment -full".

## RELATED LINKS

[Add-RDMEntryAttachment](http://127.0.0.1:1111/docs/Add-RDMEntryAttachment/)

[Remove-RDMEntryAttachment](http://127.0.0.1:1111/docs/Remove-RDMEntryAttachment/)

[Set-RDMEntryAttachment](http://127.0.0.1:1111/docs/Set-RDMEntryAttachment/)

[Update-RDMEntryAttachment](http://127.0.0.1:1111/docs/Update-RDMEntryAttachment/)

