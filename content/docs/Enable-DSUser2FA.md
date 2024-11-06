---
title: 'Enable-DSUser2FA'
date: 2024-11-06
---


# Enable-DSUser2FA

## SYNOPSIS
Enable a predefined 2FA authentication for a user.

## SYNTAX

```
Enable-DSUser2FA -UserID <Guid> -TwoFactorAuthenticationType <TwoFactorAuthenticationType> [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Enable a predefined 2FA authentication for a user.
The server must be configured to allow 2FA enforcement on an individual basis.

## EXAMPLES

### EXAMPLE
```
PS C:\> Enable-DSUser2FA -UserID $userId -TwoFactorAuthenticationType GoogleAuthenticator
```

Set an Authenticator (TOTP) for the user identified by $userId.
The user will complete the set up on the next login.

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

### -TwoFactorAuthenticationType
2FA type

```yaml
Type: TwoFactorAuthenticationType
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserID
User's ID

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
For more information, type "Get-Help Enable-DSUser2FA -detailed".
For technical information, type "Get-Help Enable-DSUser2FA -full".

## RELATED LINKS

[Disable-DSUser2FA](http://127.0.0.1:1111/docs/Disable-DSUser2FA/)

