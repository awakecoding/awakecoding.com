---
title: 'New-DSPamFolder'
date: 2024-11-06
---


# New-DSPamFolder

## SYNOPSIS
Create a pam folder

## SYNTAX

### Default (Default)
```
New-DSPamFolder -Name <String> -VaultID <Guid> [-Group <String>] [-Security <PamUserPermission[]>]
 [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### NewVault
```
New-DSPamFolder -Name <String> [-Security <PamUserPermission[]>] [-AsNewVault] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a pam folder.
Set it as a new vault or a subfolder of an existing folder.

## EXAMPLES

### EXAMPLE
```
PS C:\> New-DSPamFolder -Name 'SubFolderA' -VaultID $vaultId -Group 'FolderA'
```

Create a new PAM folder named 'SubFolderA' as a subfolder of 'FolderA' in the PAM vault whose ID is stored in $vaultId

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

### -AsNewVault
For Devolutions Server prior to version 2024.3.0.0, the new folder's parent will be the root.
Else, use the New-DSPamVault cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: NewVault
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Group
Group where the folder will be created.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Folder's name

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

### -Security
Security permissions.
Only for Devolutions Server prior to version 2024.3.0.0

```yaml
Type: PamUserPermission[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VaultID
PAM vault ID.
For Devolution Server prior to the version 2024.3.0.0, it is the id of the new folder's parent.

```yaml
Type: Guid
Parameter Sets: Default
Aliases: ParentFolderID

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
### Devolutions.Server.Pam.Dto.PamFolder
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Pam.Dto.PamFolder, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help New-DSPamFolder -detailed".
For technical information, type "Get-Help New-DSPamFolder -full".

## RELATED LINKS

[Get-DSPamFolder](http://127.0.0.1:1111/docs/Get-DSPamFolder/)

[Remove-DSPamFolder](http://127.0.0.1:1111/docs/Remove-DSPamFolder/)

[Update-DSPamFolder](http://127.0.0.1:1111/docs/Update-DSPamFolder/)

