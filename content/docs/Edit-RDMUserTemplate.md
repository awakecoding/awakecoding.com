---
title: 'Edit-RDMUserTemplate'
date: 2024-11-06
---


# Edit-RDMUserTemplate

## SYNOPSIS
Add or default vaults in the User Template of the System Settings for a specific data source.
New users created in that data source will gain or lose access to those vaults.

## SYNTAX

### AddRepository
```
Edit-RDMUserTemplate [-AddRepository] <Object[]> [-CaseSensitive] [-DataSource] <Object>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### RemoveRepository
```
Edit-RDMUserTemplate [-CaseSensitive] [-DataSource] <Object> [-RemoveRepository] <Object[]>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Add or default vaults in the User Template of the System Settings for a specific data source.
New users created in that data source will gain or lose access to those vaults.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Edit-RDMUserTemplate -DataSource ADataSource -AddRepository ACommonVault;
```

Add ACommonVault in the User Template in the System Settings of the data source "ADataSource".

### EXAMPLE 2
```
PS C:\> Edit-RDMUserTemplate -DataSource ADataSource -RemoveRepository *;
```

Remove all the repositories in the User Template in the System Settings of the data source ADataSource.

### EXAMPLE 3
```
PS C:\> Get-RDMDataSource -Name "ADataSource" | Edit-RDMUserTemplate -RemoveRepository CommonVault[ab] -CaseSensitive;
```

Remove the repositories CommonVaulta and CommonVaultb in the User Template in the System Settings of the data source "ADataSource".
The case sensitive switch is not impacting the term \[ab\], meaning a repository CommonVaultA would not be affected.

### EXAMPLE 4
```
PS C:\> Edit-RDMUserTemplate -DataSource ADataSource -Repository UserVault? -CaseSensitive;
```

Add all repositories UserVault?
such as UserVaultA and UserVault1 in the User Template in the System Settings of the data source "ADataSource".
The search for the data source and the repositories wll be case sensitive.

## PARAMETERS

### -AddRepository
Add the default vaults in the User Template of the System Settings.
Allows to find repositories by ID (Guid), by name (supports wildcards), and repositories (PSRepositoryInfo).

```yaml
Type: Object[]
Parameter Sets: AddRepository
Aliases: AddVault

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: True
```

### -CaseSensitive
Case sensitive when searching the data source or the repositories by name

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

### -DataSource
DataSource whose settings will be modified.
Allows to find the data source by ID (Guid), by name (supports wildcard), and data source (PSDataSource).

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
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

### -RemoveRepository
Remove the default vaults in the User Template of the System Settings.
Allows to find repositories by ID (Guid), by name (supports wildcards), and repositories (PSRepositoryInfo).
Removing all default vaults is possible.

```yaml
Type: Object[]
Parameter Sets: RemoveRepository
Aliases: RemoveVault

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: True
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

### System.Management.Automation.PSObject
The data source whose system settings will be modified.
Allows to find the data source by ID (Guid), by name (supports wildcard), and data source (PSDataSource).

### System.Management.Automation.PSObject
The repositories to add or remove to the User Template.
Allows to find repositories by ID (Guid), by name (supports wildcards), and repositories (PSRepositoryInfo).

### System.Management.Automation.SwitchParameter
The name of the data source and the repositories will be a case sensitive search is this switch is present.

## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Edit-RDMUserTemplate -detailed".
For technical information, type "Get-Help Edit-RDMUserTemplate -full".

## RELATED LINKS

[Get-RDMCurrentDataSource](http://127.0.0.1:1111/docs/Get-RDMCurrentDataSource/)

[Get-RDMDataSource](http://127.0.0.1:1111/docs/Get-RDMDataSource/)

[Get-RDMCurrentRepository](http://127.0.0.1:1111/docs/Get-RDMCurrentRepository/)

[Get-RDMRepository](http://127.0.0.1:1111/docs/Get-RDMRepository/)

