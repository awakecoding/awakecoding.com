---
title: 'Import-RDMSystemInformationReport'
date: 2024-11-06
---


# Import-RDMSystemInformationReport

## SYNOPSIS
Import a system infromation report from an .inv file

## SYNTAX

```
Import-RDMSystemInformationReport [-Path] <String> [[-InputObject] <PSConnection>] [-VaultMode <VaultMode>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Import a system infromation report from an .inv file.
It is possible to save it directly in a system information report entry by using the InputObject parameter.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMEntry -Name 'MyInventory' | Import-RDMSystemInformationReport -Path 'C:\my\path\inventory20240723.inv' | Out-Null
```

Save the inventory loaded from the file 'inventory20240723.inv' in the entry named 'MyInventory'

### EXAMPLE 2
```
PS C:\> $inventoryEntry = Get-RDMEntry -Name 'MyInventory'
PS C:\> $inventory = Import-RDMSystemInformationReport -Path 'C:\my\path\inventory20240723.inv'
PS C:\> $inventory.Antivirus.DisplayName = 'CrowdStrike'
PS C:\> Get-RDMEntry -Name 'MyInventory' | New-RDMSystemInformationReport -Inventory $inventory
```

Extract the inventory from the file 'inventory20240723.inv' and set the display name of the antivirus to 'CrowdStrike'.
Save the inventory in the entry named 'MyInventory'

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
System information report entry where the inventory will be uploaded.

```yaml
Type: PSConnection
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Path
Inventory file (.inv) to import

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
System information report entry where the inventory will be saved

## OUTPUTS

### Devolutions.RemoteDesktopManager.Business.InventorySystemInformation
## NOTES
For more information, type "Get-Help Import-RDMSystemInformationReport -detailed".
For technical information, type "Get-Help Import-RDMSystemInformationReport -full".

## RELATED LINKS

[New-RDMSystemInformationReport](http://127.0.0.1:1111/docs/New-RDMSystemInformationReport/)

