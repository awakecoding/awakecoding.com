---
title: 'Set-RDMEntryDocument'
date: 2024-11-06
---


# Set-RDMEntryDocument

## SYNOPSIS
Save a document in the current data source

## SYNTAX

```
Set-RDMEntryDocument [-InputObject] <PSConnectionDocument[]> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Save a document in the current data source.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $doc = Get-RDMEntryDocument -Name 'SimpleTextDocument' -VaultMode User;
    $doc.Data = [System.Text.Encoding]::UTF8.GetBytes('My new content');
    Set-RDMEntryDocument -InputObject $doc
```

Update the content of the document stored in the database of the entry SimpleTextDocument.

### EXAMPLE 2
```
PS C:\> $doc = Get-RDMEntryDocument -Name 'SimpleTextDocument';
    $doc.Data = Get-Content -Path MyFile.txt -AsByteStream;
    Set-RDMEntryDocument -InputObject $doc
```

Update the content of the document stored in the database of the entry SimpleTextDocument with the content of the file contained in the entry SimpleTextDocument

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
Documents obtained from Get-RDMEntryDocumentation to save

```yaml
Type: PSConnectionDocument[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
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

### None
## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Set-RDMEntryDocument -detailed".
For technical information, type "Get-Help Set-RDMEntryDocument -full".

## RELATED LINKS

[Get-RDMEntryDocument](http://127.0.0.1:1111/docs/Get-RDMEntryDocument/)

