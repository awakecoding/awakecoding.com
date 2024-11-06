---
title: 'Update-DSGateway'
date: 2024-11-06
---


# Update-DSGateway

## SYNOPSIS
Update a gateway

## SYNTAX

```
Update-DSGateway -GatewayID <Guid> [-Name <String>] [-Description <String>] [-IsDefault <Boolean>]
 [-DevolutionsGatewayUrl <String>] [-TCPListeningPort <Int32>] [-TokenDuration <Int32>]
 [-HealthCheckInterval <Int32>] [-ForceIpAddressForRdpConnections <Boolean>] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Update a gateway.
Use the parameters to modify the gateway.
The Devolutions Gateway module is required.

## EXAMPLES

### EXAMPLE
```
PS C:\> $response = Get-DSGateway -Name "Old default gateway" -AsLegacyResponse;
        $gateway = $response.Data[0];
        Update-DSGateway -Name "Standard Gateway" -Description "Not the default anymore" -IsDefault $false
```

Update the gateway named "Old default gateway" by removing its default status.
A new description will indicate the change.

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

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForceIpAddressForRdpConnections
Force using IP address for RDP connections.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GatewayID
ID of the gateway to update.

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

### -HealthCheckInterval
Health check interval in minutes.

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
Type: Boolean
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

Required: False
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

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TokenDuration
Generated token duration in minutes.
Must be between 1 and 120 minutes.

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
For more information, type "Get-Help Update-DSGateway -detailed".
For technical information, type "Get-Help Update-DSGateway -full".

## RELATED LINKS

[Get-DSGateway](http://127.0.0.1:1111/docs/Get-DSGateway/)

[Get-DSGatewayLogs](http://127.0.0.1:1111/docs/Get-DSGatewayLogs/)

[Get-DSGatewaySession](http://127.0.0.1:1111/docs/Get-DSGatewaySession/)

[New-DSGateway](http://127.0.0.1:1111/docs/New-DSGateway/)

[Remove-DSGateway](http://127.0.0.1:1111/docs/Remove-DSGateway/)

[Test-DSGateway](http://127.0.0.1:1111/docs/Test-DSGateway/)

