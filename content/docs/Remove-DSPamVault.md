---
title: 'Remove-DSPamVault'
date: 2024-11-06
---


# Remove-DSPamVault

## SYNOPSIS
Delete the PAM vault

## SYNTAX

```
Remove-DSPamVault -InputObject <PSVaultWrapper> [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Delete the PAM vault

## EXAMPLES

### EXAMPLE
```
PS C:\> Get-DSPamVault | Where-Object -Property description -EQ -Value 'Deprecated' | Select-Object -ExpandProperty id | Remove-DSPamVault
```

Delete all PAM vaults whose description is Deprecated

## PARAMETERS

### -InputObject
The PAM vault to delete.
Accepts the ID or the RepositoryEntity object representing the vault.

```yaml
Type: PSVaultWrapper
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: False
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

### System.Guid
ID of the vault to update

### Devolutions.RemoteDesktopManager.Business.Entities.RepositoryEntity
Vault object obtained from Get-DSPamVault with the parameter ID

## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Remove-DSPamVault -detailed".
For technical information, type "Get-Help Remove-DSPamVault -full".

## RELATED LINKS

[Get-DSPamVault](http://127.0.0.1:1111/docs/Get-DSPamVault/)

[New-DSPamVault](http://127.0.0.1:1111/docs/New-DSPamVault/)

[Update-DSPamVault](http://127.0.0.1:1111/docs/Update-DSPamVault/)

