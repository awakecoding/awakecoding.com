---
title: 'Get-DSPamPassword'
date: 2024-11-06
---


# Get-DSPamPassword

## SYNOPSIS

## SYNTAX

```
Get-DSPamPassword -AccountID <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -AccountID
ID of the pam account containing the password

```yaml
Type: Guid
Parameter Sets: (All)
Aliases: PamCredentialID

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

### None
## NOTES
For more information, type "Get-Help Get-DSPamPassword -detailed".
For technical information, type "Get-Help Get-DSPamPassword -full".

## RELATED LINKS

[Get-DSPamCheckout](http://127.0.0.1:1111/docs/Get-DSPamCheckout/)

[Invoke-DSPamCheckin](http://127.0.0.1:1111/docs/Invoke-DSPamCheckin/)

[Invoke-DSPamCheckout](http://127.0.0.1:1111/docs/Invoke-DSPamCheckout/)

[Invoke-DSPamCheckoutPending](http://127.0.0.1:1111/docs/Invoke-DSPamCheckoutPending/)

