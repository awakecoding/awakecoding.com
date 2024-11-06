---
title: 'Update-DSPamCheckoutPolicy'
date: 2024-11-06
---


# Update-DSPamCheckoutPolicy

## SYNOPSIS
Update a PAM checkout policy

## SYNTAX

```
Update-DSPamCheckoutPolicy -PolicyID <Guid> [-Name <String>] [-CheckoutApprovalMode <CheckoutApprovalMode>]
 [-CheckoutReasonMode <CheckoutReasonMode>] [-AllowCheckoutOwnerAsApprover <ApproverOptions>]
 [-IncludeAdminsAsApprovers <ApproverOptions>] [-IncludeManagersAsApprovers <ApproverOptions>]
 [-CheckoutTime <Int32>] [-IsDefault <Boolean>] [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Update a checkout policy using supplied parameters.
Omitted parameters are ignored.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -AllowCheckoutOwnerAsApprover
Indicate if owner can self-checkout.

```yaml
Type: ApproverOptions
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

### -CheckoutApprovalMode
Indicate if the checkout must be approved.
Approval mode choices: Default, None, Mandatory

```yaml
Type: CheckoutApprovalMode
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CheckoutReasonMode
Indicate if a reason must be given for the checkout.
Checkout reason mode choices: Default, None, Mandatory, Optional

```yaml
Type: CheckoutReasonMode
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CheckoutTime
Default duration assigned to checkout's request.
If set at 0, the default value will be used.

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

### -IncludeAdminsAsApprovers
Indicate if administrators can approve checkout.

```yaml
Type: ApproverOptions
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeManagersAsApprovers
Indicate if managers can approve checkout.

```yaml
Type: ApproverOptions
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IsDefault
Set as the default policy.
It will affect all policies refering to default values.

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
Policy's name.
Must be unique.
Cannot be null or white spaces only.

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

### -PolicyID
ID of the policy to update

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
For more information, type "Get-Help Update-DSPamCheckoutPolicy -detailed".
For technical information, type "Get-Help Update-DSPamCheckoutPolicy -full".

## RELATED LINKS

[Get-DSPamCheckoutPolicy](http://127.0.0.1:1111/docs/Get-DSPamCheckoutPolicy/)

[New-DSPamCheckoutPolicy](http://127.0.0.1:1111/docs/New-DSPamCheckoutPolicy/)

[Remove-DSPamCheckoutPolicy](http://127.0.0.1:1111/docs/Remove-DSPamCheckoutPolicy/)

