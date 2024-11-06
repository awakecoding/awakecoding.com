---
title: 'Set-RDMEntryUsername'
date: 2024-11-06
---


# Set-RDMEntryUsername

## SYNOPSIS
Set the username on the specified entry.

## SYNTAX

### Id
```
Set-RDMEntryUsername [-ID] <Guid> [-Username] <String> [-PassThru] [-Refresh] [-Set] [-VaultMode <VaultMode>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### InputObject
```
Set-RDMEntryUsername [-InputObject] <PSConnection> [-Username] <String> [-PassThru] [-Refresh] [-Set]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Set the username on the specified entry.
To persist the new username, the switch Set must be used.
    To modify the username, the user must have the appropriate rights: add for a new entry, and edit for an existing one.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $entry = Get-RDMEntry -Name 'EntryA';
    Set-RDMEntryUsername -InputObject $entry -UserName 'newUserName' -Set
```

Update the specified entry's username to 'newUserName'

### EXAMPLE 2
```
PS C:\> $securePassword = ConvertTo-SecureString -AsPlainText -String 'newPas$w0rd!';
    Get-RDMEntry -Name 'UniqueName' |
    Set-RDMEntryDomain -Domain 'MyOtherDomain.com' -PassThru |
    Set-RDMEntryPassword -Password $securePassword -PassThru |
    Set-RDMEntryUsername -UserName 'NewUserName' -PassThru |
    Set-RDMEntry
```

Modify the domain, password and username of the entry named 'UniqueName'.
The variable $securePassword is a secure string previously set.
Persist the modification with the Set-RDMSession call.

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

### -ID
ID of the entry to modify.
Use the VaultMode parameter to search in the User vault or the Global vault.

```yaml
Type: Guid
Parameter Sets: Id
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Specifies the entry to set the username to.

```yaml
Type: PSConnection
Parameter Sets: InputObject
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -PassThru
Return the modified entry.

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

### -Refresh
Send refresh notification to Remote Desktop Manager application.
Use Set switch to persist the modification.

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

### -Set
Save the modified entry.

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

### -Username
New username.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VaultMode
Vault where the command will be applied.
Three choices are offered:
        - Default: Current vault that has been set.
        - User: Vault specific to the current user.
        - Global: Global vault of the data source.

```yaml
Type: VaultMode
Parameter Sets: Id
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection
PSConnection object of the entry to modify the username from.

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection
## NOTES
For more information, type "Get-Help Set-RDMEntryUsername -detailed".
For technical information, type "Get-Help Set-RDMEntryUsername -full".

## RELATED LINKS

[Get-RDMEntryDomain](http://127.0.0.1:1111/docs/Get-RDMEntryDomain/)

