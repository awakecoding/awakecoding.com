---
title: 'Register-DSLicense'
date: 2024-11-06
---


# Register-DSLicense

## SYNOPSIS
Register a new license

## SYNTAX

```
Register-DSLicense -Serial <String> [-AutoAssign] [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Register a new license.
For the server license, use the cmdlet Register-DSServerLicense.
For the AutoAssign parameter, it will be ignored for modules, except the Gateway module.
Some examples of modules: CyberArk Integration, Delinea Integration, and Privileged Access Management (PAM).

## EXAMPLES

### EXAMPLE
```
PS C:\> Register-DSLicense -Serial XXXXX-XXXXX-XXXXX-XXXXX-XXXXX -AutoAssign
```

Add a new license with the AutoAssign set

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

### -AutoAssign
Auto assign new users.
Ignored for modules, such as the PAM module.

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

### -Serial
Serial to add to the DVLS instance

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
For more information, type "Get-Help Register-DSLicense -detailed".
For technical information, type "Get-Help Register-DSLicense -full".

## RELATED LINKS
