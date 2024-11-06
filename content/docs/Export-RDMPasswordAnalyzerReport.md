---
title: 'Export-RDMPasswordAnalyzerReport'
date: 2024-11-06
---


# Export-RDMPasswordAnalyzerReport

## SYNOPSIS
Export an entry security analyzer report of the current data source

## SYNTAX

```
Export-RDMPasswordAnalyzerReport [-ExportType] <String> [-Path] <String> [-Private] [-ReportType] <String>
 [-ShowAllEntries] [-ShowPwnedPassword] [-ShowVPNAnalysis] [-Theme <Theme>]
 [[-Status] <ConnectionStatusFilter>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Export an entry security analyzer report of the current data source to the specfied path.
The user must have access to the reports to use the command.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Export-RDMPasswordAnalyzerReport -ExportType Html -Path C:\mypath\filename.html -Status Expired -Verbose
```

Export the Password Analyzer report in a html format at the location C:\mypath\filename.html.
Only the connections with expired password will be include in the report.
If the report does not contain an entry, a verbose message will indicates that the report is empty.
In that case, the report will not be generated.

### EXAMPLE 2
```
PS C:\> Get-RDMDataSource -Name ADataSource | Set-RDMCurrentDataSource; Export-RDMPasswordAnalyzerReport -ExportType Html -Path C:\mypath\filename.html -ShowAllEntries -ShowVPNAnalysis -ShowPwnedPassword -Private
```

Change the current data source to ADataSource and export the Password Analyzer report in a html format at the location C:\mypath\filenmae.html.
The report will contain all connections, even those without a password, the VPN analysis, and will identified the compromised passwords.

### EXAMPLE 3
```
PS C:\> $original = Get-RDMCurrentDataSource; $ds = Get-RDMDataSource; $ds.ForEach({Set-RDMCurrentDataSource -DataSource $_; Export-RDMPasswordAnalyzerReport -ExportType Html -Path C:\mypath\$($_.Name).html -ShowPwnedPassword -Private}); Set-RDMCurrentDataSource -DataSource $original
```

For all the data sources, export the Password Analyzer report of the private vault in a html format in the directory C:\mypath\ where the file name will be the same as the data source name.
The initial current data source will be set again as the current one.

## PARAMETERS

### -ExportType
Specify the file type of the export.
CSV, HTML and XLM are supported.

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

### -Path
Path where the file will be the saved.
Must end with:

"CSV: .csv", "HTML: .html", "XML: .xml"

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

### -Private
The report will cover the list of available sessions from the user private vault.

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

### -ReportType
Specify the report type to export.
Only PasswordAnalyzer (Entry Security Analyzer) is supported for now.

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

### -ShowAllEntries
Show also the entries without a password

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

### -ShowPwnedPassword
Show the compromised (pwned) passwords

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

### -ShowVPNAnalysis
Show the VPN analysis

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

### -Status
Filter the connections based on their status.
The filter "Default" keeps the connections whose status is not specified.

```yaml
Type: ConnectionStatusFilter
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
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
For more information, type "Get-Help Export-RDMPasswordAnalyzerReport -detailed".
For technical information, type "Get-Help Export-RDMPasswordAnalyzerReport -full".

## RELATED LINKS
