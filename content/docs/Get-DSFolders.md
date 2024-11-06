---
title: 'Get-DSFolders'
date: 2024-11-06
---


# Get-DSFolders

## SYNOPSIS
Gets all folders for a given vault.

## SYNTAX

```
Get-DSFolders -VaultID <Guid> [-IncludeSubFolders] [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Gets all folders for a given vaults and include all subfolders if 'IncludeSubFolders' flag is present.

## EXAMPLES

### EXAMPLE
```
PS C:\> Get-DSFolders -VaultId '00000000-0000-0000-0000-000000000000' -IncludeSubFolders
```

Return all folders and subfolders in default vault

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

### -IncludeSubFolders
Used to select if subfolders should be included

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VaultID
Folder's ID

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

### System.Management.Automation.PSObject[]
### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=7.4.4.500, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]
## NOTES
For more information, type "Get-Help Get-DSFolders -detailed".
For technical information, type "Get-Help Get-DSFolders -full".

## RELATED LINKS
