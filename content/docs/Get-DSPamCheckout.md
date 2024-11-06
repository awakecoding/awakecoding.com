---
title: 'Get-DSPamCheckout'
date: 2024-11-06
---


# Get-DSPamCheckout

## SYNOPSIS
Return the Pam credential password

## SYNTAX

### GetByID
```
Get-DSPamCheckout -CheckoutID <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### Active
```
Get-DSPamCheckout [-ActiveAndPending] [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Return the PAM credential password if it is currently checked out and user has rights.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $checkoutResponse = Get-DSPamCheckout -ActiveAndPending;
        $pending = $checkoutResponse | Where Status -eq "Pending";
        Invoke-DSPamCheckoutPending -Checkout $pending[0] -Approve -ApproverMessage "Accepted"
```

Get all pending checkouts.
Select the desired checkout and approve it.

### EXAMPLE 2
```
PS C:\> $checkout = Get-DSPamCheckout -CheckoutID "2735a06c-baa0-4ff9-911c-aa1fcc03ea1e";
        Invoke-DSPamCheckin -Checkout $checkout
```

Get a pam checkout and check in.

## PARAMETERS

### -ActiveAndPending
Get all active and pending checkouts

```yaml
Type: SwitchParameter
Parameter Sets: Active
Aliases:

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

### -CheckoutID
Pam account's ID

```yaml
Type: Guid
Parameter Sets: GetByID
Aliases: PamCheckoutID

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

### Devolutions.Server.Pam.Dto.DvlsPamCheckout[]
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Pam.Dto.DvlsPamCheckout, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Pam.Dto.DvlsPamCheckout[], RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help Get-DSPamCheckout -detailed".
For technical information, type "Get-Help Get-DSPamCheckout -full".

## RELATED LINKS

[Invoke-DSPamCheckin](http://127.0.0.1:1111/docs/Invoke-DSPamCheckin/)

[Invoke-DSPamCheckout](http://127.0.0.1:1111/docs/Invoke-DSPamCheckout/)

[Invoke-DSPamCheckoutPending](http://127.0.0.1:1111/docs/Invoke-DSPamCheckoutPending/)

[Get-DSPamPassword](http://127.0.0.1:1111/docs/Get-DSPamPassword/)

