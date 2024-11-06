---
title: 'Test-DSGateway'
date: 2024-11-06
---


# Test-DSGateway

## SYNOPSIS
Ping the gateway server.

## SYNTAX

```
Test-DSGateway -GatewayID <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Ping the gateway server.
The Devolutions Gateway module is required.

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

### -GatewayID
ID of the gateway to fetch.

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

### RemoteDesktopManager.PowerShellModule.Private.ServerResponse
## NOTES
For more information, type "Get-Help Test-DSGateway -detailed".
For technical information, type "Get-Help Test-DSGateway -full".

## RELATED LINKS

[Get-DSGateway](http://127.0.0.1:1111/docs/Get-DSGateway/)

[Get-DSGatewayLogs](http://127.0.0.1:1111/docs/Get-DSGatewayLogs/)

[Get-DSGatewaySession](http://127.0.0.1:1111/docs/Get-DSGatewaySession/)

[New-DSGateway](http://127.0.0.1:1111/docs/New-DSGateway/)

[Remove-DSGateway](http://127.0.0.1:1111/docs/Remove-DSGateway/)

[Update-DSGateway](http://127.0.0.1:1111/docs/Update-DSGateway/)

