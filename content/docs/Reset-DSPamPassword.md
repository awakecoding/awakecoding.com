---
title: 'Reset-DSPamPassword'
date: 2024-11-06
---


# Reset-DSPamPassword

## SYNOPSIS
Reset the password of a PAM account

## SYNTAX

```
Reset-DSPamPassword -AccountID <Guid> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Reset the password of a PAM account.

## EXAMPLES

### EXAMPLE
```
PS C:\> Reset-DSPamPassword -AccountID 'my-pam-account-id'
```

Reset the password of the PAM account whose ID is 'my-pam-account-id'

## PARAMETERS

### -AccountID
ID of the pam account containing the password

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
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

### System.Guid
ID of the PAM account whose password will be reset.

## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Reset-DSPamPassword -detailed".
For technical information, type "Get-Help Reset-DSPamPassword -full".

## RELATED LINKS

[Get-DSPamAccount](http://127.0.0.1:1111/docs/Get-DSPamAccount/)

