---
title: 'Import-RDMRepository'
date: 2024-11-06
---


# Import-RDMRepository

## SYNOPSIS
Import vaults contained in a rdx file in the current data source

## SYNTAX

```
Import-RDMRepository [-Path] <String> [-Password <SecureString>] [-Duplicate <DuplicateAction>] [-KeepID]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Import vaults contained in a rdx file in the current data source.
If the file is protected, the parameter Password must be used to unlock the data contained.
By default, all entries will have their ID changedd.
This is to avoid unwanted behaviors, such as moving an entry if imported in the same database.
The Duplicate parameter indicates the action (ignore, overwrite, add) to apply in presence of duplicated entries.
    A limitation of the command is the inability to map the imported vaults to a specific one.
Each vault will be assigned to an existing one with the same ID or the same name, or a new one if none are found.
    This command is only available for an administrator on an advanced data source.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $pwd = Read-Host -AsSecureString;
    Import-RDMRepository -Path myFile.rdx -Password $pwd
```

Import all vaults in 'myFile.rdx'.
The protected file is unlocked with the parameter $pwd.

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

### -Duplicate
Action to apply to the imported entries in case of a duplicate.
If the KeepID switch is not present, no duplicate will be found.
By default, all duplicates will be ignored.

```yaml
Type: DuplicateAction
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

### -KeepID
Keep all imported connections' ID.
This is can cause unwanted behaviors, such as moving an entry if imported in the same database.

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
Unlock the data contained in the protected file.

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

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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

### None
## NOTES
For more information, type "Get-Help Import-RDMRepository -detailed".
For technical information, type "Get-Help Import-RDMRepository -full".

## RELATED LINKS

[Export-RDMRepository](http://127.0.0.1:1111/docs/Export-RDMRepository/)

