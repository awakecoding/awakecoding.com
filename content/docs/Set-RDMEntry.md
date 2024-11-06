---
title: 'Set-RDMEntry'
date: 2024-11-06
---


# Set-RDMEntry

## SYNOPSIS
Save the entry.

## SYNTAX

```
Set-RDMEntry [-InputObject] <PSConnection[]> [-PassThru] [-Refresh] [-VaultMode <VaultMode>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Save the entry.
The entry must be obtained via the Get-RDMEntry cmdlet or via the New-RDMEntry cmdlet.
In the system vault, the supported types are limited to Group, Contact, SessionTool, and VPN.
    This cmdlet cannot be used to move an entry to another vault.
To do so, use the Move-RDMEntry cmdlet.
    The user must have the rights to add or edit the entry.
In the system vault, the user must be an administator.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $folder = New-RDMEntry -Name 'New Folder' -Type 'Group';
        $folder.GroupDetails.UserName = 'MyUserName';
        $folder.GroupDetails.Domain = 'MyDomain';
        $folder = Set-RDMEntry -InputObject $folder -PassThru
```

Create a new entry without saving it and store it in $folder.
Add some additionnal information in the GroupDetails.
Save the entry in the current vault and store it in $folder.

### EXAMPLE 2
```
PS C:\> $entries = Get-RDMEntry -Name Entry?;
    $entries | ForEach-Object { $_.Name = '[Deprecated]' + $_.Name };
    $entries | Set-RDMEntry -Reresh
```

Store all entries whose name is Entry followed by a character.
Append '\[Deprecated\]' to their name and save the modifications.
The switch Refresh is used to ensure subsequent commands are applied on the modified entries.

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

### -InputObject
PSConnection\[\] object retrieved from Get-RDMEntry or created via New-RDMEntry.

```yaml
Type: PSConnection[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -PassThru
Return the all saved entries as a PSConnection\[\].

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
Refresh entries in the vault.
All entries of type 'Group' automatically trigger a refresh to ensure they are available for other entries.
For modification in bulk, use Update-RDMEntries after the modifications instead of this switch.

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

### -VaultMode
Vault where the command will be applied.
Three choices are offered:
- Default: Current vault that has been set.
- User: Vault specific to the current user.
- Global: Global vault of the data source.

```yaml
Type: VaultMode
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]
Entries to save obtained from Get-RDMEntry or New-RDMEntry

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]
## NOTES
For more information, type "Get-Help Set-RDMEntry -detailed".
For technical information, type "Get-Help Set-RDMEntry -full".

## RELATED LINKS

[Get-RDMEntry](http://127.0.0.1:1111/docs/Get-RDMEntry/)

[New-RDMEntry](http://127.0.0.1:1111/docs/New-RDMEntry/)

[Remove-RDMEntry](http://127.0.0.1:1111/docs/Remove-RDMEntry/)

