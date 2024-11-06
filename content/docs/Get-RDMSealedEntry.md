---
title: 'Get-RDMSealedEntry'
date: 2024-11-06
---


# Get-RDMSealedEntry

## SYNOPSIS
Get sealed entries.

## SYNTAX

### Name (Default)
```
Get-RDMSealedEntry [[-Name] <String[]>] [[-GroupName] <String[]>] [-Type <ConnectionType[]>] [-CaseSensitive]
 [-IncludeSubFolders] [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Id
```
Get-RDMSealedEntry [[-ID] <Guid[]>] [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Literal
```
Get-RDMSealedEntry [[-LiteralName] <String[]>] [[-LiteralGroupName] <String[]>] [-Type <ConnectionType[]>]
 [-CaseSensitive] [-IncludeSubFolders] [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
To get sealed entries, ensure that you are using a Devolutions Server data source, as only this type supports the operation.
The returned object will contain only basic information.
To unseal the entry, use the command Unprotect-RDMSealedEntry.

## EXAMPLES

### EXAMPLE
```
PS C:\> Get-RDMSealedEntry -Name 'InCaseOfEmergency' | Unprotect-RDMSealedEntry;
PS C:\> $unsealedEntry = Get-RDMEntry -Name 'InCaseOfEmergency';
PS C:\> $password = Get-RDMEntryPassword -InputObject $unsealedEntry -AsPlainText;
PS C:\> $unsealedEntry.SealState = 'Sealed';
PS C:\> Set-RDMEntry -InputObject $unsealedEntry;
```

Unseal the entry 'InCaseOfEmergency', get its password, and reseal the entry

## PARAMETERS

### -CaseSensitive
Filtering by name and group name will be case sensitive.

```yaml
Type: SwitchParameter
Parameter Sets: Name, Literal
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

### -GroupName
Filter the entries by the group.
Support wildcard characters.

```yaml
Type: String[]
Parameter Sets: Name
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ID
Filter the entries by their ID

```yaml
Type: Guid[]
Parameter Sets: Id
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeSubFolders
Filtering by group name will include entries in subfolders

```yaml
Type: SwitchParameter
Parameter Sets: Name, Literal
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LiteralGroupName
Filter the entries by the group.
Support wildcard characters.

```yaml
Type: String[]
Parameter Sets: Literal
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LiteralName
Filter the entries by their name.
No wildcard supports.

```yaml
Type: String[]
Parameter Sets: Literal
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Filter the entries by their name.
Support wildcard characters.

```yaml
Type: String[]
Parameter Sets: Name
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
Filter the result by the connection type

```yaml
Type: ConnectionType[]
Parameter Sets: Name, Literal
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSSealedConnection[]
## NOTES
For more information, type "Get-Help Get-RDMSealedEntry -detailed".
For technical information, type "Get-Help Get-RDMSealedEntry -full".

## RELATED LINKS

[Unprotect-RDMSealedEntry](http://127.0.0.1:1111/docs/Unprotect-RDMSealedEntry/)

