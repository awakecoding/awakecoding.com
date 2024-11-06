---
title: 'Set-RDMTask'
date: 2024-11-06
---


# Set-RDMTask

## SYNOPSIS
Save or update a task.

## SYNTAX

```
Set-RDMTask [-Comment <String>] [-Description <String>] [-DueDate <DateTime>] [-Force] [-Name <String>]
 [-Priority <Int32>] [-Status <String>] [-Task] <PSTask> [-UnassignUser] [-User <Object>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Save or update a task of the current data source.
This feature is only available for the following data sources: Devolutions Server, Azure SQL, SQL Server, and SQLite.
If the data source does not support users, the parameter User will be simply ignored.
If a virtual folder is involved, the user must have the add and edit rights to save the tasks.
To modify fields, this cmdlet parameters can be used or the PSTask can be modified directly.
The confirmation impact (ConfirmImpact) is low.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMTask -Name ATask | Set-RDMTask -Comment "Task completed" -Status Closed
```

Add the comment "Task completed" to task ATask and close it.
If the name is not unique, all tasks named ATask will have the modifications.

### EXAMPLE 2
```
PS C:\> New-RDMTask -Name ATask -Entry AnEntry | Set-RDMTask -Force
```

Save a newly created task named ATask and associated with AnEntry without any confirmation prompt.

### EXAMPLE 3
```
PS C:\> $user = Get-RDMUser -Name AUser; Get-RDMTask -Status Assigned -User $user | Set-RDMTask -UnassignUser
```

Unassign all the tasks assigned the user AUser.

### EXAMPLE 4
```
PS C:\> $task = Get-RDMTask -Name ATask; $task.Task.CustomField1 = "Whatever"; Set-RDMTask $task
```

Store the uniquely named task ATask in $task.
Add a value to the CustomField1 and save the modification using the only positional parameter.

### EXAMPLE 5
```
PS C:\> Get-RDMTask -Name ATask | Set-RDMTask $task -WhatIf -Verbose -Description 'NewDesc' -DueDate 2023/1/1 -Priority 3
```

Using the WhatIf and Verbose parameters, it will allow to determine if the task is created or updated and where exactly (data source name \> entry name \> task name).
No modification will happen.

## PARAMETERS

### -Comment
Modify the comment of the task.

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

### -Description
Modify the description of the task.

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

### -DueDate
Specify the deadline to accomplish the task.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

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

### -Name
New name for the task.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Priority
Modify the priority of the task.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Status
Modify the status of the task.

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

### -UnassignUser
Remove the user assigned to the task.

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

### -User
Assign this user to the task.
The user can be specified with his name, his email address, his ID or a PSUserInfo.

```yaml
Type: Object
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSTask
The task obtained from Get-RDMTask can be piped to the parameter Task.

## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Set-RDMTask -detailed".
For technical information, type "Get-Help Set-RDMTask -full".

## RELATED LINKS

[Get-RDMUser](http://127.0.0.1:1111/docs/Get-RDMUser/)

[New-RDMTask](http://127.0.0.1:1111/docs/New-RDMTask/)

[Remove-RDMTask](http://127.0.0.1:1111/docs/Remove-RDMTask/)

[Set-RDMTask](http://127.0.0.1:1111/docs/Set-RDMTask/)

