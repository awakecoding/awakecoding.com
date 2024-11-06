---
title: 'New-RDMRepository'
date: 2024-11-06
---


# New-RDMRepository

## SYNOPSIS
Create a new repository instance.

## SYNTAX

```
New-RDMRepository [[-Description] <String>] [[-IsAllowedOffline] <Boolean>] [-Name] <String>
 [[-VaultContentType] <VaultContentType>] [-SetRepository] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a repository instance.
The instance has not yet been saved.
Assign the result to a variable then call "Set-RDMRepository $s" to save the repository.

## EXAMPLES

### EXAMPLE
```
PS C:\> $role = New-RDMRepository -Name "New Repository" ;Set-RDMRepository $role
```

Create & save new repository.

## PARAMETERS

### -Description
Repository description.

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

### -IsAllowedOffline
Is repository allowed offline.
Default value: True

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
New repository name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetRepository
Save the new repository.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: SetVault

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VaultContentType
Specify the vault content type.
Except for Default and Everything, it will restrict which type of entries allowed in the vault.

```yaml
Type: VaultContentType
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRepositoryInfo
## NOTES
For more information, type "Get-Help New-RDMRepository -detailed".
For technical information, type "Get-Help New-RDMRepository -full".

## RELATED LINKS
