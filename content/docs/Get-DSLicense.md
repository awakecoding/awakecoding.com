---
title: 'Get-DSLicense'
date: 2024-11-06
---


# Get-DSLicense

## SYNOPSIS
Get all licenses, except the server one

## SYNTAX

```
Get-DSLicense [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get all licenses, except the server one.
To obtain the users who have been assigned to a specific license, use the cmdlet Get-DSUserLicense.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $licenses = Get-DSLicence
```

Obtain all licenses, except the server one

### EXAMPLE 2
```
PS C:\> $licResponse = Get-DSLicence -AsLegacyResponse;
        $licRespones.Data | Where -Property Status -eq Expired | Unregister-DSLicense
```

Remove all expired licenses

### EXAMPLE 3
```
PS C:\> $licResponse = Get-DSLicence;
        $license = $licRespones.Data | Where -Property License -like XXXXX* | Select -First 1
        $assignResponse = Get-DSUserLicense -InputObject $license
        $assignments = $assignResponse.Data
        $aUserAssignment = $asssignments | Where Name -eq 'Name of the user to assign'
        $aUserAssignment.IsMember = $true
        Set-DSUserLicense -InputObject $aUserAssignment
```

Assign the license starting with XXXXX to the user 'Name of the user to assign'

## PARAMETERS

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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSLicenseInfo[]
### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[RemoteDesktopManager.PowerShellModule.PSOutputObject.PSLicenseInfo, Devolutions.PowerShell, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help Get-DSLicense -detailed".
For technical information, type "Get-Help Get-DSLicense -full".

## RELATED LINKS

[Get-DSUserLicense](http://127.0.0.1:1111/docs/Get-DSUserLicense/)

[Set-DSUserLicense](http://127.0.0.1:1111/docs/Set-DSUserLicense/)

[Unregister-DSLicense](http://127.0.0.1:1111/docs/Unregister-DSLicense/)

