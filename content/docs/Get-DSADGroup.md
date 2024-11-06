---
title: 'Get-DSADGroup'
date: 2024-11-06
---


# Get-DSADGroup

## SYNOPSIS
Get groups from a domain user PAM provider

## SYNTAX

```
Get-DSADGroup [-ProviderID] <Guid> [[-DN] <String>] [-AsJITSettings] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get groups from a domain user PAM provider.
It returns the groups of the oganizational unit specified by DN.
If the DN parameter is not used, it will look at the root.
It is not possible to fetch all groups directly.
The data returned can be added to the JIT settings' authorized groups of the provider.

## EXAMPLES

### EXAMPLE
```
PS C:\> $getResponse = Get-DSPamProvider
        $provider = $getResponse | Where Label -eq 'MyDomainUserProvider'
        $desiredGroups = Get-DSADGroup -ProviderID $provider.ID -DN 'OU=Test,DC=mydomain,DC=loc'
        $provider.JitElevationSettings.AuthorizedGroups = $desiredGroups
        Update-DSPamProvider -InputObject $provider
```

Add all groups of the 'Test' organizational unit in the JIT settings' authorized groups of the provider 'MyDomainUserProvider' and save the modification

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

### -DN
Distinguished name of the container searched

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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

### Devolutions.Server.Models.Shared.Pam.Dto.Active_Directory.PamAdDomainGroup[]
### Devolutions.Server.Models.Shared.Pam.Entities.DvlsPamAdJitElevationSettings
### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.Models.Shared.Pam.Dto.Active_Directory.PamAdDomainGroup, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Models.Shared.Pam.Entities.DvlsPamAdJitElevationSettings, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help Get-DSADGroup -detailed".
For technical information, type "Get-Help Get-DSADGroup -full".

## RELATED LINKS

[Get-DSPamProvider](http://127.0.0.1:1111/docs/Get-DSPamProvider/)

[Update-DSPamProvider](http://127.0.0.1:1111/docs/Update-DSPamProvider/)

