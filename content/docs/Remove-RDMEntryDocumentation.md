---
title: 'Remove-RDMEntryDocumentation'
date: 2024-11-06
---


# Remove-RDMEntryDocumentation

## SYNOPSIS
Delete documentation pages

## SYNTAX

```
Remove-RDMEntryDocumentation [-InputObject] <PSHandbookPage[]> [-Refresh] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Delete documentation pages.
The documentation pages must be fetched by Get-RDMEntryDocumentation.
    The data source must support the documentation feature and be online.
The user must have the rights to delete the documentation.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMEntry | Get-RDMEntryDocumentation -Name 'Subject A*' -CaseSensitive | Remove-RDMEntryDocumentation
```

Delete all documentation pages whose name starts with 'Subject A' in the current vault

### EXAMPLE 2
```
PS C:\> Get-RDMEntry -Name EntryA | Get-RDMEntryDocumentation -Data '*Temporary*' -CaseSensitive | Remove-RDMEntryDocumentation
```

Delete all documentation pages of the entry 'EntryA' that contains the word 'Temporary'

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
Documentation pages to delete

```yaml
Type: PSHandbookPage[]
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSHandbookPage[]
Documentation pages, obtained from Get-RDMEntryDocumentation, to delete.

## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Remove-RDMEntryDocumentation -detailed".
For technical information, type "Get-Help Remove-RDMEntryDocumentation -full".

## RELATED LINKS

[Get-RDMEntryDocumentation](http://127.0.0.1:1111/docs/Get-RDMEntryDocumentation/)

[New-RDMEntryDocumentation](http://127.0.0.1:1111/docs/New-RDMEntryDocumentation/)

[Set-RDMEntryDocumentation](http://127.0.0.1:1111/docs/Set-RDMEntryDocumentation/)

