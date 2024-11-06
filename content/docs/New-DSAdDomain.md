---
title: 'New-DSAdDomain'
date: 2024-11-06
---


# New-DSAdDomain

## SYNOPSIS
Add a domain.

## SYNTAX

```
New-DSAdDomain -DomainName <String> -DisplayName <String> -AdministrationUsername <String>
 -AdministrationPassword <String> [-IsLDAPS] [-LDAPSCustomPort <Int32>] [-AutoCreateEnabled]
 [-DomainUsernameFormatType <DomainUsernameFormatType>] [-DomainUserReadOnly] [-DefaultVault <String>]
 [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Add a domain with the supplied parameters.
The Platinum Edition license is required to enable the Multi Domain feature.
The administration account supplied needs to be able to retrieve user account information and group memberships.
It may requires higher privileges than being part of the Domain Users built-in Active Directory group.
In most case, it should be sufficient.

## EXAMPLES

### EXAMPLE
```
PS C:\> New-DSAdDomain -DomainName domain.loc -DisplayName Dom -AdministrationUsername admin -AdministrationPassword "Pa$$w0rd!" -IsLDAPS -LDAPSCustomPort 1500 -AutoCreateEnabled -DomainUsernameFormatType NetBios -DomainUserReadOnly
```

Create a new domain with the supplied parameters.

## PARAMETERS

### -AdministrationPassword
Password part of the credentials of a domain or service account to access the Active Directory forest and obtain user account information through LDAP queries.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AdministrationUsername
Username part of the credentials of a domain or service account to access the Active Directory forest and obtain user account information through LDAP queries.

```yaml
Type: String
Parameter Sets: (All)
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

### -AutoCreateEnabled
Automatically create the domain user account in the Devolutions Server on the first login attempt.

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

### -DefaultVault
Name of the vault the user will have access to.

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

### -DisplayName
Domain name that will be displayed in the application usage like informational messages.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DomainName
Remote computer domain name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DomainUsernameFormatType
Select the username format that will be created in the database.
UPN : The user will be created using the UPN format ex: bill@windjammer.loc.
NetBios : The user will be created using the NetBios format ex: WINDJAMMER\bill.
Username : The user will be created using the SAM account name.

```yaml
Type: DomainUsernameFormatType
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DomainUserReadOnly
Set Read only user instead of User type account.

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

### -IsLDAPS
Enable the LDAP over SSL communication.

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

### -LDAPSCustomPort
LDAPS communication port.
If not specified, it will be the default one.

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
For more information, type "Get-Help New-DSAdDomain -detailed".
For technical information, type "Get-Help New-DSAdDomain -full".

## RELATED LINKS
