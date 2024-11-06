---
title: 'Get-DSGateway'
date: 2024-11-06
---


# Get-DSGateway

## SYNOPSIS
Get gateways

## SYNTAX

### GetByID
```
Get-DSGateway -GatewayID <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Name
```
Get-DSGateway -Name <String> [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### All
```
Get-DSGateway [-All] [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get a single or multiple gateways.
The Devolutions Gateway module is required.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $gateways = Get-DSGateway -All;
        $gateways  = $response.Data
```

Get all gateways.

### EXAMPLE 2
```
PS C:\> $gateway = Get-DSGateway -Name "A Common Name"
```

Get the gateway named "A Common Name".

## PARAMETERS

### -All
Obtain all gateways.

```yaml
Type: SwitchParameter
Parameter Sets: All
Aliases:

Required: True
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

### -GatewayID
ID of the gateway to fetch.

```yaml
Type: Guid
Parameter Sets: GetByID
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Name of the gateway to fetch.

```yaml
Type: String
Parameter Sets: Name
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

### Devolutions.Server.ApiWrapper.Models.Gateway.Gateway[]
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.ApiWrapper.Models.Gateway.Gateway, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.ApiWrapper.Models.Gateway.Gateway, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help Get-DSGateway -detailed".
For technical information, type "Get-Help Get-DSGateway -full".

## RELATED LINKS

[Get-DSGateway](http://127.0.0.1:1111/docs/Get-DSGateway/)

[Get-DSGatewayLogs](http://127.0.0.1:1111/docs/Get-DSGatewayLogs/)

[Get-DSGatewaySession](http://127.0.0.1:1111/docs/Get-DSGatewaySession/)

[New-DSGateway](http://127.0.0.1:1111/docs/New-DSGateway/)

[Remove-DSGateway](http://127.0.0.1:1111/docs/Remove-DSGateway/)

[Test-DSGateway](http://127.0.0.1:1111/docs/Test-DSGateway/)

[Update-DSGateway](http://127.0.0.1:1111/docs/Update-DSGateway/)

