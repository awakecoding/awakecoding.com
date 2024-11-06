---
title: 'Set-RDMTemplate'
date: 2024-11-06
---


# Set-RDMTemplate

## SYNOPSIS
Save templates in the current data source

## SYNTAX

```
Set-RDMTemplate [-Template] <PSTemplate[]> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Save templates in the current data source.
All local templates will be ignored.

## EXAMPLES

### EXAMPLE
```
PS C:\> $grTemplates = Get-RDMTemplate | Where-Object -Property Type -eq TemplateGroup; $sess = Get-RDMSession -Name "ASession"; $grTemplates[0].GroupEntries += $sess; Set-RDMTemplate $grTemplates[0]
```

Retrieves all group templates.
Fetches the entry 'ASession' and add it to the first group template.
Save the template with the new added entry.

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

### -Template
Template must be retrieved from Get-RDMTemplate

```yaml
Type: PSTemplate[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSTemplate
An object PSTemplate can be piped to the parameter Template

## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Set-RDMTemplate -detailed".
For technical information, type "Get-Help Set-RDMTemplate -full".

## RELATED LINKS

[Get-RDMTemplate](http://127.0.0.1:1111/docs/Get-RDMTemplate/)

[New-RDMTemplate](http://127.0.0.1:1111/docs/New-RDMTemplate/)

[Remove-RDMTemplate](http://127.0.0.1:1111/docs/Remove-RDMTemplate/)

