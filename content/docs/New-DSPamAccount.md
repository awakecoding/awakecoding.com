---
title: 'New-DSPamAccount'
date: 2024-11-06
---


# New-DSPamAccount

## SYNOPSIS
Create a pam account.

## SYNTAX

```
New-DSPamAccount -CredentialType <PamCredentialType> -VaultID <Guid> -Name <String> [-Group <String>]
 [-Permission <PSPermissionWrapper[]>] [-ResetPasswordOnCheckIn] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] -ProviderID <Guid> [-CustomProperties <Hashtable>] [-Username <String>]
 [-Password <String>] [-Description <String>] [<CommonParameters>]
```

## DESCRIPTION
Create a pam account.
For custom account, custom properties are not supported yet.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> New-DSPamAccount -Name DomAcc -CredentialType DomainUser -FolderID $folderID -Username MyUsername -Password Pa$$w0rd! -Description "My description" -ProviderID $providerID
```

Create an account with a pam provider of the type "Domain User" where the account will be synchronized.

### EXAMPLE 2
```
PS C:\> New-DSPamAccount -Name LoneAcc -CredentialType Standalone -FolderID $folderID -Username MyUsername -Password Pa$$w0rd! -Description "My description"
```

Create a standalone account.

### EXAMPLE 3
```
PS C:\> New-DSPamAccount -Name CertAcc -CredentialType Certificate -FolderID $folderID -Certificate "certificateValue" -Passphrase "passphraseValue"
```

Create a certificate account.

### EXAMPLE 4
```
PS C:\> $security = Get-DSPamAccountSecurity -ID $existingAccountID;
    New-DSPamAccount -Name DomAcc -CredentialType DomainUser -FolderID $folderID -Username MyUsername -Password Pa$$w0rd! -ProviderID $providerID -Security $security
```

Create a new PAM account named 'DomAcc' with the same security as the PAM account whose ID is stored in $existingAccountID

## PARAMETERS

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

### -CredentialType
Account's credential type

```yaml
Type: PamCredentialType
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CustomProperties
Custom properties from the template.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
Pam account's description.

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
Pam account's folder path.

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

### -Name
Pam account's name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
Pam account's password.

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

### -Permission
Security permissions.
For server version prior to 2024.3.0.0, the supported type is PamUserPermissions.
After that, the supported type is ConnectionPermission.

```yaml
Type: PSPermissionWrapper[]
Parameter Sets: (All)
Aliases: Security

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProviderID
Provider's ID where the account will be synced

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResetPasswordOnCheckIn
Reset password on check in

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
Pam account's credentials username.

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

### -VaultID
ID of the vault that will contains the new pam account.

```yaml
Type: Guid
Parameter Sets: (All)
Aliases: FolderID

Required: True
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

### System.Management.Automation.PSObject
### Devolutions.Server.Pam.Dto.PamCredential
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Pam.Dto.PamCredential, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help New-DSPamAccount -detailed".
For technical information, type "Get-Help New-DSPamAccount -full".

## RELATED LINKS

[Get-DSPamAccount](http://127.0.0.1:1111/docs/Get-DSPamAccount/)

[Get-DSPamAccountSyncStatus](http://127.0.0.1:1111/docs/Get-DSPamAccountSyncStatus/)

[Remove-DSPamAccount](http://127.0.0.1:1111/docs/Remove-DSPamAccount/)

[Update-DSPamAccount](http://127.0.0.1:1111/docs/Update-DSPamAccount/)

