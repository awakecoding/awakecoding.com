---
title: 'Export-RDMSystemInformationReport'
date: 2024-11-06
---


# Export-RDMSystemInformationReport

## SYNOPSIS
Export the system information report to a file

## SYNTAX

```
Export-RDMSystemInformationReport [-Path] <String> [-InputObject] <PSSystemInformationReport> [-Theme <Theme>]
 [-AsHtml] [-NoClobber] [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Export the system information report to a file.
Two formats are supported: *.inv and *.html.
The default behavior is to overwrite existing files.
To avoid this, use the switch 'NoClobber'.

## EXAMPLES

### EXAMPLE
```
PS C:\> $lastYearReports = Get-RDMEntry -Name 'MySystemInformationReportEntry' | Get-RDMSystemInformationReport -After 2023-01-01 -Before 2023-12-31
PS C:\> foreach ($report in $lastYearReports) {
          $exportPath = "C:\my\path\$($report.Inventory.ComputerName)_$($report.MetaInformation.CreationDate.ToString('yyyy-MM-dd')).inv"
          Export-RDMSystemInformationReport -Path $exportPath -InputObject $report
        }
```

Export all the last year inventories

## PARAMETERS

### -AsHtml
Export the inventory as an html report

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
System information report obtained with Get-RDMSystemInformationReport

```yaml
Type: PSSystemInformationReport
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -NoClobber
Do not overwrite an existing file

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

### -Path
Path where the file is saved

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

### -Theme
Theme of the html report

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

### -VaultMode
Vault where the command will be applied.
Three choices are offered:
- Default: Current vault that has been set.
- User: Vault specific to the current user.
- Global: Global vault of the data source.

```yaml
Type: VaultMode
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSSystemInformationReport
System information report object with metadata

## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Export-RDMSystemInformationReport -detailed".
For technical information, type "Get-Help Export-RDMSystemInformationReport -full".

## RELATED LINKS

[Get-RDMSystemInformationReport](http://127.0.0.1:1111/docs/Get-RDMSystemInformationReport/)

