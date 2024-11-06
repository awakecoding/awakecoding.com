---
title: 'Remove-RDMUserRepositoryAccess'
date: 2024-11-06
---


# Remove-RDMUserRepositoryAccess

## SYNOPSIS
Remove repository access to an user

## SYNTAX

```
Remove-RDMUserRepositoryAccess [-Repository] <PSRepositoryInfo> [-User] <PSUserInfo>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Remove repository access to an user

## EXAMPLES

### EXAMPLE
```
PS C:\> Remove-RDMUserRepositoryAccess -User $user -Repository $repo;Set-RDMUser $user
```

Add repository access to an user.

## PARAMETERS

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

### -Repository
Repository the user will be denied access

```yaml
Type: PSRepositoryInfo
Parameter Sets: (All)
Aliases: Vault

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -User
User that will be denied access to a repository

```yaml
Type: PSUserInfo
Parameter Sets: (All)
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSUserInfo
User that will be granted access to a repository

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRepositoryInfo
Repository the user will be granted access

## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Remove-RDMUserRepositoryAccess -detailed".
For technical information, type "Get-Help Remove-RDMUserRepositoryAccess -full".

## RELATED LINKS
