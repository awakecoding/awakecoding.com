---
title: 'Set-RDMCurrentRepository'
date: 2024-11-06
---


# Set-RDMCurrentRepository

## SYNOPSIS
Set the current repository.

## SYNTAX

### Id
```
Set-RDMCurrentRepository [-ID] <Guid> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### InputObject
```
Set-RDMCurrentRepository [-Repository] <PSRepositoryInfo> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Set the current repository.
Repository must be first fetch via repository property of the Get-RDMRepository cmdlet or via the New-RDMRepository result.

## EXAMPLES

### EXAMPLE
```
PS C:\> $repository = Get-RDMRepository -Name "MyRepo" ;Set-RDMCurrentRepository $repository
```

Get the repository named MyRepo and set it as the current repository.

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

### -ID
Specifies the GUID of the data source to set as the current.

The value must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}

```yaml
Type: Guid
Parameter Sets: Id
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Repository
Repository object, must be retrieved from Get-RDMRepository or created via New-RDMRepository.

```yaml
Type: PSRepositoryInfo
Parameter Sets: InputObject
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
For more information, type "Get-Help Set-RDMCurrentRepository -detailed".
For technical information, type "Get-Help Set-RDMCurrentRepository -full".

## RELATED LINKS
