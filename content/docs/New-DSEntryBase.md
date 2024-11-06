---
title: 'New-DSEntryBase'
date: 2024-11-06
---


# New-DSEntryBase

## SYNOPSIS
Create a new entry.

## SYNTAX

### Value
```
New-DSEntryBase [-JsonBody] <String> [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### RDMConnection
```
New-DSEntryBase [-FromRDMConnection] <ConnectionInfoEntity> [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a new entry without validating anything.
This is the functional equivalent of a passthrough.
Unless you know exactly what you are doing, you should probably use the CMDlets created by us to generate new entries.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

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

### -FromRDMConnection
Entry obtained from Get-DSEntry -AsRDMConnection.
It can be used to create a copy of an existing entry wihtout losing any data.

```yaml
Type: ConnectionInfoEntity
Parameter Sets: RDMConnection
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -JsonBody
Entry in JSON

```yaml
Type: String
Parameter Sets: Value
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

### System.Management.Automation.PSObject
### Devolutions.RemoteDesktopManager.Business.Entities.ConnectionInfoEntity
### RemoteDesktopManager.PowerShellModule.Private.ServerResponse
## NOTES
For more information, type "Get-Help New-DSEntryBase -detailed".
For technical information, type "Get-Help New-DSEntryBase -full".

## RELATED LINKS

[New-DSCredentialEntry](http://127.0.0.1:1111/docs/New-DSCredentialEntry/)

[New-DSRDPEntry](http://127.0.0.1:1111/docs/New-DSRDPEntry/)

[New-DSSSHShellEntry](http://127.0.0.1:1111/docs/New-DSSSHShellEntry/)

