---
title: 'Update-DSPamAccount'
date: 2024-11-06
---


# Update-DSPamAccount

## SYNOPSIS
Update a pam account.

## SYNTAX

```
Update-DSPamAccount -PamAccount <PSObject> [-Password <String>] [-Permission <PSPermissionWrapper[]>]
 [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Update a pam account.
All modifications are made on the pam account object obtained from Get-DSPamAccount.

## EXAMPLES

### EXAMPLE
```
PS C:\> $pamAccount = Get-DSPamAccount -AccountID $accountID;
        $pamAccount.name = NewName;
        Update-DSPamAccount -PamAccount $pamAccount
```

Change the PAM entry name.

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

### -PamAccount
Modified pam account

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Password
New password

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

### -Permission
Entry's permissions

```yaml
Type: PSPermissionWrapper[]
Parameter Sets: (All)
Aliases: Security

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
For more information, type "Get-Help Update-DSPamAccount -detailed".
For technical information, type "Get-Help Update-DSPamAccount -full".

## RELATED LINKS

[Get-DSPamAccount](http://127.0.0.1:1111/docs/Get-DSPamAccount/)

[Get-DSPamAccountSyncStatus](http://127.0.0.1:1111/docs/Get-DSPamAccountSyncStatus/)

[New-DSPamAccount](http://127.0.0.1:1111/docs/New-DSPamAccount/)

[Remove-DSPamAccount](http://127.0.0.1:1111/docs/Remove-DSPamAccount/)

