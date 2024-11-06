---
title: 'Get-DSPamAccount'
date: 2024-11-06
---


# Get-DSPamAccount

## SYNOPSIS
Fetch pam accounts.

## SYNTAX

### GetByFolder (Default)
```
Get-DSPamAccount [-VaultID <Guid>] [-AsBasicInformation] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### GetByID
```
Get-DSPamAccount -AccountID <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Fetch pam accounts.
There is three way to do so.
First, get a specific account by using the AccountID parameter.
Second, get all pam accounts by calling the cmdlet without parameters.
Third, get all pam accounts of a specific folder by using the FolderID parameter.
In case there is a lot of PAM accounts, it is possible an TryGoOfflineException occurs.
If that is the case, there is two way to avoid that error.
First, when calling New-DSSession, use the Timeout parameter to increase the polling delay.
Another way is to use AsBasicInformation switch of this cmdlet.
This will return a simplified object with the information to quickly identify the PAM accounts of interest.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $searchRes = Search-DSEntry -By Username -Match ExactExpression -Value 'MyUsername' -IncludePamVaults -IncludeVault @();
        $search = $searchRes[0];
        $pamAccountRes = Get-DSPamAccount -AccountID $search.ID
```

Get the PAM account whose username is 'MyUsername'.
It is assumed in this example that the username is unique, so the search result contains a single result.

### EXAMPLE 2
```
PS C:\> $pamBasicRes = Get-DSPamAccount -AsBasicInformation;
        $nameStarts = $pamBasicRes | Where Label -like 'MyName*';
        foreach ($pamBasic in $nameStarts) { Remove-DSPamAccount -AccountID $pamBasic.ID }
```

Delete all PAM Accounts whose name starts with 'MyName'.

## PARAMETERS

### -AccountID
Pam account's ID

```yaml
Type: Guid
Parameter Sets: GetByID
Aliases: PamCredentialID

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AsBasicInformation
The returned object will be simplified.
It allows simple identification of the PAM Account (ID, Label, Username, Domain), its PAM folder (FolderID, FolderName), and its PAM vault (TeamFolderID).
It is quicker than obtaining the complete PAM Accounts objects.

```yaml
Type: SwitchParameter
Parameter Sets: GetByFolder
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

### -VaultID
Get all accounts in the specified folder

```yaml
Type: Guid
Parameter Sets: GetByFolder
Aliases: FolderID

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

### Devolutions.Server.Pam.Dto.PamCredential[]
### System.Management.Automation.PSObject[]
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Pam.Dto.PamCredential, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.Pam.Dto.PamCredential, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=7.4.4.500, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]
## NOTES
For more information, type "Get-Help Get-DSPamAccount -detailed".
For technical information, type "Get-Help Get-DSPamAccount -full".

## RELATED LINKS

[Get-DSPamAccountSyncStatus](http://127.0.0.1:1111/docs/Get-DSPamAccountSyncStatus/)

[New-DSPamAccount](http://127.0.0.1:1111/docs/New-DSPamAccount/)

[Remove-DSPamAccount](http://127.0.0.1:1111/docs/Remove-DSPamAccount/)

[Update-DSPamAccount](http://127.0.0.1:1111/docs/Update-DSPamAccount/)

