---
title: 'Export-RDMSession'
date: 2024-11-06
---


# Export-RDMSession

## SYNOPSIS
Export a list of sessions to a file

## SYNTAX

### CSVExport
```
Export-RDMSession [-CSV] -Sessions <PSConnection[]> -Path <String> -Password <SecureString>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### HTMLExport
```
Export-RDMSession [-HTML] -Sessions <PSConnection[]> -Path <String> -Password <SecureString>
 [-ExcludeSessionPassword] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### XMLExport
```
Export-RDMSession [-XML] -Sessions <PSConnection[]> -Path <String> [-Password <SecureString>]
 [-Version <RDMExportVersion>] [-ExcludeShortcuts] [-IncludeCredentials] [-IncludeAttachements]
 [-IncludeDocumentation] [-IncludeFavorite] [-RemoveAllFolders] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Export a list of sessions to a file.
The user must have the right to export.
The sessions must come from the current data source or they will be ignored.
If user vault export is disabled, the sessions from the private vault will be ignored.

## EXAMPLES

### EXAMPLE
```
PS C:\> $sessions = Get-RDMEntry;
        $password = Read-Host -AsSecureString "Password";
        Export-RDMSession -XML -Path C:\MyPath\MyFilename.rdm -Sessions $sessions -Password $password
```

Retrieves the list of available sessions and export them to a rdm file at C:\MyPath\Filename.rdm.

## PARAMETERS

### -CSV
Export the sessions into a CSV file

```yaml
Type: SwitchParameter
Parameter Sets: CSVExport
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeSessionPassword
Don't export the password in the connections exported

```yaml
Type: SwitchParameter
Parameter Sets: HTMLExport
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeShortcuts
Exclude shortcuts in the export (Only available for the XML type).

```yaml
Type: SwitchParameter
Parameter Sets: XMLExport
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

### -HTML
Export the sessions into a HTML file

```yaml
Type: SwitchParameter
Parameter Sets: HTMLExport
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeAttachements
Include attachements in the export (Only available for the XML type).

```yaml
Type: SwitchParameter
Parameter Sets: XMLExport
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeCredentials
Include credentials in the export (Only available for the XML type).

```yaml
Type: SwitchParameter
Parameter Sets: XMLExport
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeDocumentation
Include entry documentation in the export (Only available for the XML type).

```yaml
Type: SwitchParameter
Parameter Sets: XMLExport
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeFavorite
keep the favorite status.

```yaml
Type: SwitchParameter
Parameter Sets: XMLExport
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
Password.

```yaml
Type: SecureString
Parameter Sets: CSVExport, HTMLExport
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

```yaml
Type: SecureString
Parameter Sets: XMLExport
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Path
Path where the file will be the saved.
Must end with:

"CSV: .zip", "HTML: .html", "XML: .xml", "RDM: .rdm"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -RemoveAllFolders
Remove all folders.
All other entries will have their group set at the root level.

```yaml
Type: SwitchParameter
Parameter Sets: XMLExport
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sessions
Sessions.

```yaml
Type: PSConnection[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Version
Export file version for '.xml' and '.rdm' files.
The default value is v2.

```yaml
Type: RDMExportVersion
Parameter Sets: XMLExport
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -XML
Export the sessions into a XML file

```yaml
Type: SwitchParameter
Parameter Sets: XMLExport
Aliases: RDM

Required: True
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

### System.String
File path

### System.Security.SecureString
Password used to protect the file

## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Export-RDMSession -detailed".
For technical information, type "Get-Help Export-RDMSession -full".

## RELATED LINKS
