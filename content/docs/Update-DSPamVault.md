---
title: 'Update-DSPamVault'
date: 2024-11-06
---


# Update-DSPamVault

## SYNOPSIS
Update the PAM vault

## SYNTAX

```
Update-DSPamVault -InputObject <PSVaultWrapper> [-Name <String>] [-Description <String>]
 [-Visibility <VaultAllowAccessRequestRole>] [-Owner <String[]>] [-ProgressAction <ActionPreference>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Update the PAM vault.
To give access to a user, use the Set-DSVaultUser cmdlet.
To give access to a role, use the Set-DSVaultRole cmdlet.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-DSPamVault -ID $myVaultId | Update-DSVault -Name 'NewVaultName' -Description 'A new description'
```

Update the name and description of the PAM vault whose id is $myVaultId

### EXAMPLE 2
```
PS C:\> Get-DSPamVault | Where-Object -Property Name -Like -Value PST* | Select-Object -ExpandProperty id | Update-DSVault -Visibility Never
```

Set the visibility of all PAM vaults whose name starts with PST to invitation only.

## PARAMETERS

### -Description
Description of the PAM vault

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

### -Name
Name of the PAM vault

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

### -Owner
Assign owners to the vault with their ID or name

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Visibility
Visibility of the vault

```yaml
Type: VaultAllowAccessRequestRole
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
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
For more information, type "Get-Help Update-DSPamVault -detailed".
For technical information, type "Get-Help Update-DSPamVault -full".

## RELATED LINKS

[Get-DSPamVault](http://127.0.0.1:1111/docs/Get-DSPamVault/)

[New-DSPamVault](http://127.0.0.1:1111/docs/New-DSPamVault/)

[Remove-DSPamVault](http://127.0.0.1:1111/docs/Remove-DSPamVault/)

