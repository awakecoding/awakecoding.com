---
title: 'New-RDMTask'
date: 2024-11-06
---


# New-RDMTask

## SYNOPSIS
Create a new task.

## SYNTAX

```
New-RDMTask [-Comment <String>] [-Description <String>] [-DueDate <DateTime>] [-Entry] <Object>
 [-Name] <String> [-Priority <Int32>] [-SetTask] [-Status <String>] [-User <Object>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a new task.
It must have a name and be associated to an entry.
This feature is only available for the following data sources: Devolutions Server, Azure SQL, SQL Server, and SQLite.
If the data source does not support users, the parameter User will be simply ignored.
If a virtual folder is involved, the user must have the add and edit rights to save the task.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $task = New-RDMTask TaskName EntryName
```

Create a task named TaskName and associated with the entry EntryName.
This task is not saved yet, so it is stored in $task.

### EXAMPLE 2
```
PS C:\> New-RDMTask -Name ATask -Entry AnEntry -Description 'What To Do' -Priority 10 -User AUsername -Status Assigned -SetTask
```

Create a task named ATask associated with the entry AnEntry.
The task is assigned to AUsername and its status reflects it.
It has a priority of 10 and a desciption of the task.
This task is created in the data source.

### EXAMPLE 3
```
PS C:\> $task = (Get-RDMPrivateSession -Name APrivateEntry | New-RDMTask -Name ATask -Comment 'For me only' -DueDate 2022/1/1)
```

Create a task named ATask associated with the private entry APrivateEntry.
The task is not assigned and its status is the default value 'Open'.
Its due date is the fist day of the year 2022.
This task is not saved yet, so it is stored in $task.

### EXAMPLE 4
```
PS C:\> New-RDMTask -Name ATask -Entry AnEntry | Set-RDMTask -Force
```

Save a newly created task named ATask and associated with AnEntry without any confirmation prompt.

### EXAMPLE 5
```
PS C:\> $user = Get-RDMUser -Name Username; New-RDMTask -Name ATask -Entry AnEntry -User $user.Name -Status Assigned -SetTask
```

Save a newly created task named ATask and associated with AnEntry.
The task is assigned to Username and its status reflects it.

## PARAMETERS

### -Comment
Add a comment to the task.

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
Add the description to the task.

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
Add a deadline to accomplish the task.

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

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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

### -Name
Name of the task.

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

### -Priority
Set the priority of the task.
The default value is 1.

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

### -SetTask
Save the task.

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

### -Status
Set the status of the task.
By default, the status is Open.

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

### -User
Assign this user to the task.
The user can be specified with his name, his email address, his ID or a PSUserInfo.
The data source must support users.

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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection
The entry obtained from Get-RDMSession or Get-RDMPrivateSession can be piped to the parameter Entry.

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSTask
## NOTES
For more information, type "Get-Help New-RDMTask -detailed".
For technical information, type "Get-Help New-RDMTask -full".

## RELATED LINKS

[Get-RDMSession](http://127.0.0.1:1111/docs/Get-RDMSession/)

[Get-RDMPrivateSession](http://127.0.0.1:1111/docs/Get-RDMPrivateSession/)

[Get-RDMUser](http://127.0.0.1:1111/docs/Get-RDMUser/)

[New-RDMTask](http://127.0.0.1:1111/docs/New-RDMTask/)

[Remove-RDMTask](http://127.0.0.1:1111/docs/Remove-RDMTask/)

[Set-RDMTask](http://127.0.0.1:1111/docs/Set-RDMTask/)

