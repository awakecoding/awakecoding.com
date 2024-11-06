---
title: 'Invoke-DSPamCheckoutPending'
date: 2024-11-06
---


# Invoke-DSPamCheckoutPending

## SYNOPSIS
Approve or deny a pending checkout request.

## SYNTAX

```
Invoke-DSPamCheckoutPending -Checkout <DvlsPamCheckout> [-Approve] [-ApproverMessage <String>]
 [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Change the state of a pending checkout request depending on the -Accept flag parameter.

## EXAMPLES

### EXAMPLE
```
PS C:\> $checkoutResponse = Get-DSPamCheckout -ActiveAndPending;
        $pending = $checkoutResponse | Where Status -eq "Pending";
        Invoke-DSPamCheckoutPending -Checkout $pending[0] -Approve -ApproverMessage "Accepted"
```

Get all pending checkouts.
Select the desired checkout and approve it.

## PARAMETERS

### -Approve
Approve the checkout request

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

### -ApproverMessage
Test

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

### -Checkout
Pending pam checkout to accept

```yaml
Type: DvlsPamCheckout
Parameter Sets: (All)
Aliases: CredentialCheckout

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
For more information, type "Get-Help Invoke-DSPamCheckoutPending -detailed".
For technical information, type "Get-Help Invoke-DSPamCheckoutPending -full".

## RELATED LINKS

[Get-DSPamCheckout](http://127.0.0.1:1111/docs/Get-DSPamCheckout/)

[Invoke-DSPamCheckin](http://127.0.0.1:1111/docs/Invoke-DSPamCheckin/)

[Invoke-DSPamCheckout](http://127.0.0.1:1111/docs/Invoke-DSPamCheckout/)

[Get-DSPamPassword](http://127.0.0.1:1111/docs/Get-DSPamPassword/)

