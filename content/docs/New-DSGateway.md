---
title: 'New-DSGateway'
date: 2024-11-06
---


# New-DSGateway

## SYNOPSIS
Create a gateway

## SYNTAX

```
New-DSGateway -Name <String> [-Description <String>] [-IsDefault] -DevolutionsGatewayUrl <String>
 -TCPListeningPort <Int32> [-TokenDuration <Int32>] [-HealthCheckInterval <Int32>]
 [-ForceIpAddressForRdpConnections] [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Create a gateway.
Use the parameters to create the gateway.
The Devolutions Gateway module is required.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> New-DSGateway -Name "New Gateway" -DevolutionsGatewayUrl "http://localhost" -TCPListeningPort 8181.
```

Create a gateway with minimal information.

### EXAMPLE 2
```
PS C:\> New-DSGateway -Name "New Default Gateway" -DevolutionsGatewayUrl "http://localhost" -TCPListeningPort 8181 -Description "A simple description" -IsDefault -ForceIpAddressForRdpConnections -TokenDuration 60 -HealthCheckInterval 240.
```

Create the new default gateway.

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

### -Description
Description of the gateway

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DevolutionsGatewayUrl
URL to reach the Devolutions Gateway.
Must be a valid URI and unique to this gateway.

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

### -ForceIpAddressForRdpConnections
Force using IP address for RDP connections.

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

### -HealthCheckInterval
Health check interval in minutes.
By default, it is set to 60 minutes.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IsDefault
Set as the default gateway

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

### -Name
Gateway's name.
The value will be trimmed.

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

### -TCPListeningPort
Port used for RDP sessions, and eventually the SSH sessions.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TokenDuration
Generated token duration in minutes.
Must be between 1 and 120 minutes.
By default, it is set to 5 minutes.

```yaml
Type: Int32
Parameter Sets: (All)
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

### RemoteDesktopManager.PowerShellModule.Private.ServerResponse
## NOTES
For more information, type "Get-Help New-DSGateway -detailed".
For technical information, type "Get-Help New-DSGateway -full".

## RELATED LINKS

[Get-DSGateway](http://127.0.0.1:1111/docs/Get-DSGateway/)

[Get-DSGatewayLogs](http://127.0.0.1:1111/docs/Get-DSGatewayLogs/)

[Get-DSGatewaySession](http://127.0.0.1:1111/docs/Get-DSGatewaySession/)

[Remove-DSGateway](http://127.0.0.1:1111/docs/Remove-DSGateway/)

[Test-DSGateway](http://127.0.0.1:1111/docs/Test-DSGateway/)

[Update-DSGateway](http://127.0.0.1:1111/docs/Update-DSGateway/)

