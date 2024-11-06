---
title: 'New-DSCredentialEntry'
date: 2024-11-06
---


# New-DSCredentialEntry

## SYNOPSIS
Create a new entry of type 'Credentials'.

## SYNTAX

```
New-DSCredentialEntry [-ConnectionSubType <CredentialResolverConnectionType>] [-Name] <String>
 [[-Domain] <String>] [[-Username] <String>] [[-Password] <String>] [[-MnemonicPassword] <String>]
 [[-VaultID] <Guid>] [[-Group] <String>] [-PromptForPassword] [-Description <String>] [-Tags <String>]
 [-Expiration <String>] [-CredentialViewedCommentIsRequired] [-TicketNumberIsRequiredOnCredentialViewed]
 [-CredentialViewedPrompt] [-CheckoutMode <CheckOutMode>] [-AllowOffline <AllowOffline>]
 [-PrivateKeyType <PrivateKeyType>] [-PrivateKeyPath <String>] [-PrivateKeyPassphrase <String>]
 [-PromptForPassphrase] [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a new entry of type 'Credentials' with the parameters supplied.
For the supported subtypes, see the ConnectionSubType parameter.

## EXAMPLES

### EXAMPLE
```
PS C:\>     $NewCredEntry = @{
        VaultId                                  = ([guid]::Empty)
        EntryName                                = 'rootlocal '
        Username                                 = 'root'
        Password                                 = 'Pa$$w0rd!'
        Folder                                   = 'Powershell rules'
        credentialViewedCommentIsRequired        = $true
        credentialViewedPrompt                   = $true
        ticketNumberIsRequiredOnCredentialViewed = $true
        checkOutMode                             = 'Default'
        Description                              = 'This is a description'
        Tags                                     = '1 2 3 4 5'
    };
                
    New-DSCredentialEntry @NewCredEntry
```

Create a 'Username/Password' credential.

## PARAMETERS

### -AllowOffline
Entry's offline mode.

```yaml
Type: AllowOffline
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AsLegacyResponse
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object.
Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

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

### -CheckoutMode
Entry's checkout mode.

```yaml
Type: CheckOutMode
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ConnectionSubType
Connection sub-type.
Used for connections of type Credentials.
Supported sub-type are Default (Username/Password) or PrivateKey

```yaml
Type: CredentialResolverConnectionType
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CredentialViewedCommentIsRequired
A comment is required to view entry's credentials

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

### -CredentialViewedPrompt
Prompt the user for comment/ticket number

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

### -Description
Entry's description

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

### -Domain
Domain's name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Expiration
Entry's expiration date (ISO-8601 format (yyyy-mm-ddThh:mm:ss.000Z)

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

### -Group
Entry's location in the vault (folder name, noot ID)

```yaml
Type: String
Parameter Sets: (All)
Aliases: Folder

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MnemonicPassword
Entry's mnemonic password to help remembering the password

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Entry's name

```yaml
Type: String
Parameter Sets: (All)
Aliases: EntryName

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
Entry's password

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PrivateKeyPassphrase
Private key passphrase

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

### -PrivateKeyPath
Full private key path (*.ppk)

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

### -PrivateKeyType
Private key type.
The default type is Data.

```yaml
Type: PrivateKeyType
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PromptForPassphrase
Prompt for passphrase before checkout.

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

### -PromptForPassword
Prompt for password when checkout

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

### -Tags
Entry's tags (keywords).
Each word separated by a space is considered a keyword.

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

### -TicketNumberIsRequiredOnCredentialViewed
A ticket number is required to view entry's credentials

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

### -Username
Entry's username

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VaultID
Entry's vault ID.

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
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

### System.Management.Automation.PSObject
### RemoteDesktopManager.PowerShellModule.Private.ServerResponse
## NOTES
For more information, type "Get-Help New-DSCredentialEntry -detailed".
For technical information, type "Get-Help New-DSCredentialEntry -full".

## RELATED LINKS

[New-DSEntryBase](http://127.0.0.1:1111/docs/New-DSEntryBase/)

[New-DSRDPEntry](http://127.0.0.1:1111/docs/New-DSRDPEntry/)

[New-DSSSHShellEntry](http://127.0.0.1:1111/docs/New-DSSSHShellEntry/)

