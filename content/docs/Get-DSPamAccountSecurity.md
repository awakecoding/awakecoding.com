---
title: 'Get-DSPamAccountSecurity'
date: 2024-11-06
---


# Get-DSPamAccountSecurity

## SYNOPSIS
Get the security of a pam account

## SYNTAX

```
Get-DSPamAccountSecurity [-ID] <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Get the security of a pam account.

## EXAMPLES

### EXAMPLE
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

### -ID
Id of the pam folder whose security will be get.

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: True
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

### Devolutions.Server.ApiWrapper.Models.Pam.Dto.Permission.PamUserPermission[]
### Devolutions.RemoteDesktopManager.Business.ConnectionPermission[]
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.ApiWrapper.Models.Pam.Dto.Permission.PamUserPermission[], RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help Get-DSPamAccountSecurity -detailed".
For technical information, type "Get-Help Get-DSPamAccountSecurity -full".

## RELATED LINKS

[New-DSPamAccount](http://127.0.0.1:1111/docs/New-DSPamAccount/)

[Update-DSPamAccount](http://127.0.0.1:1111/docs/Update-DSPamAccount/)

