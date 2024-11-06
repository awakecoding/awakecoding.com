---
title: 'Set-DSAuthenticationModes'
date: 2024-11-06
---


# Set-DSAuthenticationModes

## SYNOPSIS
Modify the authentification modes allowed.

## SYNTAX

```
Set-DSAuthenticationModes [-AzureADAuthenticationEnabled <Boolean>] [-CustomAuthenticationEnabled <Boolean>]
 [-DomainAuthenticationEnabled <Boolean>] [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Modify the authentification modes allowed.
AzureAD, Custom (Devolutions Server) and Domain authentications can be modified.

## EXAMPLES

### EXAMPLE
```
PS C:\> Set-DSAuthenticationModes -AzureADAuthenticationEnabled $true
```

Allow AzureAD authentication on the dlvs server.

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

### -AzureADAuthenticationEnabled
Allow or not AzureAD authentication method.

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

### -CustomAuthenticationEnabled
Allow or not Custom (Devolutions Server) authentication method.

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

### -DomainAuthenticationEnabled
Allow or not Domain authentication method.

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
For more information, type "Get-Help Set-DSAuthenticationModes -detailed".
For technical information, type "Get-Help Set-DSAuthenticationModes -full".

## RELATED LINKS

[Set-DSAuthenticationModes](http://127.0.0.1:1111/docs/Set-DSAuthenticationModes/)

