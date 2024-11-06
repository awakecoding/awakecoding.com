---
title: 'Set-RDMSQLiteDatasourcePassword'
date: 2024-11-06
---


# Set-RDMSQLiteDatasourcePassword

## SYNOPSIS
Modify or clear your data source password

## SYNTAX

### NewPassword
```
Set-RDMSQLiteDatasourcePassword [-DataSource] <PSDataSource> [-NewPassword] <SecureString>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### NoPassword
```
Set-RDMSQLiteDatasourcePassword [-DataSource] <PSDataSource> [-NoPassword]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
## EXAMPLES

### EXAMPLE
```
PS C:\> $dataSource = Get-RDMDataSource -Name MySqliteDataSource; Set-RDMSQLiteDatasourcePassword -DataSource $dataSource -NewPassword (ConvertTo-SecureString -AsPlainText "MyPassword" -Force)
```

Modify the password of the data source named MySqliteDataSource to MyPassword

## PARAMETERS

### -DataSource
Specifies the SQLite data source

```yaml
Type: PSDataSource
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

### -NewPassword
New data source password.

```yaml
Type: SecureString
Parameter Sets: NewPassword
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoPassword
Set no password.

```yaml
Type: SwitchParameter
Parameter Sets: NoPassword
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

### None
## NOTES
For more information, type "Get-Help Set-RDMSQLiteDatasourcePassword -detailed".
For technical information, type "Get-Help Set-RDMSQLiteDatasourcePassword -full".

## RELATED LINKS
