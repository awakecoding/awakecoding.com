---
title: 'New-RDMDataSource'
date: 2024-11-06
---


# New-RDMDataSource

## SYNOPSIS
Create a new datasource instance.

## SYNTAX

### SQLiteDataSource
```
New-RDMDataSource -Database <String> -Name <String> [-Password <SecureString>] [-SetDatasource] [-SQLite]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### SQLServerDataSource
```
New-RDMDataSource -Database <String> -Name <String> -Password <SecureString> -Server <String> [-SetDatasource]
 [-SQLServer] [-TrustServerCertificate <DefaultBoolean>] -Username <String>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### SQLServerDataSourceIntegratedSecurity
```
New-RDMDataSource -Database <String> [-IntegratedSecurity] -Name <String> -Server <String> [-SetDatasource]
 [-SQLServer] [-TrustServerCertificate <DefaultBoolean>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### SQLServerDataSourceUserEditable
```
New-RDMDataSource -Database <String> -Name <String> [-SetDatasource] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### SQLServerDataSourceDontSavePassword
```
New-RDMDataSource -Database <String> [-DontSavePassword] -Name <String> -Server <String> [-SetDatasource]
 [-SQLServer] [-TrustServerCertificate <DefaultBoolean>] [-UserEditable] [-Username <String>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### DODDataSource
```
New-RDMDataSource [-DOD] -Filename <String> -Name <String> [-ScriptingApplicationPassword <String>]
 [-ScriptingTenantID <String>] [-SetDatasource] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### DropboxDataSource
```
New-RDMDataSource [-Dropbox] -Filename <String> -Name <String> [-SetDatasource]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### DVLSDataSource
```
New-RDMDataSource [-DVLS] -Name <String> [-Password <SecureString>] [-ScriptingApplicationPassword <String>]
 [-ScriptingTenantID <String>] -Server <String> [-SetDatasource] [-Username <String>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### DVLSDataSourceIntegratedSecurity
```
New-RDMDataSource [-DVLS] [-IntegratedSecurity] -Name <String> -Server <String> [-SetDatasource]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### XMLDataSource
```
New-RDMDataSource -Filename <String> -Name <String> [-SetDatasource] [-XML]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### MySQLDataSource
```
New-RDMDataSource -Hostname <String> [-MySQL] -Name <String> -Schema <String> [-SetDatasource]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### HubBusinessDataSource
```
New-RDMDataSource [-HubBusiness] -Name <String> [-ScriptingApplicationPassword <String>]
 [-ScriptingTenantID <String>] -Server <String> [-SetDatasource] [-Username <String>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### HubPersonalDataSource
```
New-RDMDataSource [-HubPersonal] -Name <String> [-SetDatasource] [-Username <String>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a new datasource instance.
The instance has not yet been saved.
Assign the result to a variable then call "Set-RDMDatasource $s" to save the datasource.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Database
Indicates the filename of the SQLite database (.db).

```yaml
Type: String
Parameter Sets: SQLiteDataSource, SQLServerDataSource, SQLServerDataSourceIntegratedSecurity, SQLServerDataSourceUserEditable, SQLServerDataSourceDontSavePassword
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DOD
Create a Devolutions Online Drive data source

```yaml
Type: SwitchParameter
Parameter Sets: DODDataSource
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DontSavePassword
Don't save the password in the SQL Server data source settings

```yaml
Type: SwitchParameter
Parameter Sets: SQLServerDataSourceDontSavePassword
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Dropbox
Create a Dropbox data source

```yaml
Type: SwitchParameter
Parameter Sets: DropboxDataSource
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DVLS
Create a DVLS data source

```yaml
Type: SwitchParameter
Parameter Sets: DVLSDataSource, DVLSDataSourceIntegratedSecurity
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filename
XML Filename

```yaml
Type: String
Parameter Sets: DODDataSource, DropboxDataSource, XMLDataSource
Aliases:

Required: True
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

### -Hostname
Not supported anymore

```yaml
Type: String
Parameter Sets: MySQLDataSource
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HubBusiness
Create a Hub Business data source

```yaml
Type: SwitchParameter
Parameter Sets: HubBusinessDataSource
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HubPersonal
Create a Hub Personal data source

```yaml
Type: SwitchParameter
Parameter Sets: HubPersonalDataSource
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IntegratedSecurity
Specify to use Windows Integrated Authentication for authenticating to the data source

```yaml
Type: SwitchParameter
Parameter Sets: SQLServerDataSourceIntegratedSecurity, DVLSDataSourceIntegratedSecurity
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MySQL
Not supported anymore

```yaml
Type: SwitchParameter
Parameter Sets: MySQLDataSource
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Name of the data source.

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

### -Password
Password used to encrypt the SQLite database (.db).

```yaml
Type: SecureString
Parameter Sets: SQLiteDataSource, DVLSDataSource
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: SecureString
Parameter Sets: SQLServerDataSource
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Schema
Not supported anymore.

```yaml
Type: String
Parameter Sets: MySQLDataSource
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScriptingApplicationPassword
Application password used to access the Devolutions Password Server instance.

```yaml
Type: String
Parameter Sets: DODDataSource, DVLSDataSource, HubBusinessDataSource
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScriptingTenantID
Application ID used to access the Devolutions Password Server instance.

```yaml
Type: String
Parameter Sets: DODDataSource, DVLSDataSource, HubBusinessDataSource
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Server
Name of Devolutions Password Server instance.

```yaml
Type: String
Parameter Sets: SQLServerDataSource, SQLServerDataSourceIntegratedSecurity, SQLServerDataSourceDontSavePassword, DVLSDataSource, DVLSDataSourceIntegratedSecurity, HubBusinessDataSource
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetDatasource
Save the data source.

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

### -SQLite
Create a SQLite data source

```yaml
Type: SwitchParameter
Parameter Sets: SQLiteDataSource
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SQLServer
Create a SQL Server data source

```yaml
Type: SwitchParameter
Parameter Sets: SQLServerDataSource, SQLServerDataSourceIntegratedSecurity, SQLServerDataSourceDontSavePassword
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TrustServerCertificate
Trust the server's self-signed certificate

```yaml
Type: DefaultBoolean
Parameter Sets: SQLServerDataSource, SQLServerDataSourceIntegratedSecurity, SQLServerDataSourceDontSavePassword
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserEditable
Editable username

```yaml
Type: SwitchParameter
Parameter Sets: SQLServerDataSourceDontSavePassword
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Username
Username to access the Devolutions Password Server instance

```yaml
Type: String
Parameter Sets: SQLServerDataSource
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: SQLServerDataSourceDontSavePassword, DVLSDataSource, HubBusinessDataSource, HubPersonalDataSource
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -XML
Create a XML data source

```yaml
Type: SwitchParameter
Parameter Sets: XMLDataSource
Aliases:

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

### None
## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSDataSource
## NOTES
For more information, type "Get-Help New-RDMDataSource -detailed".
For technical information, type "Get-Help New-RDMDataSource -full".

## RELATED LINKS

[Set-RDMDataSource](http://127.0.0.1:1111/docs/Set-RDMDataSource/)

