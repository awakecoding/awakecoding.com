---
title: 'Get-RDMRoleRepositoryAccess'
date: 2024-11-06
---


# Get-RDMRoleRepositoryAccess

## SYNOPSIS
Retrieve the list of available user vaults.

## SYNTAX

### ID
```
Get-RDMRoleRepositoryAccess [-CaseSensitive] [-ID] <Guid> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [[-Name] <String>] [<CommonParameters>]
```

### User
```
Get-RDMRoleRepositoryAccess [-CaseSensitive] [-Role] <PSRoleInfo> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Retrieve the list of available vaults for the provided user.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMUserVaultAccess
```

Retrieves the list of available user vaults.

### EXAMPLE 2
```
PS C:\> $list = Get-RDMUserVaultAccess $user; $list[0]
```

Retrieves the list of available user vaults and displays the first item.
$user must be retrieved from Get-RDMUser or New-RDMUser.

### EXAMPLE 3
```
PS C:\> Get-RDMUserVaultAccess $user -Name Default
```

Retrieves the Default vault information if associated to $user.
$user must be retrieved from Get-RDMUser or New-RDMUser.

## PARAMETERS

### -CaseSensitive
Case sensitive

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

### -ForcePromptAnswer
Switch to use with caution.
It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions.
In case of multiple prompts, multiple values can be passed to this parameter.
Here are the accepted values:
- Yes: Accept the prompt.
Cover the OK and Automatic value.
- No: Refuse the yes/no/cancel prompt.
Cancel is the fallback option if there is not an option No.
- Cancel: Cancel the yes/no/cancel prompt.
No is the fallback option if there is not an option Cancel.

```yaml
Type: DialogResult[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ID
Specifies the GUID of the user to user.

The value must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}

```yaml
Type: Guid
Parameter Sets: ID
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Name
Vault's name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Role
User object, must be retrieved from Get-RDMUser or created via New-RDMUser.

```yaml
Type: PSRoleInfo
Parameter Sets: User
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
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

### System.String
User

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRepositoryInfo[]
## NOTES
For more information, type "Get-Help Get-RDMRoleRepositoryAccess -detailed".
For technical information, type "Get-Help Get-RDMRoleRepositoryAccess -full".

## RELATED LINKS

[Set-RDMUser](http://127.0.0.1:1111/docs/Set-RDMUser/)

[Set-RDMUserProperty](http://127.0.0.1:1111/docs/Set-RDMUserProperty/)

[New-RDMUser](http://127.0.0.1:1111/docs/New-RDMUser/)

[Remove-RDMUser](http://127.0.0.1:1111/docs/Remove-RDMUser/)

