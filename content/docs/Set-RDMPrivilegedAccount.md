---
title: 'Set-RDMPrivilegedAccount'
date: 2024-11-06
---


# Set-RDMPrivilegedAccount

## SYNOPSIS
Set RDM privileged account.

## SYNTAX

### UsernamePassword
```
Set-RDMPrivilegedAccount [[-AlwaysAskPassword] <Boolean>] [[-Domain] <String>] [[-Password] <SecureString>]
 [[-Username] <String>] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### FromPrivilegedAccount
```
Set-RDMPrivilegedAccount [[-Session] <PSConnection>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Set RDM privileged account.
Set Username/Password type directly or modify the result of Get-RDMPrivilegedAccount.To modify member starting with Safe, set the property without the Safe.
On Windows, the policy DisableMyPrivilegedAccount prevent using this cmdlet.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $pwd = Read-Host -AsSecureString; Set-RDMPrivilegedAccount username domain $pwd
```

Set RDM privileged account of the type Username/Password.

### EXAMPLE 2
```
PS C:\> $privAcc = Get-RDMPrivilegedAccount; $privAcc.Credentials.SecretServerPassword = (ConvertTo-SecureString -AsPlainText 'aPassword'); $privAcc.Credentials.SecretServerUsername = 'aPassword'; $privAcc.Credentials.SecretServerDomain = 'aDomain'; Set-RDMPrivilegedAccount -Session $privAcc
```

Fetch the privileged account.
Modify the Secret Server's domain, password and username value.
Save the modificatons.
The password modification can be seen in the value change of the field SafeSecretServerPassword.

## PARAMETERS

### -AlwaysAskPassword
Set Always ask password option in privileged account

```yaml
Type: Boolean
Parameter Sets: UsernamePassword
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Domain
Set domain in privileged account

```yaml
Type: String
Parameter Sets: UsernamePassword
Aliases:

Required: False
Position: 2
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

### -Password
Set password in privileged account

```yaml
Type: SecureString
Parameter Sets: UsernamePassword
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Session
The credentials obtained from Get-RDMPrivilegedAccount.

```yaml
Type: PSConnection
Parameter Sets: FromPrivilegedAccount
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Username
Set username in privileged account

```yaml
Type: String
Parameter Sets: UsernamePassword
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
For more information, type "Get-Help Set-RDMPrivilegedAccount -detailed".
For technical information, type "Get-Help Set-RDMPrivilegedAccount -full".

## RELATED LINKS

[Get-RDMPrivilegedAccount](http://127.0.0.1:1111/docs/Get-RDMPrivilegedAccount/)

