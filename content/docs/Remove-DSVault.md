---
title: 'Remove-DSVault'
date: 2024-11-06
---


# Remove-DSVault

## SYNOPSIS
Delete a vault.

## SYNTAX

```
Remove-DSVault -VaultID <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Deletes a vault from DVLS instance and delete all entries inside of it.
Be careful, this action is irreversible if you don't have a recent back-up.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

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

### -VaultID
Vault's ID to delete

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
For more information, type "Get-Help Remove-DSVault -detailed".
For technical information, type "Get-Help Remove-DSVault -full".

## RELATED LINKS

[Get-DSVault](http://127.0.0.1:1111/docs/Get-DSVault/)

[New-DSVault](http://127.0.0.1:1111/docs/New-DSVault/)

[Update-DSVault](http://127.0.0.1:1111/docs/Update-DSVault/)

