---
title: 'Get-DSPamFolderSecurity'
date: 2024-11-06
---


# Get-DSPamFolderSecurity

## SYNOPSIS
Get the security of a pam folder

## SYNTAX

```
Get-DSPamFolderSecurity [-ID] <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Get the security of a pam folder.

## EXAMPLES

### EXAMPLE
```
PS C:\> $foldersResponse = Get-DSPamFolder;
    $pamVault = $foldersResponse | Where Name -eq 'AnExistingVault';
    $security = Get-DSPamFolderSecurity -ID $pamVault.ID;
    New-DSPamFolder -Name 'PamVaultA' -Security $security -AsNewVault
```

Create a new PAM vault named 'PamFolderA' with the same security as the PAM vault named 'AnExistingVault'

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

### Devolutions.RemoteDesktopManager.Business.ConnectionPermission[]
### Devolutions.Server.ApiWrapper.Models.Pam.Dto.Permission.PamUserPermission[]
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.ApiWrapper.Models.Pam.Dto.Permission.PamUserPermission[], RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help Get-DSPamFolderSecurity -detailed".
For technical information, type "Get-Help Get-DSPamFolderSecurity -full".

## RELATED LINKS

[New-DSPamFolder](http://127.0.0.1:1111/docs/New-DSPamFolder/)

[Update-DSPamFolder](http://127.0.0.1:1111/docs/Update-DSPamFolder/)

