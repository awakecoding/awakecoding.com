---
title: 'Get-RDMFavoriteEntry'
date: 2024-11-06
---


# Get-RDMFavoriteEntry

## SYNOPSIS
Get the entries marked as favorites

## SYNTAX

### Name (Default)
```
Get-RDMFavoriteEntry [[-Name] <String[]>] [-CaseSensitive] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Literal
```
Get-RDMFavoriteEntry [[-LiteralName] <String[]>] [-CaseSensitive] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get the entries marked as favorites.

## EXAMPLES

### EXAMPLE
```
PS C:\> Get-RDMFavoriteEntry | Select ID, Name
```

List all the IDs and names of the favorites

## PARAMETERS

### -CaseSensitive
Filtering by name and group name will be case sensitive.

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

### -LiteralName
Filter the entries by their name.
No wildcard supports.

```yaml
Type: String[]
Parameter Sets: Literal
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Filter the entries by their name.
Support wildcard characters.

```yaml
Type: String[]
Parameter Sets: Name
Aliases:

Required: False
Position: 1
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]
## NOTES
For more information, type "Get-Help Get-RDMFavoriteEntry -detailed".
For technical information, type "Get-Help Get-RDMFavoriteEntry -full".

## RELATED LINKS

[Add-RDMFavoriteEntry](http://127.0.0.1:1111/docs/Add-RDMFavoriteEntry/)

[Remove-RDMFavoriteEntry](http://127.0.0.1:1111/docs/Remove-RDMFavoriteEntry/)

