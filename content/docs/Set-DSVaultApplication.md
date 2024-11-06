---
title: 'Set-DSVaultApplication'
date: 2024-11-06
---


# Set-DSVaultApplication

## SYNOPSIS
Sets the allowed applications for a given vault.

## SYNTAX

```
Set-DSVaultApplication [[-AllowedApplicationsList] <String[]>] [-Update] -VaultID <Guid> [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Sets which application have access to a given vault.
If the "Update" flag is present and a supplied application name is already a member of the vault, it will remove this application.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Set-DSVaultApplication @("App1", "App2")
```

No application allowed in the vault before the execution.
App1 and App2 allowed in the vault after the command.

### EXAMPLE 2
```
PS C:\> Set-DSVaultApplication @("App3")
```

App1 and User2 allowed in the vault before the execution.
App3 is the only application allowed in the vault after the command.

### EXAMPLE 3
```
PS C:\> Set-DSVaultApplication @("App2") -Update
```

App1 allowed in the vault before the execution.
App1 and App2 allowed in the vault after the command.
The update flag keeps previous applications.

### EXAMPLE 4
```
PS C:\> Set-DSVaultApplication @("App2", "App3") -Update
```

App1 and App2 allowed in the vault before the execution.
App1 and App3 allowed in the vault after the command.
App2 lose his access because of the presence of the update flag.

## PARAMETERS

### -AllowedApplicationsList
Accept an array of strings containing application names (not id) to allow in vault

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

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

### -Update
Update the current applications instead of overwriting them.

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
Vault's ID to update

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
For more information, type "Get-Help Set-DSVaultApplication -detailed".
For technical information, type "Get-Help Set-DSVaultApplication -full".

## RELATED LINKS
