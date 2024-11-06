---
title: 'Get-RDMPersonalCredentials'
date: 2024-11-06
---


# Get-RDMPersonalCredentials

## SYNOPSIS
Get the connection representing 'MyPersonalCredentials'.

## SYNTAX

```
Get-RDMPersonalCredentials [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Get the connection representing 'MyPersonalCredentials'.
All the pertinent informations are in the property Credentials.
On Windows, the policy DisableMyPersonalCredentials prevent using this cmdlet.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $persoCreds = Get-RDMPersonalCredentials
```

Store the personal credentials in the variable $persoCreds.
Access the desired values in $persoCreds.Credentials.

### EXAMPLE 2
```
PS C:\> $perso = Get-RDMPersonalCredentials; $perso.Credentials.SecretServerPassword = (ConvertTo-SecureString -AsPlainText 'aPassword'); $perso.Credentials.SecretServerUsername = 'aPassword'; $perso.Credentials.SecretServerDomain = 'aDomain'; Set-RDMPersonalCredentials -Session $perso
```

Fetch the personal credentials.
Modify the Secret Server's domain, password and username value.
Save the modificatons. 
The password modification can be seen in the value change of the field SafeSecretServerPassword.

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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection
## NOTES
For more information, type "Get-Help Get-RDMPersonalCredentials -detailed".
For technical information, type "Get-Help Get-RDMPersonalCredentials -full".

## RELATED LINKS

[Set-RDMPersonalCredentials](http://127.0.0.1:1111/docs/Set-RDMPersonalCredentials/)

