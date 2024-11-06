---
title: 'Add-RDMFavoriteEntry'
date: 2024-11-06
---


# Add-RDMFavoriteEntry

## SYNOPSIS
Add entries to the favorites

## SYNTAX

```
Add-RDMFavoriteEntry -InputObject <PSConnection[]> [-FolderName <String>] [-PassThru]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Add entries to the favorites.
Entries from the System Vault, as well as subentries, are prohibited from being added to the favorites.

## EXAMPLES

### EXAMPLE
```
PS C:\> Get-RDMEntry -Name 'Entry A' | Add-RDMFavoriteEntry -FolderName 'FolderA\SubFolderA'
```

Add the entry named 'Entry A' to the favorite folder named 'FolderA\SubFolderA'.

## PARAMETERS

### -FolderName
Favorite folder where the entries will be added.
If not specified, it will be at the root.

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

### -InputObject
Entries to add to the favorites

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
Entries to be added to the favorites

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]
## NOTES
For more information, type "Get-Help Add-RDMFavoriteEntry -detailed".
For technical information, type "Get-Help Add-RDMFavoriteEntry -full".

## RELATED LINKS

[Get-RDMFavoriteEntry](http://127.0.0.1:1111/docs/Get-RDMFavoriteEntry/)

[Remove-RDMFavoriteEntry](http://127.0.0.1:1111/docs/Remove-RDMFavoriteEntry/)

