---
title: 'New-RDMRandomPassword'
date: 2024-11-06
---


# New-RDMRandomPassword

## SYNOPSIS
Create a new random password

## SYNTAX

### All (Default)
```
New-RDMRandomPassword [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### Session
```
New-RDMRandomPassword [[-Session] <PSConnection>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Mode
```
New-RDMRandomPassword -Mode <PasswordGeneratorMode> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Template
```
New-RDMRandomPassword [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [[-TemplateName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Create a new random password

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $randomPassword = New-RDMRandomPassword
```

Generate a random password with the default settings

### EXAMPLE 2
```
PS C:\> $randomPassword = New-RDMRandomPassword -TemplateName $templateName
```

Generate a random password with the template settings

### EXAMPLE 3
```
PS C:\> $session = Get-RDMSession -Name MySession; $randomPassword = New-RDMRandomPassword -Session $session
```

Generate a random password with the password complexity of the session

### EXAMPLE 4
```
PS C:\> $pwd = New-RandomPassword -Mode Default -MinimumDigit 10 -MinimumLength 1
```

Generate a random password composed of 10 digits.

### EXAMPLE 5
```
PS C:\> $pwd = New-RandomPassword -Mode SpecifiedSettings -Digit 1 -Bracket 0 -Underline 1 -Lowercase 0 -Special 0 -Uppercase 0
```

Generate a random password composed of at least 1 digit and 1 underline.
The other characters are either a digit, a lowercase, an uppercase, a special symbol, a bracket , or an underline.
High ANSI, minus and space characters are not present in the password.
There is not guarantuee the password is XML Compliant.

### EXAMPLE 6
```
PS C:\> $pwd = New-RandomPassword -Mode Passphrase -AppendNumber LastWord -CapitalizeFirstLetter FirstWord -PassphraseLength 10 -WordSeparator ""
```

Generate a random password composed of 10 unspaced english words.
Its first letter is the only one capitalized, and it ends with the only digit.

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

### -Mode
@{Text=}

```yaml
Type: PasswordGeneratorMode
Parameter Sets: Mode
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Session
Generate a random password with the password complexity of that session

```yaml
Type: PSConnection
Parameter Sets: Session
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TemplateName
Generate a random password with the template settings.

```yaml
Type: String
Parameter Sets: Template
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

### None
## NOTES
For more information, type "Get-Help New-RDMRandomPassword -detailed".
For technical information, type "Get-Help New-RDMRandomPassword -full".

## RELATED LINKS
