---
title: 'Export-DSPamAccountAccessReport'
date: 2024-11-06
---


# Export-DSPamAccountAccessReport

## SYNOPSIS
Generate a report detailing PAM credential access

## SYNTAX

### VaultID (Default)
```
Export-DSPamAccountAccessReport [-VaultID <Guid>] -Path <String> [-Type <ReportExportType>] [-NoClobber]
 [-PassThru] [-ResolveUserGroups] [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### EntryID
```
Export-DSPamAccountAccessReport -AccountID <Guid[]> -Path <String> [-Type <ReportExportType>] [-NoClobber]
 [-PassThru] [-ResolveUserGroups] [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Generate a report detailing PAM credential access, available in CSV, HTML, and XML formats.
By default, the system will overwrite any existing file.
To prevent this, employ the NoClobber switch.
Specify the credentials to be included in the report using either the AccountID or FolderID parameters.
Use AccountID for individual credentials, and VaultID to include all credentials within a specified vault.

## EXAMPLES

### EXAMPLE
```
PS C:\> Export-DSPamAccountAccessReport -VaultID '12345678-1234-1234-1234-1234567890AB' -Path 'myName.html' -Type Html
```

Export an html report named 'myName' in the current directory

## PARAMETERS

### -AccountID
Pam accounts' ID

```yaml
Type: Guid[]
Parameter Sets: EntryID
Aliases: PamCredentialID

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AsLegacyResponse
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object.
Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

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

### -NoClobber
Prevents the cmdlet from overwriting existing files.
If a file with the specified name already exists, the cmdlet will generate an error instead of overwriting the file.

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

### -PassThru
Enables the cmdlet to output objects it has processed, useful for further pipeline processing or inspection.

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

### -Path
Specifies the path to the output file where the data will be exported.
The path can be either absolute or relative.
If only a file name is provided, the file will be created in the current directory.
If the specified file already exists, it will be overwritten.
To prevent overwriting an existing file, use the -NoClobber switch.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResolveUserGroups
Replace user groups by its members

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

### -Type
Specifies the report type: HTML (default) and CSV

```yaml
Type: ReportExportType
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VaultID
Pam vault's ID

```yaml
Type: Guid
Parameter Sets: VaultID
Aliases: FolderID

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

### System.Management.Automation.PSObject[]
### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=7.4.4.500, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]
## NOTES
For more information, type "Get-Help Export-DSPamAccountAccessReport -detailed".
For technical information, type "Get-Help Export-DSPamAccountAccessReport -full".

## RELATED LINKS
