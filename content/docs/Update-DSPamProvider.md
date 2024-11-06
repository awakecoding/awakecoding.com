---
title: 'Update-DSPamProvider'
date: 2024-11-06
---


# Update-DSPamProvider

## SYNOPSIS
Update a PAM Provider with given values.

## SYNTAX

### GetByID
```
Update-DSPamProvider -ProviderID <Guid> [-Name <String>] [-CheckoutApprovalMode <CheckoutApprovalMode>]
 [-CheckoutReasonMode <CheckoutReasonMode>] [-CheckoutTime <Int32>] [-AllowCheckoutOwnerAsApprover <Int32>]
 [-IncludeAdminsAsApprovers <Int32>] [-IncludeManagersAsApprovers <Int32>] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### InputObject
```
Update-DSPamProvider -InputObject <PamProvider> [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Update a PAM Provider with given parameters.
Goes through every parameter and check if key match a key in current Provider data.
If so, updates current Provider data and send 'PUT' web request.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Update-DSProvider -ProviderID '00000000-0000-0000-0000-000000000000' -Name 'MyNewProviderName'
```

Update the name of the provider whose ID is '00000000-0000-0000-0000-000000000000'

### EXAMPLE 2
```
PS C:\> $getResponse = Get-DSPamProvider
        $provider = $getResponse | Where Label -eq 'MyDomainUserProvider'
        $desiredGroups = Get-DSADGroup -ProviderID $provider.ID -DN 'OU=Test,DC=mydomain,DC=loc'
        $provider.JitElevationSettings.AuthorizedGroups = $desiredGroups
        Update-DSPamProvider -InputObject $provider
```

Add all groups of the 'Test' organizational unit in the JIT settings' authorized groups of the provider 'MyDomainUserProvider' and save the modification

### EXAMPLE 3
```
PS C:\> $getResponse = Get-DSPamProvider
        $provider = $getResponse | Where Label -eq 'MyAzureADUserProvider'
        $groupsResponse = Get-DSAzureADGroup -ProviderID $provider.ID
        $desiredGroups = $groupsResponse | Where Name -like group*
        $provider.JitElevationSettings.AuthorizedGroups = $desiredGroups
        Update-DSPamProvider -InputObject $provider
```

Add all groups whose name starts with 'group' in the JIT settings' authorized groups of the provider 'MyAzureADUserProvider' and save the modification

## PARAMETERS

### -AllowCheckoutOwnerAsApprover
Ignored

```yaml
Type: Int32
Parameter Sets: GetByID
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
New checkout approval mode to assign the provider

```yaml
Type: CheckoutApprovalMode
Parameter Sets: GetByID
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CheckoutReasonMode
New checkout reason mode to assign the provider

```yaml
Type: CheckoutReasonMode
Parameter Sets: GetByID
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CheckoutTime
New default checkout time in minutes to assign the provider

```yaml
Type: Int32
Parameter Sets: GetByID
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeAdminsAsApprovers
Ignored

```yaml
Type: Int32
Parameter Sets: GetByID
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeManagersAsApprovers
Ignored

```yaml
Type: Int32
Parameter Sets: GetByID
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Provider object obtained from Get-DSPamProvider

```yaml
Type: PamProvider
Parameter Sets: InputObject
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Name
New name to assign to the provider

```yaml
Type: String
Parameter Sets: GetByID
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProviderID
Id of the provider to update

```yaml
Type: Guid
Parameter Sets: GetByID
Aliases: CandidProviderID

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

### Devolutions.Server.Pam.Dto.PamProvider
PAM provider object obtained from Get-DSPamProvider

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.Private.ServerResponse
## NOTES
For more information, type "Get-Help Update-DSPamProvider -detailed".
For technical information, type "Get-Help Update-DSPamProvider -full".

## RELATED LINKS

[Get-DSADGroup](http://127.0.0.1:1111/docs/Get-DSADGroup/)

[Get-DSAzureADGroup](http://127.0.0.1:1111/docs/Get-DSAzureADGroup/)

[Get-DSPamProvider](http://127.0.0.1:1111/docs/Get-DSPamProvider/)

