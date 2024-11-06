---
title: 'Get-DSPamVault'
date: 2024-11-06
---


# Get-DSPamVault

## SYNOPSIS
Get the pam vaults

## SYNTAX

```
Get-DSPamVault [-ID <Guid>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get the pam vaults.
For the complete object, use the ID parameter.
To modify the security of the vault, this must be done on the root folder of the vault.
This root can be obtained with Get-DSPamFolder.

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

### -ID
Specify the ID of the desired vault.

```yaml
Type: Guid
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRepositoryInfo
Vault obtained with the ID parameter.

## OUTPUTS

### System.Management.Automation.PSObject[]
## NOTES
For more information, type "Get-Help Get-DSPamVault -detailed".
For technical information, type "Get-Help Get-DSPamVault -full".

## RELATED LINKS

[New-DSPamVault](http://127.0.0.1:1111/docs/New-DSPamVault/)

[Remove-DSPamVault](http://127.0.0.1:1111/docs/Remove-DSPamVault/)

[Update-DSPamVault](http://127.0.0.1:1111/docs/Update-DSPamVault/)

