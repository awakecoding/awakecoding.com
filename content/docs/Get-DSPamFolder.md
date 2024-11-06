---
title: 'Get-DSPamFolder'
date: 2024-11-06
---


# Get-DSPamFolder

## SYNOPSIS
Get pam folders

## SYNTAX

### GetAll (Default)
```
Get-DSPamFolder [-VaultID <Guid>] [-IncludeFolder] [-Root] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### GetById
```
Get-DSPamFolder -FolderID <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get pam folders with three alternatives ways: all of them with the optional inclusion of the root folder, a single one by its ID, or the root folder.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $root = Get-DSPamFolder -VaultID $pamVaultID -Root
```

Obtain the root of the PAM vault whose ID is $pamVaultID

### EXAMPLE 2
```
PS C:\> $root = Get-DSPamFolder -VaultID $pamVaultID
```

Obtain the all folders in the PAM vault whose ID is $pamVaultID

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

### -FolderID
Id of the pam folder to get.

```yaml
Type: Guid
Parameter Sets: GetById
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeFolder
Root folder will be included with all the others.

```yaml
Type: SwitchParameter
Parameter Sets: GetAll
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Root
Root folder will be fetched.

```yaml
Type: SwitchParameter
Parameter Sets: GetAll
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VaultID
Id of the pam vault containing the folders.

```yaml
Type: Guid
Parameter Sets: GetAll
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

### System.Management.Automation.PSObject
### System.Management.Automation.PSObject[]
### Devolutions.Server.Pam.Dto.PamFolder[]
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Pam.Dto.PamFolder, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.Pam.Dto.PamFolder, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help Get-DSPamFolder -detailed".
For technical information, type "Get-Help Get-DSPamFolder -full".

## RELATED LINKS

[New-DSPamFolder](http://127.0.0.1:1111/docs/New-DSPamFolder/)

[Remove-DSPamFolder](http://127.0.0.1:1111/docs/Remove-DSPamFolder/)

[Update-DSPamFolder](http://127.0.0.1:1111/docs/Update-DSPamFolder/)

