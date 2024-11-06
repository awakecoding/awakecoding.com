---
title: 'Unregister-DSLicense'
date: 2024-11-06
---


# Unregister-DSLicense

## SYNOPSIS
Unregister a license

## SYNTAX

```
Unregister-DSLicense -InputObject <PSLicenseInfo> [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Unregister a license.
The server license cannot be unregistered.

## EXAMPLES

### EXAMPLE
```
PS C:\> $licResponse = Get-DSLicence;
        $licRespones | Where -Property Status -eq Expired | Unregister-DSLicense
```

Remove all expired licenses

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

### -InputObject
License to delete obtained from Get-DSLicense

```yaml
Type: PSLicenseInfo
Parameter Sets: (All)
Aliases:

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

### None
## OUTPUTS

### RemoteDesktopManager.PowerShellModule.Private.ServerResponse
## NOTES
For more information, type "Get-Help Unregister-DSLicense -detailed".
For technical information, type "Get-Help Unregister-DSLicense -full".

## RELATED LINKS

[Get-DSLicense](http://127.0.0.1:1111/docs/Get-DSLicense/)

