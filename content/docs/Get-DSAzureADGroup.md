---
title: 'Get-DSAzureADGroup'
date: 2024-11-06
---


# Get-DSAzureADGroup

## SYNOPSIS
Get groups from a Azure AD User PAM provider

## SYNTAX

```
Get-DSAzureADGroup [-ProviderID] <Guid> [-AsJITSettings] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get groups from a Azure AD User PAM provider.
The data returned is the name and sid of each groups.
Those values can be added to the JIT settings' authorized groups of the provider.

## EXAMPLES

### EXAMPLE
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

### -AsJITSettings
Return the object as the JIT settings value.
Useful it is not initialized in the provider.

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

### -ProviderID
PAM Provider to obtain the domains from

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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

### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.Models.Shared.Pam.Dto.Active_Directory.PamAzureAdGroup, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Models.Shared.Pam.Entities.DvlsPamAzureAdJitElevationSettings, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help Get-DSAzureADGroup -detailed".
For technical information, type "Get-Help Get-DSAzureADGroup -full".

## RELATED LINKS

[Get-DSPamProvider](http://127.0.0.1:1111/docs/Get-DSPamProvider/)

[Update-DSPamProvider](http://127.0.0.1:1111/docs/Update-DSPamProvider/)

