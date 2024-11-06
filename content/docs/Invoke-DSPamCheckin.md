---
title: 'Invoke-DSPamCheckin'
date: 2024-11-06
---


# Invoke-DSPamCheckin

## SYNOPSIS
Check in a currently checked out PAM credential.

## SYNTAX

```
Invoke-DSPamCheckin -Checkout <DvlsPamCheckout> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Check in a currently checked out PAM credential.
To retreive the checkout, as a PamCheckout object, please use Get-DSPamCheckout CMDlet or store the result of Invoke-DSPamCheckout.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $Response = Invoke-DSPamCheckout -PamCredentialID '92e1d27f-6e7b-4c62-86da-a04fc22603c2' -Verbose
        $BobPassword = $Response.Password
        $BobCheckoutInfo = $Response.CheckoutInfo
        $BobCheckinResponse = Invoke-DSPamCheckin $BobCheckoutInfo
```

Check in the pam checkout

### EXAMPLE 2
```
PS C:\> $checkoutResponse = Get-DSPamCheckout -ActiveAndPending;
        $checkoutResponse | Where Status -eq "Active" | Invoke-DSPamCheckin
```

Check in all active checkouts.

## PARAMETERS

### -Checkout
Pam checkout to check in.

```yaml
Type: DvlsPamCheckout
Parameter Sets: (All)
Aliases: PamCheckout

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
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

### Devolutions.Server.Pam.Dto.DvlsPamCheckout
Pam checkout obtained from Get-DSPamCheckout.

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.Private.ServerResponse
## NOTES
For more information, type "Get-Help Invoke-DSPamCheckin -detailed".
For technical information, type "Get-Help Invoke-DSPamCheckin -full".

## RELATED LINKS

[Get-DSPamCheckout](http://127.0.0.1:1111/docs/Get-DSPamCheckout/)

[Invoke-DSPamCheckout](http://127.0.0.1:1111/docs/Invoke-DSPamCheckout/)

[Invoke-DSPamCheckoutPending](http://127.0.0.1:1111/docs/Invoke-DSPamCheckoutPending/)

[Get-DSPamPassword](http://127.0.0.1:1111/docs/Get-DSPamPassword/)

