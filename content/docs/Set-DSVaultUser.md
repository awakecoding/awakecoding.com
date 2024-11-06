---
title: 'Set-DSVaultUser'
date: 2024-11-06
---


# Set-DSVaultUser

## SYNOPSIS
Sets the allowed users for a given vault.

## SYNTAX

```
Set-DSVaultUser [[-AllowedUsernameList] <String[]>] [-Update] -VaultID <Guid> [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Sets which users have access to a given vault.
If the "Update" flag is present and a supplied username is already a member of the vault, it will remove this user.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Set-DSVaultUser @("User1", "User2")
```

No user allowed in the vault before the execution.
User1 and User2 allowed in the vault after the command.

### EXAMPLE 2
```
PS C:\> Set-DSVaultUser @("User3")
```

User1 and User2 allowed in the vault before the execution.
User3 is the only user allowed in the vault after the command.

### EXAMPLE 3
```
PS C:\> Set-DSVaultUser @("User2") -Update
```

User1 allowed in the vault before the execution.
User1 and User2 allowed in the vault after the command.
The update flag keeps previous users.

### EXAMPLE 4
```
PS C:\> Set-DSVaultUser @("User2", "User3") -Update
```

User1 and User2 allowed in the vault before the execution.
User1 and User3 allowed in the vault after the command.
User2 lose his access because of the presence of the update flag.

## PARAMETERS

### -AllowedUsernameList
Accept an array of strings containing usernames (not id) to allow in vault

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
Update the current users instead of overwriting them.

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
For more information, type "Get-Help Set-DSVaultUser -detailed".
For technical information, type "Get-Help Set-DSVaultUser -full".

## RELATED LINKS
