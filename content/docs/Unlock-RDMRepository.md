---
title: 'Unlock-RDMRepository'
date: 2024-11-06
---


# Unlock-RDMRepository

## SYNOPSIS
Unlock the vault to be loaded

## SYNTAX

```
Unlock-RDMRepository [-Password] <PSPassword> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Unlock the vault to load it.
If this fails, the user will be prompted for the password.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Unlock-RDMRepository -Password 'pa$sWord!'
PS C:\> Get-RDMDataSource -Name 'myDataSourceWithOnlyProtectedVaults' | Set-RDMCurrentDataSource
```

Unlock the last used vault in the data source named 'myDataSourceWithOnlyProtectedVaults before accessing it'

### EXAMPLE 2
```
PS C:\> Unlock-RDMRepository -Password (ConvertTo-SecureString -AsPlainText -String 'pa$sWord!')
PS C:\> Get-RDMVault -Name 'myLockedVault' | Set-RDMCurrentVault
```

Unlock the vault 'myLockedVault' before accessing it'

## PARAMETERS

### -Password
Password to unlock the vault.
Accepts a string or SecureString.

```yaml
Type: PSPassword
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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

### None
## NOTES
For more information, type "Get-Help Unlock-RDMRepository -detailed".
For technical information, type "Get-Help Unlock-RDMRepository -full".

## RELATED LINKS
