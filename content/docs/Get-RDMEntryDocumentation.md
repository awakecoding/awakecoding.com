---
title: 'Get-RDMEntryDocumentation'
date: 2024-11-06
---


# Get-RDMEntryDocumentation

## SYNOPSIS
Get documentation pages of entries

## SYNTAX

### Name (Default)
```
Get-RDMEntryDocumentation [-InputObject] <PSConnection[]> [-Data <String[]>] [[-Name] <String[]>]
 [-CaseSensitive] [-Default] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### Literal
```
Get-RDMEntryDocumentation [-InputObject] <PSConnection[]> [-Data <String[]>] [[-LiteralName] <String[]>]
 [-CaseSensitive] [-Default] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Get documentations pages of entries.
The entries must be fetched by Get-RDMEntry.
There is two possibility to filter the pages: by their name and by their data (content).
    The data source must support the documentation feature and be online.
The user must have the rights to access the documentation.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $page = Get-RDMEntry -Name EntryA | Get-RDMEntryDocumentation -Name PageA;
    $page.Data
```

Get the documentation page named 'PageA' of the entry named 'EntryA' and see its content.

### EXAMPLE 2
```
PS C:\> $defaultPages = Get-RDMEntry -VaultMode Global | Get-RDMEntryDocumentation -Default;
    foreach ($defaultPage in $defaultPages) { $defaultPage.Default = $false }
    Set-RDMEntryDocumentation -InputObject $defaultPages
```

Remove the default status of the default documentation page of each entries in the system vault.

### EXAMPLE 3
```
PS C:\> Get-RDMEntry -Name EntryA | Get-RDMEntryDocumentation -Data '*Temporary*' -CaseSensitive | Remove-RDMEntryDocumentation
```

Delete all documentation pages of the entry 'EntryA' that contains the word 'Temporary'

## PARAMETERS

### -CaseSensitive
Filtering will be case sensitive.

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

### -Data
Filter the handbook pages by their content.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Default
Obtain only the default page.
Maximum one default page per entry.

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
Entry from which to extract the documentation.

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

### -LiteralName
Filter the handbook pages by their name.
No characters are interpreted as

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

### -Name
Filter the handbook pages by their name.

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
Entries, obtained from Get-RDMEntry, containing the documentation.

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSHandbookPage[]
## NOTES
For more information, type "Get-Help Get-RDMEntryDocumentation -detailed".
For technical information, type "Get-Help Get-RDMEntryDocumentation -full".

## RELATED LINKS

[New-RDMEntryDocumentation](http://127.0.0.1:1111/docs/New-RDMEntryDocumentation/)

[Remove-RDMEntryDocumentation](http://127.0.0.1:1111/docs/Remove-RDMEntryDocumentation/)

[Set-RDMEntryDocumentation](http://127.0.0.1:1111/docs/Set-RDMEntryDocumentation/)

