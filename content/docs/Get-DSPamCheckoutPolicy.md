---
title: 'Get-DSPamCheckoutPolicy'
date: 2024-11-06
---


# Get-DSPamCheckoutPolicy

## SYNOPSIS
Return checkout policies

## SYNTAX

```
Get-DSPamCheckoutPolicy [-PolicyID <Guid>] [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
If a policy ID is supplied, it will try to fetch and return the policy matching the ID.
If no ID is supplied, it will return a list of all policies in place.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $response = Get-DSPamCheckoutPolicy
```

Return all checkout policies currently in place.

### EXAMPLE 2
```
PS C:\> $response = Get-DSPamCheckoutPolicy $PolicyID
```

Return the checkout policy, if found.

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

### -PolicyID
ID of the policy to get

```yaml
Type: Guid
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

### Devolutions.Server.Pam.Dto.PamCheckoutPolicy[]
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Pam.Dto.PamCheckoutPolicy, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.Pam.Dto.PamCheckoutPolicy, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help Get-DSPamCheckoutPolicy -detailed".
For technical information, type "Get-Help Get-DSPamCheckoutPolicy -full".

## RELATED LINKS

[New-DSPamCheckoutPolicy](http://127.0.0.1:1111/docs/New-DSPamCheckoutPolicy/)

[Remove-DSPamCheckoutPolicy](http://127.0.0.1:1111/docs/Remove-DSPamCheckoutPolicy/)

[Update-DSPamCheckoutPolicy](http://127.0.0.1:1111/docs/Update-DSPamCheckoutPolicy/)

