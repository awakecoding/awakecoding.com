---
title: 'Get-RDMTask'
date: 2024-11-06
---


# Get-RDMTask

## SYNOPSIS
Retrieve the list of tasks of the current data source.

## SYNTAX

```
Get-RDMTask [-CaseSensitive] [-CreationDateEnd <DateTime>] [-CreationDateStart <DateTime>] [-Due <DateFilter>]
 [-DueDateEnd <DateTime>] [-DueDateStart <DateTime>] [-Entry <Object>] [-LiteralName <String[]>]
 [-Name <String[]>] [-Status <TodoStatus[]>] [-User <Object[]>] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Allows to search tasks with differents parameters on the user's main and private vaults.
This feature is only available for the following data sources: Devolutions Server, Azure SQL, SQL Server, and SQLite.
If the data source does not support users, the parameter User will be simply ignored.
If a virtual folder is involved, the user must have the add and edit rights to obtain the tasks.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $tasks = Get-RDMTask -Entry AnEntry -CaseSensitive
```

Retrieves the tasks of the current data source associated with the entry AnEntry (case sensitive) and stores it in the variable $tasks.

### EXAMPLE 2
```
PS C:\> Get-RDMTask -Name Task* -Due Today -Status Open, Assigned, InProgress, Default
```

Obtain all the tasks of the current data source that are due Today and are still active.

### EXAMPLE 3
```
PS C:\> Get-RDMTask -CreationDateStart 2022/1/1 -CreationDateEnd 2022/2/1 -DueDateStart 2022/2/1 -DueDateEnd 2022/3/1
```

Obtain all the tasks of the current data source that are due Today and are still active.

### EXAMPLE 4
```
PS C:\> $user = Get-RDMUser -Name AUser; Get-RDMTask -Status Assigned -User $user | Set-RDMTask -UnassignUser
```

Unassign all the tasks assigned the user AUser.

## PARAMETERS

### -CaseSensitive
Case sensitive search when searching the name of the entry, task or user.

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

### -CreationDateEnd
The upper bound for the task's creation date.

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

### -CreationDateStart
The lower bound for the task's creation date.

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

### -Due
Filter the tasks based on their due date.

```yaml
Type: DateFilter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DueDateEnd
The upper bound for a custom due date.

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

### -DueDateStart
The lower bound for a custom due date.

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

### -Entry
Entry the task is assigned to.
It can be specified by ID, by name or by PSConnection.
Entries in the private vault are accessible.
For virtual folders, the add and edit rights are required to get the tasks.

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

### -LiteralName
Name of the task.
No characters are interpreted as wildcards.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Name of the task.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Status
Filter the tasks based on the specified status.
Multiple status are equivalent to an OR condition.

```yaml
Type: TodoStatus[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -User
Task assigned to those user.
The users can be specified with their name, their email address, their ID or their PSUserInfo.

```yaml
Type: Object[]
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

### None
## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSTask
### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSTask[]
## NOTES
For more information, type "Get-Help Get-RDMTask -detailed".
For technical information, type "Get-Help Get-RDMTask -full".

## RELATED LINKS

[Get-RDMSession](http://127.0.0.1:1111/docs/Get-RDMSession/)

[Get-RDMPrivateSession](http://127.0.0.1:1111/docs/Get-RDMPrivateSession/)

[Get-RDMUser](http://127.0.0.1:1111/docs/Get-RDMUser/)

[New-RDMTask](http://127.0.0.1:1111/docs/New-RDMTask/)

[Remove-RDMTask](http://127.0.0.1:1111/docs/Remove-RDMTask/)

[Set-RDMTask](http://127.0.0.1:1111/docs/Set-RDMTask/)

