---
title: 'Get-DSSecureMessages'
date: 2024-11-06
---


# Get-DSSecureMessages

## SYNOPSIS
Fetch all secure messages for the currently authenticated user.

## SYNTAX

```
Get-DSSecureMessages [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
It fetch messages for the user you logged in with (New-DSSession).
For other users, you need to re-authenticate and type the command again.

## EXAMPLES

### EXAMPLE
```
Get-DSSecureMessages
```

Fetch all the secure message for the authentififed user.

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

### Devolutions.Server.Models.Shared.Models.SecureMessage.SecureMessage[]
### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.Models.Shared.Models.SecureMessage.SecureMessage, RemoteDesktopManager.Business, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help Get-DSSecureMessages -detailed".
For technical information, type "Get-Help Get-DSSecureMessages -full".

## RELATED LINKS
