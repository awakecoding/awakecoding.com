---
title: 'Clear-RDMActivityLogs'
date: 2024-11-06
---


# Clear-RDMActivityLogs

## SYNOPSIS
Clean up the activity logs before the specified date

## SYNTAX

```
Clear-RDMActivityLogs -Before <DateTime> [-Scope <DeleteHistoryScope>] [-Filename <String>]
 [-IncludeAdministrationLogs] [-NoClobber] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Clean up the activity logs based before the specified date on the specified scope.
By using the 'Filename' parameter, a backup file will be generated.
To use this cmdlet, the user must be a vault owner or an administrator.
In the last case, the scope can be larger such as all vaults.

## EXAMPLES

### EXAMPLE
```
PS C:\> $date = Get-Date -Date 2024/01/01
PS C:\> Clear-RDMActivityLogs -Before $date -Scope AllVaults -Filename 'C:\my\path\backup-activitylogs-prior-2024.xml'
```

Clean up the activity logs prior to the year 2024 for all entries of the current vault and backup the deleted logs in the specified file

## PARAMETERS

### -Before
Delete everything prior to this date

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filename
XML backup deleted logs file.
If not used, no backup will be generated.

```yaml
Type: String
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

### -IncludeAdministrationLogs
Include administration logs.
The data source must support the administration logs and the user must be an administrator.

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

### -Scope
Scope if the data source supports vaults

```yaml
Type: DeleteHistoryScope
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
For more information, type "Get-Help Clear-RDMActivityLogs -detailed".
For technical information, type "Get-Help Clear-RDMActivityLogs -full".

## RELATED LINKS
