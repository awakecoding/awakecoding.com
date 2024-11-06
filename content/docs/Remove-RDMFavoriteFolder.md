---
title: 'Remove-RDMFavoriteFolder'
date: 2024-11-06
---


# Remove-RDMFavoriteFolder

## SYNOPSIS
Remove a favorite folder

## SYNTAX

```
Remove-RDMFavoriteFolder [-Name] <String> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Remove a favorite folder.
If it contains entries, the user will be prompted to see if the favorite entries will be moved to the parent folder or deleted.

## EXAMPLES

### EXAMPLE
```
PS C:\> Remove-RDMFavoriteFolder -Name 'FolderA\SubFolderA'
```

Remove the favorite folder named 'SubFolderA'

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

### -Name
Name of the favorite folder to delete.

```yaml
Type: String
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

### None
## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Remove-RDMFavoriteFolder -detailed".
For technical information, type "Get-Help Remove-RDMFavoriteFolder -full".

## RELATED LINKS

[New-RDMFavoriteFolder](http://127.0.0.1:1111/docs/New-RDMFavoriteFolder/)

