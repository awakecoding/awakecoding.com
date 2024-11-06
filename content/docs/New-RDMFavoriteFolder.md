---
title: 'New-RDMFavoriteFolder'
date: 2024-11-06
---


# New-RDMFavoriteFolder

## SYNOPSIS
Create a favorite folder

## SYNTAX

```
New-RDMFavoriteFolder [-Name] <String> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a favorite folder.
It can be used to organize the favorite entries.

## EXAMPLES

### EXAMPLE
```
PS C:\> New-RDMFavoriteFolder -Name 'FolderA\SubFolderA'
```

Create a new favorite folder named 'SubFolderA' inside the existing favorite folder named 'FolderA'.

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
Name of the favorite folder to create.
It cannot contain a character that is not allowed in a filename or path name.

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
For more information, type "Get-Help New-RDMFavoriteFolder -detailed".
For technical information, type "Get-Help New-RDMFavoriteFolder -full".

## RELATED LINKS

[Remove-RDMFavoriteEntry](http://127.0.0.1:1111/docs/Remove-RDMFavoriteEntry/)

