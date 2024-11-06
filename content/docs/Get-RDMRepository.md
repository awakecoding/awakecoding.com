---
title: 'Get-RDMRepository'
date: 2024-11-06
---


# Get-RDMRepository

## SYNOPSIS
Retrieve the list of available repositories.

## SYNTAX

```
Get-RDMRepository [-CaseSensitive] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Retrieve the list of available repositories for the current selected data source.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMRepository
```

Retrieves the list of available repository.

### EXAMPLE 2
```
PS C:\> $list = Get-RDMRepository; $list[0]
```

Retrieves the list of available repositories and displays the first item.

### EXAMPLE 3
```
PS C:\> $list = Get-RDMRepository; $list[1].Name = "New Name";Set-RDMRepository $list[1]
```

Retrieves the list of available respositories, modify the name of the second role, update the repository.

## PARAMETERS

### -CaseSensitive
Case sensitive

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

### -Name
Repository name

```yaml
Type: String
Parameter Sets: (All)
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

### System.String
Repository name

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRepositoryInfo[]
## NOTES
For more information, type "Get-Help Get-RDMRepository -detailed".
For technical information, type "Get-Help Get-RDMRepository -full".

## RELATED LINKS
