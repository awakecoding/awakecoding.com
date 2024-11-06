---
title: 'Get-RDMDeletedEntry'
date: 2024-11-06
---


# Get-RDMDeletedEntry

## SYNOPSIS
Get deleted entries' history

## SYNTAX

### Name (Default)
```
Get-RDMDeletedEntry [[-Name] <String[]>] [-CaseSensitive] [-VaultMode <VaultMode>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Id
```
Get-RDMDeletedEntry [-ID] <Guid> [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Literal
```
Get-RDMDeletedEntry [-LiteralName] <String[]> [-CaseSensitive] [-VaultMode <VaultMode>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get deleted entries' history.
For the data source supporting this functionality, every time an entry is deleted it is logged.
This cmdlet will return the deleted entries from the log.
The cmdlet get all deleted entries of the current vault.
An ID can be passed to obtain a specific entry.
The cmdlet cannot be executed in offline.
The user must have the right to view the deleted entries to obtain the logs.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $today = (Get-Date).Date;
        Get-RDMDeletedEntry | Where ModifiedDate -ge $today
```

View all entries deleted today

### EXAMPLE 2
```
PS C:\> $deletedEntries = Get-RDMDeletedEntry | Where GroupName -eq 'a\group\name'
        Remove-RDMDeletedEntry -InputObject $deletedEntries
```

Delete all deleted entries whose groupName is 'a\group\name'.

## PARAMETERS

### -CaseSensitive
Filtering by name will be case sensitive.

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

### -ID
Obtain the deleted history of a specific entry

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

### -LiteralName
Filter the result with the name.
No characters are interpreted as wildcards.

```yaml
Type: String[]
Parameter Sets: Literal
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Filter the result with the name.

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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionHistory[]
## NOTES
For more information, type "Get-Help Get-RDMDeletedEntry -detailed".
For technical information, type "Get-Help Get-RDMDeletedEntry -full".

## RELATED LINKS

[Remove-RDMDeletedEntry](http://127.0.0.1:1111/docs/Remove-RDMDeletedEntry/)

