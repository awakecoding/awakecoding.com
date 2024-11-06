---
title: 'Move-RDMSession'
date: 2024-11-06
---


# Move-RDMSession

## SYNOPSIS
Move entries to the specified group or a new vault.

## SYNTAX

### IdFolder
```
Move-RDMSession [-ID] <Guid[]> [-Destination] <String> [-PassThru] [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### IdVault
```
Move-RDMSession [-ID] <Guid[]> [-ToVaultID] <Guid> [-PassThru] [-Refresh] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### InputObjectFolder
```
Move-RDMSession [-InputObject] <PSConnection[]> [-Destination] <String> [-PassThru] [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### InputObjectVault
```
Move-RDMSession [-InputObject] <PSConnection[]> [-ToVaultID] <Guid> [-PassThru] [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### NameFolder
```
Move-RDMSession [-Name] <String[]> [-Destination] <String> [-PassThru] [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### NameVault
```
Move-RDMSession [-Name] <String[]> [-ToVaultID] <Guid> [-PassThru] [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Move entries to the specified group.
If an entry is a group, all the entries it contains will be also moved.
To transfer to a new vault, its ID must used.
If a transfered folder contains an non transfered entry, the folder will be copied instead of moved.
Only an administrator can transfer entries between vaults.
Its not possible to do so from or to the user vault.
            It is not allowed to move a parent group to one of its child group.
It is not allowed to have a group with a duplicate name.
In those two cases, the group will not be moved to the destination.
            To obtain the entries obtained from the user input that actually moved, use the PassThru parameter.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMSession -Name FolderToBeMoved | Move-RDMSession -Destination ""
```

Move the group named FolderToBeMoved and all entries it contains to the root

### EXAMPLE 2
```
PS C:\> Move-RDMSession -Name EntryA, EntryB, EntryE -Destination Greener\Pastures
```

Move the entries EntryA, EntryB, and EntryE to the group Pastures whose parent is the group Greener.

### EXAMPLE 3
```
PS C:\> $vaultDestination = Get-RDMRepository -Name 'VaultA';
        Move-RDMSession -Name EntryA, EntryB, EntryE -ToVaultID $vaultDestination.ID
```

Move the entries EntryA, EntryB, and EntryE from the current vault to the vault named 'VaultA'.

## PARAMETERS

### -Destination
New group value.
It must be the complete path to the folder.
It is corresponding to the Group attribute to the PSConnection object.

```yaml
Type: String
Parameter Sets: IdFolder, InputObjectFolder, NameFolder
Aliases:

Required: True
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

### -ID
Specifies the ID of the entries to be moved.

```yaml
Type: Guid[]
Parameter Sets: IdFolder, IdVault
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Specifies the entries to be moved.

```yaml
Type: PSConnection[]
Parameter Sets: InputObjectFolder, InputObjectVault
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Name
Specifies the name of the entries to be moved.

```yaml
Type: String[]
Parameter Sets: NameFolder, NameVault
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
Return the entries with the new group.
Entries in a moved group will not be returned unless they were passed to the command.
All unmodified entries are not returned.

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
Refresh RDM UI.
If RDM in not open, nothing happens.

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

### -ToVaultID
ID of the vault where the entries will be moved.
Cannot transfer entries from the user vault.

```yaml
Type: Guid
Parameter Sets: IdVault, InputObjectVault, NameVault
Aliases:

Required: True
Position: 2
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]
Array of PSConnection to move.

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection[]
## NOTES
For more information, type "Get-Help Move-RDMSession -detailed".
For technical information, type "Get-Help Move-RDMSession -full".

## RELATED LINKS
