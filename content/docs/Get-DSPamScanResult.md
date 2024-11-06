---
title: 'Get-DSPamScanResult'
date: 2024-11-06
---


# Get-DSPamScanResult

## SYNOPSIS
Retrieve the outcome of the most recent scan job associated with a specific scan configuration

## SYNTAX

```
Get-DSPamScanResult [-InputObject] <ScanConfigurationDto> [[-Filter] <String>] [-ExcludeManaged]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Retrieve the outcome of the most recent scan job associated with a specific scan configuration.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-DSPamScanConfiguration -LiteralName 'ScanA' | Get-DSPamScanResult
```

Get the scan result for the configuration named 'ScanA'

### EXAMPLE 2
```
PS C:\> $providerID = 'the-desired-pam-provider-ID'
        $folderID = 'the-desired-pam-vault-or-folder-ID'
        $configuration = Get-DSPamScanConfiguration -LiteralName 'ScanA';
        $toImport = Get-DSPamScanResult -InputObject $configuration -Filter '@domain.net' -ExcludedManaged;
        $providerResult = Get-DSPamProvider
        $provider = $providerResult.Data | Where -Property ID -eq $providerID
        $importResult = Import-DSPamScanResult -ScanResult $toImport -Provider $provider -FolderID $folderID
```

From the 'ScanA' PAM scan's result, import all users who have '@domain.net' in their username, hostname, fullname, or description in the PAM folder specified by $folderID.

## PARAMETERS

### -ExcludeManaged
Exclude the managed users

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

### -Filter
The global filter, identical to the web UI filter, is designed to be applied to the username, hostname, fullname, and description fields.

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

### -InputObject
PAM scan configuration object obtained from Get-DSPamScanConfiguration

```yaml
Type: ScanConfigurationDto
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
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

### Devolutions.Server.NetworkDiscovery.Dto.ScanConfigurationDto
PAM scan configuration object obtained from Get-DSPamScanConfiguration

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSScanResult.PSScanResult[]
## NOTES
For more information, type "Get-Help Get-DSPamScanResult -detailed".
For technical information, type "Get-Help Get-DSPamScanResult -full".

## RELATED LINKS

[Get-DSPamScanConfiguration](http://127.0.0.1:1111/docs/Get-DSPamScanConfiguration/)

[Import-DSPamScanResult](http://127.0.0.1:1111/docs/Import-DSPamScanResult/)

