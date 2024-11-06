---
title: 'Set-RDMDatasourceMasterKey'
date: 2024-11-06
---


# Set-RDMDatasourceMasterKey

## SYNOPSIS
Modify or clear your data source master key

## SYNTAX

### NewMasterKey
```
Set-RDMDatasourceMasterKey [-DataSource] <PSDataSource> [-NewMasterKey] <SecureString>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### NoMasterKey
```
Set-RDMDatasourceMasterKey [-DataSource] <PSDataSource> [-NoMasterKey] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
## EXAMPLES

### EXAMPLE
```
PS C:\> $dataSource = Get-RDMDataSource -Name MyDataSource; Set-RDMDatasourceMasterKey -DataSource $dataSource -NewMaster (ConvertTo-SecureString -AsPlainText "MyMasterKey" -Force)
```

Modify the master key of the data source named MyDataSource to MyMasterKey

## PARAMETERS

### -DataSource
Specifies the data source to change the master key

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

### -NewMasterKey
New data source master key.

```yaml
Type: SecureString
Parameter Sets: NewMasterKey
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoMasterKey
Set no master key.

```yaml
Type: SwitchParameter
Parameter Sets: NoMasterKey
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
For more information, type "Get-Help Set-RDMDatasourceMasterKey -detailed".
For technical information, type "Get-Help Set-RDMDatasourceMasterKey -full".

## RELATED LINKS
