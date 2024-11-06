---
title: 'Set-RDMPersonalSSHKey'
date: 2024-11-06
---


# Set-RDMPersonalSSHKey

## SYNOPSIS
Set 'My Personal SSH key' from 'My Account Settings'

## SYNTAX

### InputObject
```
Set-RDMPersonalSSHKey -InputObject <PSConnection> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Name
```
Set-RDMPersonalSSHKey -Key <PSSSHKey> [-UserName <String>] [-Password <SecureString>]
 [-Passphrase <SecureString>] [-SavePassphrase <Boolean>] [-AutomaticallyLoadToKeyAgent]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Filename
```
Set-RDMPersonalSSHKey -Filename <String> [-UserName <String>] [-Password <SecureString>]
 [-Passphrase <SecureString>] [-SavePassphrase <Boolean>] [-AutomaticallyLoadToKeyAgent]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Set 'My Personal SSH key' from 'My Account Settings'.
It can be updated in three ways:
1) InputObject: From a PSConnection object obtained from Get-RDMPersonalSSHKey.
2) Key: From a new SSH key obtained from New-RDMSSHKey.
3) Filename: From a private key file ('.pri', '.ppk', '.key')

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $sshKey = Get-RDMPersonalSSHKey;
        $sshKey.Credentials.PrivateKeyAutomaticallyLoadToKeyAgent = $true
        Set-RDMPersonalSSHKey -InputObject $sshKey
```

Modify 'My Personal SSH Key' to automatically load to SSH key agent

### EXAMPLE 2
```
PS C:\> New-RDMSSHKey -Algorithm ED25519 -Format OpenSSH -Comment 'asdf' -Size 1024 -Round 12 | Set-RDMPersonalSSHKey
```

Create a new PSSHKey and save it as 'My Personal SSH Key'

### EXAMPLE 3
```
PS C:\> Set-RDMPersonalSSHKey -Filename 'C:\my\path\filea.ppk'
```

Change the private key file for 'My Personal SSH Key'

## PARAMETERS

### -AutomaticallyLoadToKeyAgent
Automatically load to SSH key agent

```yaml
Type: SwitchParameter
Parameter Sets: Name, Filename
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filename
Private key file ('.pri', '.ppk', '.key

```yaml
Type: String
Parameter Sets: Filename
Aliases:

Required: True
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
Entry representing 'My Personal SSH Key'

```yaml
Type: PSConnection
Parameter Sets: InputObject
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Key
SSH key generated with New-RDMSSHKey

```yaml
Type: PSSSHKey
Parameter Sets: Name
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Passphrase
Passphrase for the private key

```yaml
Type: SecureString
Parameter Sets: Name, Filename
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
Overrides the password

```yaml
Type: SecureString
Parameter Sets: Name, Filename
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SavePassphrase
Save the passphrase in the credential

```yaml
Type: Boolean
Parameter Sets: Name, Filename
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserName
Overrides the username

```yaml
Type: String
Parameter Sets: Name, Filename
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection
PSConnection object obtained from Get-RDMPersonalSSHKey

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSSSHKey
PSSSHKey object obtained from New-RDMSSHkey

## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Set-RDMPersonalSSHKey -detailed".
For technical information, type "Get-Help Set-RDMPersonalSSHKey -full".

## RELATED LINKS

[Get-RDMPersonalSSHKey](http://127.0.0.1:1111/docs/Get-RDMPersonalSSHKey/)

[New-RDMSSHKey](http://127.0.0.1:1111/docs/New-RDMSSHKey/)

