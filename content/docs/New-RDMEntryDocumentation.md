---
title: 'New-RDMEntryDocumentation'
date: 2024-11-06
---


# New-RDMEntryDocumentation

## SYNOPSIS
Create a documentation page for an entry

## SYNTAX

```
New-RDMEntryDocumentation [-InputObject] <PSConnection> [-Type] <DocumentationType> [-Name] <String>
 [-Data] <String> [-AsLastPage] [-AsNewDefault] [-Set] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a documentation page for an entry.
The entry must be fetched by Get-RDMEntry.
    The data source must support the documentation feature and be online.
The user must have the rights to edit the documentation.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -AsLastPage
Set the page as the last one.

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

### -AsNewDefault
Set the page as the new default one.

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

### -Data
Content of the documentation page

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
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
Entry where the documentation page will be.
Must be already saved.

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

### -Name
Name of the documentation page

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Set
Save the documentation page on the entry

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

### -Type
Type of the page.
The supported types are Markdown, PlainText, and HTML.

```yaml
Type: DocumentationType
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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
Entry, obtained from Get-RDMEntry, that will contain the new documentation page.

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSHandbookPage
## NOTES
For more information, type "Get-Help New-RDMEntryDocumentation -detailed".
For technical information, type "Get-Help New-RDMEntryDocumentation -full".

## RELATED LINKS

[Get-RDMEntryDocumentation](http://127.0.0.1:1111/docs/Get-RDMEntryDocumentation/)

[Remove-RDMEntryDocumentation](http://127.0.0.1:1111/docs/Remove-RDMEntryDocumentation/)

[Set-RDMEntryDocumentation](http://127.0.0.1:1111/docs/Set-RDMEntryDocumentation/)

