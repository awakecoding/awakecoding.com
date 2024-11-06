---
title: 'Export-RDMRepository'
date: 2024-11-06
---


# Export-RDMRepository

## SYNOPSIS
Export vaults of the current data source in a rdx file.

## SYNTAX

### Name (Default)
```
Export-RDMRepository [-Name] <String[]> [-Path] <String> [-Password <SecureString>] [-IncludeAttachments]
 [-IncludeCredentials] [-IncludeDocumentation] [-IncludeFavorite] [-RemoveAllFolders] [-NoClobber]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### Id
```
Export-RDMRepository [-ID] <Guid[]> [-Path] <String> [-Password <SecureString>] [-IncludeAttachments]
 [-IncludeCredentials] [-IncludeDocumentation] [-IncludeFavorite] [-RemoveAllFolders] [-NoClobber]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### InputObject
```
Export-RDMRepository [-InputObject] <PSRepositoryInfo[]> [-Path] <String> [-Password <SecureString>]
 [-IncludeAttachments] [-IncludeCredentials] [-IncludeDocumentation] [-IncludeFavorite] [-RemoveAllFolders]
 [-NoClobber] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### Literal
```
Export-RDMRepository [-LiteralName] <String[]> [-Path] <String> [-Password <SecureString>]
 [-IncludeAttachments] [-IncludeCredentials] [-IncludeDocumentation] [-IncludeFavorite] [-RemoveAllFolders]
 [-NoClobber] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Export vaults of the current data source in a rdx file.
To protect the file, the parameter Password must be used.
By default, if the file exists in the specified path, it will be overwritten.
The NoClobber switch must be used to avoid this behavior.
    This command is only available for an administrator on an advanced data source.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $pwd = Read-Host -AsSecureString;
    Export-RDMRepository -Name Vault* -Path myFile.rdx -Password $pwd -RemoveAllFolders
```

Export all vaults whose name start with 'Vault' in 'myFile.rdx'.
The file is protected with the parameter $pwd.
All folders are not exported.
The entries will all be at the root level.

### EXAMPLE 2
```
PS C:\> $filePath = 'C:\my\path\filename.rdx';
    Export-RDMRepository -Name VaultA, VaultB, VaultC -Path $path -IncludeAttachments -IncludeCredentials -IncludeDocumentation;
    Get-RDMDataSource -Name AnotherOne | Set-RDMCurrentDataSource;
    Import-RDMSession -Path myFile.rdx -KeepID -Duplicate IgnoreAll
```

Export VaultA, VaultB, and VaultC of the current data source in the file specified by $path.
Change the current data source to 'AnotherOne' and import all vaults recently exported.
With the KeepID switch present, all imported entries will keep their ID.
As long as the new data source does not use the same database, no unexpected behaviors will happen.

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
Specifies the ID of the vaults to be exported.

```yaml
Type: Guid[]
Parameter Sets: Id
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeAttachments
Include attachements and documents in the export

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

### -IncludeCredentials
Include credentials in the export.

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

### -IncludeDocumentation
Include entry documentation in the export.

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

### -IncludeFavorite
Keep the favorite status.

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

### -InputObject
Specifies the vaults to be exported.

```yaml
Type: PSRepositoryInfo[]
Parameter Sets: InputObject
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -LiteralName
Specifies the name of the vaults to be exported.
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
Specifies the name of the vaults to be exported.

```yaml
Type: String[]
Parameter Sets: Name
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

### -Password
Protect the data with a master key.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Path where the file containing the exported vaults will be saved.
The extension must be '.rdx'.
If it is not the case, it will be modified to it.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RemoveAllFolders
Remove all folders.
All other entries will have their group set at the root level.

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

### None
## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Export-RDMRepository -detailed".
For technical information, type "Get-Help Export-RDMRepository -full".

## RELATED LINKS

[Import-RDMRepository](http://127.0.0.1:1111/docs/Import-RDMRepository/)

