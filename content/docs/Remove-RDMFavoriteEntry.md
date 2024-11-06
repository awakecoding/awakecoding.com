---
title: 'Remove-RDMFavoriteEntry'
date: 2024-11-06
---


# Remove-RDMFavoriteEntry

## SYNOPSIS
Remove entries from the favorites

## SYNTAX

```
Remove-RDMFavoriteEntry -InputObject <PSConnection[]> [-PassThru] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Remove entries from the favorites

## EXAMPLES

### EXAMPLE
```
PS C:\> Get-RDMFavoriteEntry -Name 'EntryA' | Remove-RDMFavoriteEntry
```

Remove the entry named 'EntryA' from the favorites

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
Entries to remove from the favorites

```yaml
Type: PSConnection[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -PassThru
Return the PSConnection objects

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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]
Entries to be removed from the favorites

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]
## NOTES
For more information, type "Get-Help Remove-RDMFavoriteEntry -detailed".
For technical information, type "Get-Help Remove-RDMFavoriteEntry -full".

## RELATED LINKS

[Add-RDMFavoriteEntry](http://127.0.0.1:1111/docs/Add-RDMFavoriteEntry/)

[Get-RDMFavoriteEntry](http://127.0.0.1:1111/docs/Get-RDMFavoriteEntry/)

