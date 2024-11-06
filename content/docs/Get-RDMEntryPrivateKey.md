---
title: 'Get-RDMEntryPrivateKey'
date: 2024-11-06
---


# Get-RDMEntryPrivateKey

## SYNOPSIS
Get an entry's private key

## SYNTAX

### InputObject (Default)
```
Get-RDMEntryPrivateKey [-InputObject] <PSConnection> [[-ExportPath] <String>] [-NoClobber]
 [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### Id
```
Get-RDMEntryPrivateKey [-ID] <Guid> [[-ExportPath] <String>] [-NoClobber] [-VaultMode <VaultMode>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### InputObjectPipeline
```
Get-RDMEntryPrivateKey [-InputObject] <PSConnection> [[-ExportPath] <String>] [-NoClobber]
 [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Get an entry's private key.
Two types of private key are supported: Embedded data and File (local).
The user must also have the right to edit the entry.
Additionaly, the 'ExportPath' parameter allows for the key to be saved into a file.
Only a vault owner or administrator can export the key.")\]

## EXAMPLES

### EXAMPLE
```
Get-RDMEntry -Name 'My Private Key Cred' | Get-RDMEntryPrivateKey -ExportPath 'myfile.key' | Out-Null
```

Save the private key from the entry named 'My Private Key Cred' into a file named 'myfile.key'.

## PARAMETERS

### -ExportPath
Export file for the private key.

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

### -ID
ID of the entry for which the private key is fetched

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
ID of the entry for which the private key is fetched

```yaml
Type: PSConnection
Parameter Sets: InputObject
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: PSConnection
Parameter Sets: InputObjectPipeline
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoClobber
NoClobber prevents an existing file from being overwritten and displays a message that the file already exists.
By default, if a file exists in the specified path, it is overwritten.

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
The entry containing the private key

## OUTPUTS

### System.String
## NOTES
For more information, type "Get-Help Get-RDMEntryPrivateKey -detailed".
For technical information, type "Get-Help Get-RDMEntryPrivateKey -full".

## RELATED LINKS

[Get-RDMEntry](http://127.0.0.1:1111/docs/Get-RDMEntry/)

[Get-RDMSession](http://127.0.0.1:1111/docs/Get-RDMSession/)

[Get-RDMPrivateSession](http://127.0.0.1:1111/docs/Get-RDMPrivateSession/)

