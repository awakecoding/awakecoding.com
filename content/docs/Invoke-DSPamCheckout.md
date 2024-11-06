---
title: 'Invoke-DSPamCheckout'
date: 2024-11-06
---


# Invoke-DSPamCheckout

## SYNOPSIS
Creates a checkout request.

## SYNTAX

```
Invoke-DSPamCheckout -AccountID <Guid> [-Reason <String>] [-ApproverID <Guid>] [-Duration <Int32>]
 [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Creates a checkout request for the provided PAM credential.
Also return the password if approval is not required or if approved ID is the same as the asking user's ID.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $Response = Invoke-DSPamCheckout -PamCredentialID '92e1d27f-6e7b-4c62-86da-a04fc22603c2' -Verbose
        $BobPassword = $Response.Password
        $BobCheckoutInfo = $Response.CheckoutInfo
        $BobCheckinResponse = Invoke-DSPamCheckin $BobCheckoutInfo
```

Auto checkout of the pam credential (approval not required)

### EXAMPLE 2
```
PS C:\> $Response = Invoke-DSPamCheckout -PamCredentialID '2735a06c-baa0-4ff9-911c-aa1fcc03ea1e' -Reason 'Because' -ApproverID '49a60972-b1ff-4be9-ac73-47c6d4a4125d'
        $MauricePassword = $Response.Password
        $MauriceCheckoutInfo = $Response.CheckoutInfo
        $MauriceCheckinResponse = Invoke-DSPamCheckin $MauriceCheckoutInfo
```

Self checkout of the pam credential (approver is the same person who request the checkout)

### EXAMPLE 3
```
PS C:\> $Response = Invoke-DSPamCheckout -PamCredentialID '08a521fe-14f7-4ae5-b2b9-d9f6164c15e8' -ApproverID '2364ec1f-a739-450b-afe8-d85b5a3db50e' -Reason 'Because'
        # After approval
        $CheckoutResponse = Get-DSPamCheckout -CheckoutID $Response.ID
        $KellyPassword = Get-DSPamPassword -PamCredentialID $CheckoutResponse.CredentialID
        $KellyCheckoutInfo = $CheckoutResponse.CheckoutInfo
        $KellyCheckinResponse = Invoke-DSPamCheckin $KellyCheckoutInfo
```

Approved checkout of the pam credential (approval done by the specified approver)

## PARAMETERS

### -AccountID
ID of the pam credential to checkout

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

### -ApproverID
Approver's ID.
Necessary if approval is mandatory.

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

### -Duration
Duration, in minutes, of the checkout request.
By default, it is set to 2 hours (120 minutes).

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

### -Reason
Information on the checkout request to be sent to an administrator for approval.

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

### Devolutions.Server.Pam.Dto.DvlsPamCheckout
### System.Management.Automation.PSObject
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Pam.Dto.DvlsPamCheckout, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=7.4.4.500, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]
## NOTES
For more information, type "Get-Help Invoke-DSPamCheckout -detailed".
For technical information, type "Get-Help Invoke-DSPamCheckout -full".

## RELATED LINKS

[Get-DSPamCheckout](http://127.0.0.1:1111/docs/Get-DSPamCheckout/)

[Invoke-DSPamCheckin](http://127.0.0.1:1111/docs/Invoke-DSPamCheckin/)

[Invoke-DSPamCheckoutPending](http://127.0.0.1:1111/docs/Invoke-DSPamCheckoutPending/)

[Get-DSPamPassword](http://127.0.0.1:1111/docs/Get-DSPamPassword/)

