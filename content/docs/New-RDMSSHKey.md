---
title: 'New-RDMSSHKey'
date: 2024-11-06
---


# New-RDMSSHKey

## SYNOPSIS
Create an SSH key.

## SYNTAX

### Private
```
New-RDMSSHKey [-Algorithm] <String> [-Comment <String>] -Format <String> [-SavePrivateKey <String>]
 [-Size <Int32>] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### EncryptedPrivate
```
New-RDMSSHKey [-Algorithm] <String> [-Comment <String>] -Format <String> -Passphrase <SecureString>
 [-SavePrivateKey <String>] [-Size <Int32>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Public
```
New-RDMSSHKey [-Algorithm] <String> [-Comment <String>] [-SavePublicKey <String>] [-Size <Int32>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create an SSH key.
The public key will be returned.
There is also the possiblity the save a public or private key file.
A passphrase can be used to protect the private key file.
In both cases, an existing file will be overwritten.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $pubKey = New-RDMSSHkey -Algorithm RSA -Comment username@hostname -Size 2048
```

Create an SSH public key of 2048 bits using RSA and of format is Putty.
The resulting key ends with the comment (username@hostname).

### EXAMPLE 2
```
PS C:\> $pubKey = New-RDMSSHkey ECDSA -Comment username@hostname -Size 256 -SavePublicKey C:\mypath\sshPublicKey.pub
```

Create an SSH public key of 256 bits using ECDSA with the comment username@hostname.
The key is saved in the file C:\mypath\sshPublicKey.pub.
If the file exists, it will be overwritten.

### EXAMPLE 3
```
PS C:\> $passwd = Read-Host -AsSecureString; $pubKey = New-RDMSSHkey -Algorithm ECDSA -Format PKCS8 -Encryption SHA1_RC4_128 -Size 521 -Round 64 -SavePrivateKey C:\mypath\sshPrivateKey.pri -Passphrase $passwd
```

First, the password used to encrypt the file is generated from the input of the user.
Create an SSH private key of 521 bits using ECDSA with an empty comment.
The key is saved in the file C:\mypath\sshPrivateKey.pri.
The format used is PKCS8 with encryption SHA1_RC4_128 and 64 rounds.
If the passphrase used is empty, no encryption will occur.

### EXAMPLE 4
```
PS C:\> $pubKey = New-RDMSSHkey -Algorithm ECDSA -Comment username@hostname -Format PKCS8 -Size 521 -Round 64 -SavePrivateKey C:\mypath\sshPrivateKey.pri
```

Create an SSH private key of 521 bits using ECDSA with the comment username@hostname.
The key is saved in the file C:\mypath\sshPrivateKey.pri and is not encrypted.

## PARAMETERS

### -Algorithm
The algorithm used to generate the SSH key.

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

### -Comment
The comment at the end of a public key.
No space allowed.

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

### -Format
The format used to store the private key.

```yaml
Type: String
Parameter Sets: Private, EncryptedPrivate
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Passphrase
Passphrase used to protected the private key file.
An empty SecureString is accepted, meaning no encryption will occur.

```yaml
Type: SecureString
Parameter Sets: EncryptedPrivate
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SavePrivateKey
Save the private key in a file at the specified path.
The supported extensions are: PKCS#1/OpenSSL (*.key), PKCS#8 (*.pri) and PuTTY (*ppk)

```yaml
Type: String
Parameter Sets: Private, EncryptedPrivate
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SavePublicKey
Save the public key in a file at the specified path.
The supported extension is (*.pub).

```yaml
Type: String
Parameter Sets: Public
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Size
The number of bits in the key for RSA and ECDSA algorithms.
For RSA, the default value is 2048 and the valid values are: 1024, 2048, 3072, 4096, 6144 and 8192. 
For ECDSA, the default value is 256 and the valid values are: 256, 384 and 521.

```yaml
Type: Int32
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSSSHKey
## NOTES
For more information, type "Get-Help New-RDMSSHKey -detailed".
For technical information, type "Get-Help New-RDMSSHKey -full".

## RELATED LINKS
