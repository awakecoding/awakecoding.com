---
title: 'Get-DSGatewayLogs'
date: 2024-11-06
---


# Get-DSGatewayLogs

## SYNOPSIS
Get a gateway's logs

## SYNTAX

```
Get-DSGatewayLogs -GatewayID <Guid> -OutputPath <String> [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get a gateway's logs.
The logs will be stored in the specified path.
The Devolutions Gateway module is required.

## EXAMPLES

### EXAMPLE
```
PS C:\> $response = Get-DSGateway -All -AsLegacyResponse;
        $gateways  = $response.Data;
        $gateways | ForEach-Object {Get-DSGatewayLogs -GatewayID $_.Id -OutputPath "C:\my\path\filename_$_.Name.txt"}
```

Get logs for all gateways and create a file for each of them.

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

### -OutputPath
Path, including the file name and extension, where the file will be the saved.

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

### System.String
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.String, System.Private.CoreLib, Version=8.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
## NOTES
For more information, type "Get-Help Get-DSGatewayLogs -detailed".
For technical information, type "Get-Help Get-DSGatewayLogs -full".

## RELATED LINKS

[Get-DSGateway](http://127.0.0.1:1111/docs/Get-DSGateway/)

[Get-DSGatewaySession](http://127.0.0.1:1111/docs/Get-DSGatewaySession/)

[New-DSGateway](http://127.0.0.1:1111/docs/New-DSGateway/)

[Remove-DSGateway](http://127.0.0.1:1111/docs/Remove-DSGateway/)

[Test-DSGateway](http://127.0.0.1:1111/docs/Test-DSGateway/)

[Update-DSGateway](http://127.0.0.1:1111/docs/Update-DSGateway/)

