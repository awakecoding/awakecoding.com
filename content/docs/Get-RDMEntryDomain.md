---
title: 'Get-RDMEntryDomain'
date: 2024-11-06
---


# Get-RDMEntryDomain

## SYNOPSIS
Get the domain from the specified entry.

## SYNTAX

### Id
```
Get-RDMEntryDomain [-ID] <Guid> [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### InputObject
```
Get-RDMEntryDomain [-InputObject] <PSConnection> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get the domain of the specified entry.
    To obtain the domain, the user must be able to copy it.
Generally, this means the right to view it.
The status of the entry, such as Locked or Expired, can also prevent the obtention of the domain.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $entry = Get-RDMEntry -Name EntryA;
    Get-RDMEntryDomain -InputObject $entry
```

Get the domain from the entry named EntryA.

### EXAMPLE 2
```
PS C:\> $entries = Get-RDMEntry | Where { (Get-RDMEntryDomain -InputObject $_) -eq 'mydomain' };
    $entries | Set-RDMEntryDomain -InputObject $entry -Domain 'newDomain' -Set;
    Update-RDMEntries
```

For all entries whose domain is 'mydomain', update it to 'newDomain' and save the change.
After all the modifications, refresh the entries list.

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
Specifies the entry to get the domain from.

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
PSConnection object of the entry to extract the domain from.

## OUTPUTS

### System.String
## NOTES
For more information, type "Get-Help Get-RDMEntryDomain -detailed".
For technical information, type "Get-Help Get-RDMEntryDomain -full".

## RELATED LINKS

[Set-RDMEntryDomain](http://127.0.0.1:1111/docs/Set-RDMEntryDomain/)

