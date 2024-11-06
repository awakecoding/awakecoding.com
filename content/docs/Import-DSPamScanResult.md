---
title: 'Import-DSPamScanResult'
date: 2024-11-06
---


# Import-DSPamScanResult

## SYNOPSIS
Import the accounts of a PAM scan result

## SYNTAX

### Reset
```
Import-DSPamScanResult [-ScanResult] <PSScanResult[]> [-Provider] <PamProvider> [-FolderID] <Guid>
 [-ResetPasswordOnImport] [-ResetPasswordOnCheckIn] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Unmanaged
```
Import-DSPamScanResult [-ScanResult] <PSScanResult[]> [-Provider] <PamProvider> [-FolderID] <Guid>
 [-UnmanagedAction <UnmanagedImportAction>] [-Unmanaged] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Import the accounts of a PAM scan result

## EXAMPLES

### EXAMPLE
```
PS C:\> $providerID = 'the-desired-pam-provider-ID'
        $folderID = 'the-desired-pam-vault-or-folder-ID'
        $configuration = Get-DSPamScanConfiguration -LiteralName 'ScanA';
        $toImport = Get-DSPamScanResult -InputObject $configuration -Filter '@domain.net' -ExcludedManaged;
        $providerResult = Get-DSPamProvider
        $provider = $providerResult.Data | Where -Property ID -eq $providerID
        $importResult = Import-DSPamScanResult -ScanResult $toImport -Provider $provider -FolderID $folderID
```

From the 'ScanA' PAM scan's result, import all accounts who have '@domain.net' in their username, hostname, fullname, or description in the PAM folder specified by $folderID.

## PARAMETERS

### -FolderID
Pam Folder

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Provider
Provider obtained from Get-DSPamProvider

```yaml
Type: PamProvider
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResetPasswordOnCheckIn
Reset password on check in

```yaml
Type: SwitchParameter
Parameter Sets: Reset
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResetPasswordOnImport
Reset password on import

```yaml
Type: SwitchParameter
Parameter Sets: Reset
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScanResult
Pam accounts revealed by a PAM scan.
Must be of the same type.

```yaml
Type: PSScanResult[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Unmanaged
Set accounts to unmanaged

```yaml
Type: SwitchParameter
Parameter Sets: Unmanaged
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UnmanagedAction
Set accounts to unmanaged.
To manually set the password, you must modify directly the scan results.
The default action is to set the password manually.

```yaml
Type: UnmanagedImportAction
Parameter Sets: Unmanaged
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

### Devolutions.Server.Pam.Dto.Import.PamMultipleOperationResult`1[[Devolutions.RemoteDesktopManager.Business.Connection, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]][]
## NOTES
For more information, type "Get-Help Import-DSPamScanResult -detailed".
For technical information, type "Get-Help Import-DSPamScanResult -full".

## RELATED LINKS

[Get-DSPamScanResult](http://127.0.0.1:1111/docs/Get-DSPamScanResult/)

