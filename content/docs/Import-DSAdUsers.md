---
title: 'Import-DSAdUsers'
date: 2024-11-06
---


# Import-DSAdUsers

## SYNOPSIS
Import users from the domain.

## SYNTAX

### ImportByName
```
Import-DSAdUsers -DomainName <String> -Name <String[]> [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### ImportAll
```
Import-DSAdUsers -DomainName <String> [-All] [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Import users from the domain.
Two alternatives are offered: import all users or import users based on their name.

## EXAMPLES

### EXAMPLE
```
PS C:\> Import-DSAdUsers -DomainName "domain.loc" -All
```

Import all users of the domain "domain.loc".

## PARAMETERS

### -All
Import all users from the specified domain.

```yaml
Type: SwitchParameter
Parameter Sets: ImportAll
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

### -DomainName
Name of the domain containing the users.

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

### -Name
Names of the users to import.
It is corresponding to the samAccountName field from the users obtained from Get-DSDomainUsers.

```yaml
Type: String[]
Parameter Sets: ImportByName
Aliases: Names

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

### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.String, System.Private.CoreLib, Version=8.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]][]
## NOTES
For more information, type "Get-Help Import-DSAdUsers -detailed".
For technical information, type "Get-Help Import-DSAdUsers -full".

## RELATED LINKS

[Get-DSDomainUsers](http://127.0.0.1:1111/docs/Get-DSDomainUsers/)

