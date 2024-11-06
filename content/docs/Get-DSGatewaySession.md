---
title: 'Get-DSGatewaySession'
date: 2024-11-06
---


# Get-DSGatewaySession

## SYNOPSIS
Get a gateway's sessions

## SYNTAX

```
Get-DSGatewaySession -GatewayID <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Get a gateway's sessions.
The Devolutions Gateway module is required.

## EXAMPLES

### EXAMPLE
```
PS C:\> $response = Get-DSGatewaySession -GatewayID "08a521fe-14f7-4ae5-b2b9-d9f6164c15e8" -AsLegacyResponse;
        $gateway  = $response.Data;
        $gwSessions -GatewayID $gateway.Id
```

Get all sessions of the specified gateway.

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
Gateway's ID

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

### Devolutions.Server.ApiWrapper.Models.Gateway.GatewaySession[]
### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.ApiWrapper.Models.Gateway.GatewaySession, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help Get-DSGatewaySession -detailed".
For technical information, type "Get-Help Get-DSGatewaySession -full".

## RELATED LINKS

[Get-DSGateway](http://127.0.0.1:1111/docs/Get-DSGateway/)

[Get-DSGatewayLogs](http://127.0.0.1:1111/docs/Get-DSGatewayLogs/)

[New-DSGateway](http://127.0.0.1:1111/docs/New-DSGateway/)

[Remove-DSGateway](http://127.0.0.1:1111/docs/Remove-DSGateway/)

[Test-DSGateway](http://127.0.0.1:1111/docs/Test-DSGateway/)

[Update-DSGateway](http://127.0.0.1:1111/docs/Update-DSGateway/)

