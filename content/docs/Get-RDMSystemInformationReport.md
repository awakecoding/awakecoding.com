---
title: 'Get-RDMSystemInformationReport'
date: 2024-11-06
---


# Get-RDMSystemInformationReport

## SYNOPSIS
Get exisiting reports from an system information report entry

## SYNTAX

### Id
```
Get-RDMSystemInformationReport [-ID] <Guid> [-After <DateTime>] [-Before <DateTime>] [-Last]
 [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### InputObject
```
Get-RDMSystemInformationReport [-InputObject] <PSConnection> [-After <DateTime>] [-Before <DateTime>] [-Last]
 [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Get exisiting reports from an system information report entry.
It is possible to filter them by their creation date with the parameters 'After' and 'Before'.
Both of them are inclusive.
To get the last report, simply use the switch 'Last'.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMEntry -Name 'MySystemInformationReportEntry' | Get-RDMSystemInformationReport -Last
```

Get the last generated report from the entry 'MySystemInformationReportEntry'

### EXAMPLE 2
```
PS C:\> $lastYearReports = Get-RDMEntry -Name 'MySystemInformationReportEntry' | Get-RDMSystemInformationReport -After 2023-01-01 -Before 2023-12-31
PS C:\> foreach ($report in $lastYearReports) {
          $exportPath = "C:\my\path\$($report.Inventory.ComputerName)_$($report.MetaInformation.CreationDate.ToString('yyyy-MM-dd')).inv"
          Export-RDMSystemInformationReport -Path $exportPath -InputObject $report
        }
```

Export all the last year inventories

## PARAMETERS

### -After
Return the inventory reports created after the specified date

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
Return the inventory reports created before the specified date

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

### -ID
ID of the system information report entry

```yaml
Type: Guid
Parameter Sets: Id
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
System information report entry

```yaml
Type: PSConnection
Parameter Sets: InputObject
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Last
Return the last inventory report

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
System information report entry

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSSystemInformationReport
## NOTES
For more information, type "Get-Help Get-RDMSystemInformationReport -detailed".
For technical information, type "Get-Help Get-RDMSystemInformationReport -full".

## RELATED LINKS

[Export-RDMSystemInformationReport](http://127.0.0.1:1111/docs/Export-RDMSystemInformationReport/)

[New-RDMSystemInformationReport](http://127.0.0.1:1111/docs/New-RDMSystemInformationReport/)

[Remove-RDMSystemInformationReport](http://127.0.0.1:1111/docs/Remove-RDMSystemInformationReport/)

