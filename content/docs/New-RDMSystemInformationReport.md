---
title: 'New-RDMSystemInformationReport'
date: 2024-11-06
---


# New-RDMSystemInformationReport

## SYNOPSIS
Generate a new system information report

## SYNTAX

### Id
```
New-RDMSystemInformationReport [-ID] <Guid> [-Inventory <InventorySystemInformation>] [-ExportPath <String>]
 [-NoClobber] [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### InputObject
```
New-RDMSystemInformationReport [-InputObject] <PSConnection> [-Inventory <InventorySystemInformation>]
 [-ExportPath <String>] [-NoClobber] [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Generate a new system information report.
This cmdlet only works on Windows OS.

## EXAMPLES

### EXAMPLE
```
PS C:\> Get-RDMEntry -Name 'MySystemInformationReportEntry' | New-RDMSystemInformationReport
```

Generate a new report from the entry 'MySystemInformationReportEntry'

## PARAMETERS

### -ExportPath
Path where the inventory will be saved as an '.inv' file.

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

### -Inventory
Inventory obtained from Import-RDMSystemInformationReport

```yaml
Type: InventorySystemInformation
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
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

### Devolutions.RemoteDesktopManager.Business.InventorySystemInformation
## NOTES
For more information, type "Get-Help New-RDMSystemInformationReport -detailed".
For technical information, type "Get-Help New-RDMSystemInformationReport -full".

## RELATED LINKS

[Get-RDMSystemInformationReport](http://127.0.0.1:1111/docs/Get-RDMSystemInformationReport/)

