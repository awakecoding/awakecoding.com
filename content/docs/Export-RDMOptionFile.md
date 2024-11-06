---
title: 'Export-RDMOptionFile'
date: 2024-11-06
---


# Export-RDMOptionFile

## SYNOPSIS
Export a RemoteDesktopManager configuration file

## SYNTAX

```
Export-RDMOptionFile [-ClearApplicationLockInformation] [-CloudCredentials] [-Datasources <PSDataSource[]>]
 [-ForceAlwaysRetrieveNewRegistration] [-DataSourceCredentials] [-ProxySettings] [-RegistrationEmail]
 [-RegistrationKey] [-RegistrationName] [-SavedInstallationPaths] [-SavedTemplates] -Path <String>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Export a RemoteDesktopManager configuration file

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Export-RDMOptionFile -Path C:\MyPath\Filename.cfg
```

Retrieve the current configuration and export it to a cfg file at C:\MyPath\Filename.cfg

### EXAMPLE 2
```
PS C:\> Export-RDMOptionFile -Path C:\MyPath\Filename.cfg -DataSources (Get-RDMDataSource | Where-Object {$_.Name -like "Test*"})
```

Retrieve the current configuration with only the datasources whose name beginning with Test and export it to a cfg file at C:\MyPath\Filename.cfg

### EXAMPLE 3
```
PS C:\> Export-RDMOptionFile -Path C:\MyPath\Filename.cfg -ProxySettings -RegistrationName -RegistrationEmail -RegistrationKey -DataSources @()
```

Retrieve the current configuration file including the proxy settings and the registration information and without datasources and export it to a cfg file at C:\MyPath\Filename.cfg

## PARAMETERS

### -ClearApplicationLockInformation
Clear the application lock information in the configuration file.

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

### -CloudCredentials
Include the Devolutions Account credentials in the configuration file.

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

### -DataSourceCredentials
Include your data source credentials.

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

### -Datasources
PSDataSource objects, must be retrieved from Get-RDMCurrentDataSource or Get-RDMDatasource, or created via New-RDMDataSource.

```yaml
Type: PSDataSource[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForceAlwaysRetrieveNewRegistration
Include the force always new registration in the configuration file.

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

### -Path
Path where the file will be the saved.
Must be different from the current configuaration file and end with .cfg

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

### -ProxySettings
Includes your proxy settings.

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

### -RegistrationEmail
Include the registration email in the configuration file.

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

### -RegistrationKey
Registration keys are now stored in the datasource.
Avoid using this parameter.
Include the registration key in the configuration file.

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

### -RegistrationName
Include the registration name in the configuration file.

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

### -SavedInstallationPaths
Preserve your installation paths configured for the external application.

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

### -SavedTemplates
Include the local templates in the configuration file.

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

## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Export-RDMOptionFile -detailed".
For technical information, type "Get-Help Export-RDMOptionFile -full".

## RELATED LINKS
