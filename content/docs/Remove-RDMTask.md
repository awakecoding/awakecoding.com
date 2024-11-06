---
title: 'Remove-RDMTask'
date: 2024-11-06
---


# Remove-RDMTask

## SYNOPSIS
Delete a task

## SYNTAX

```
Remove-RDMTask [-Force] [-Task] <PSTask> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Delete a task of the current data source.
The deletion consists of setting the status to Deleted.
The confirm impact level is low.
This feature is only available for the following data sources: Devolutions Server, Azure SQL, SQL Server, and SQLite.

## EXAMPLES

### EXAMPLE 1
```
Get-RDMTask | Remove-RDMTask -Force
```

Set the all tasks' status to Deleted without confirmation prompt.

### EXAMPLE 2
```
Get-RDMTask -Due LastMonth | Where-Object AssignedToUserID -eq 00000000-0000-0000-0000-000000000000 | Remove-RDMTask -Force
```

Remove all the tasks that were due last month and are still unassigned without a confirmation prompt.
The empty guid means it is unassigned.

### EXAMPLE 3
```
Get-RDMTask -Status Done, Closed | Remove-RDMTask -Force
```

Remove all tasks that are done or closed without a confirmation prompt.

## PARAMETERS

### -Force
The task will be saved or created without confirmation.

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

### -Task
Task to add or modify.

```yaml
Type: PSTask
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSTask
The task obtained from Get-RDMTask can be piped to the parameter Task.

## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Remove-RDMTask -detailed".
For technical information, type "Get-Help Remove-RDMTask -full".

## RELATED LINKS

[New-RDMTask](http://127.0.0.1:1111/docs/New-RDMTask/)

[Remove-RDMTask](http://127.0.0.1:1111/docs/Remove-RDMTask/)

[Set-RDMTask](http://127.0.0.1:1111/docs/Set-RDMTask/)

