---
title: 'Get-DSAuthenticationModes'
date: 2024-11-06
---


# Get-DSAuthenticationModes

## SYNOPSIS
Get the authentication modes allowed by the server.

## SYNTAX

```
Get-DSAuthenticationModes [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get the authentication modes allowed by the server.
The possibilities of authentication are AzureAD, Otka, Custom (Devolutions Server), Domain and Windows Authentication

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
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=7.4.4.500, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]
## NOTES
For more information, type "Get-Help Get-DSAuthenticationModes -detailed".
For technical information, type "Get-Help Get-DSAuthenticationModes -full".

## RELATED LINKS

[Set-DSAuthenticationModes](http://127.0.0.1:1111/docs/Set-DSAuthenticationModes/)

