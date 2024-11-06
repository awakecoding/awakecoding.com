---
title: 'Export-RDMActivityLogsReport'
date: 2024-11-06
---


# Export-RDMActivityLogsReport

## SYNOPSIS
Export the activity logs for the current data source.

## SYNTAX

```
Export-RDMActivityLogsReport [-After <DateTime>] [-Before <DateTime>] [-DateFilter <DateFilter>] [-Descending]
 [-EntryName <String>] [-Folder <String>] [-MachineName <String>] [-Message <String>]
 [-OnCloseComment <String>] [-OnOpenComment <String>] [-Path] <String> [-SortField <String>]
 [-TicketID <String>] [-Theme <Theme>] [-Type] <String> [-UserName <String>] [-UTC] [-VaultID <String>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Export the activity logs for the current data source.
The content can be filtered with parameters.
If a file exists at the specified path, it will be overwritten.
To use this cmdlet, the user must have the rights to access reports.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Export-RDMActivityLogsReport Html C:\my\path\name.html -DateFilter Last30Days
```

Generate an html report at the location C:\my\path\name.html for all activities that occured in the last 30 days.

### EXAMPLE 2
```
PS C:\> Export-RDMActivityLogsReport Csv C:\my\path\name.csv -EntryName VIPEntry -Theme Dark
```

Generate an csv report at the location C:\my\path\name.csv for all activities that occured on the entry VIPEntry.
The report will have a dark background.

## PARAMETERS

### -After
Set the inclusive custom lower limit date for the logs included in the report.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Before
Set the inclusive custom upper limit date for the logs included in the report.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DateFilter
Filter the logs based on predefined value for the date, such as Today.
If not specified, it will be custom, allowing the use of the parameters Before and After.

```yaml
Type: DateFilter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Descending
Sort in the descending order.

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

### -EntryName
Filter the logs for a specific entry.

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

### -Folder
Filter the logs for a specific folder.

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

### -MachineName
Filter the logs by the machine name.

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

### -Message
Filter the logs by the message.

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

### -OnCloseComment
Filter the logs by the close prompt comment.

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

### -OnOpenComment
Filter the logs by the open prompt comment.

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

### -Path
Path where the file will be the saved.
Must end with:

"CSV: .csv", "HTML: .html", "XML: .xml"

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

### -SortField
Field on which the sort will be applied

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

### -Theme
Specify the theme of the report.
If not specified, the RDM theme will be used.

```yaml
Type: Theme
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TicketID
Filter the logs by the ticket number.

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

### -Type
Specify the file type of the export.
CSV, HTML and XLM are supported.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserName
Filter the logs by the user name.

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

### -UTC
Use UTC time for the parameters 'After' and 'Before'.

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

### -VaultID
Filter the logs by the vault ID.

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
For more information, type "Get-Help Export-RDMActivityLogsReport -detailed".
For technical information, type "Get-Help Export-RDMActivityLogsReport -full".

## RELATED LINKS
