---
title: 'Get-RDMEntryDocument'
date: 2024-11-06
---


# Get-RDMEntryDocument

## SYNOPSIS
Get documents stored in the database

## SYNTAX

### Name (Default)
```
Get-RDMEntryDocument [-Name <String[]>] [-VaultMode <VaultMode>] [-CaseSensitive]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Literal
```
Get-RDMEntryDocument -LiteralName <String[]> [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get documents stored in the database.
The user can specify the desired vault: default or user.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $doc = Get-RDMEntryDocument -Name 'SimpleTextDocument' -VaultMode User;
    $doc.Data = [System.Text.Encoding]::UTF8.GetBytes('My new content');
    Set-RDMEntryDocument -InputObject $doc
```

Update the content of the document stored in the database of the entry SimpleTextDocument.

### EXAMPLE 2
```
PS C:\> $doc = Get-RDMEntryDocument -Name 'SimpleTextDocument';
    $doc.Data = Get-Content -Path MyFile.txt -AsByteStream;
    Set-RDMEntryDocument -InputObject $doc
```

Update the content of the document stored in the database of the entry SimpleTextDocument with the content of the file contained in the entry SimpleTextDocument

## PARAMETERS

### -CaseSensitive
Filtering by name will be case sensitive.

```yaml
Type: SwitchParameter
Parameter Sets: Name
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

### -LiteralName
Filter the document entries by their name.
No characters are interpreted as wildcards.

```yaml
Type: String[]
Parameter Sets: Literal
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Filter the document entries by their name.
Support wildcard characters.

```yaml
Type: String[]
Parameter Sets: Name
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnectionDocument[]
## NOTES
For more information, type "Get-Help Get-RDMEntryDocument -detailed".
For technical information, type "Get-Help Get-RDMEntryDocument -full".

## RELATED LINKS

[Set-RDMEntryDocument](http://127.0.0.1:1111/docs/Set-RDMEntryDocument/)

