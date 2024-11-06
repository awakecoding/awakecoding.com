---
title: 'Set-RDMSessionDocumentation'
date: 2024-11-06
---


# Set-RDMSessionDocumentation

## SYNOPSIS
Set the documentation on a session.

## SYNTAX

### NameHandbook (Default)
```
Set-RDMSessionDocumentation [-AsLastPage] [-Force] [-Handbook] <PSHandbook> [[-Name] <String>] [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### IDHandbook
```
Set-RDMSessionDocumentation [-AsLastPage] [-Force] [-Handbook] <PSHandbook> [-ID] <Guid> [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### SessionHandbook
```
Set-RDMSessionDocumentation [-AsLastPage] [-Force] [-Handbook] <PSHandbook> [-Refresh]
 [-Session] <PSConnection> [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

### IDDefaultPage
```
Set-RDMSessionDocumentation [[-DefaultPage] <String>] [-Force] [-ID] <Guid> [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### NameDefaultPage
```
Set-RDMSessionDocumentation [[-DefaultPage] <String>] [-Force] [[-Name] <String>] [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### SessionDefaultPage
```
Set-RDMSessionDocumentation [[-DefaultPage] <String>] [-Force] [-Refresh] [-Session] <PSConnection>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Must have the right to add and edit.
Documentation must be first fetch via the Get-RDMSessionDocumentation cmdlet.
If the documentation comes from another session, all pages will be created.
Only before updating pages will the user be prompted to confirm.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMRootSession | Get-RDMSessionDocumentation | Set-RDMSessionDocumentation -Session (Get-RDMSession -Name "ASession")
```

Copy the documentation from the current data source's root to the session "ASession".

### EXAMPLE 2
```
PS C:\> $sess = Get-RDMSession -Name "ASession"; Get-RDMDataSource -Name "AnotherDataSource" | Set-RDMCurrentDataSource; Get-RDMRootSession | Get-RDMSessionDocumentation | Set-RDMSessionDocumentation -Session $sess)
```

Copy the documentation from the root session of "AnotherDataSource" to the session "ASession" of the previous data source.

### EXAMPLE 3
```
PS C:\> Set-RDMSessionDocumentation -Name ASession -DefaultPage NewDefaultPage -Force)
```

Change the default documentation page of the session ASession to NewDefaultPage.

## PARAMETERS

### -AsLastPage
Append the created pages to the end.

```yaml
Type: SwitchParameter
Parameter Sets: NameHandbook, IDHandbook, SessionHandbook
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DefaultPage
Define a new default page in the documentation.

```yaml
Type: String
Parameter Sets: IDDefaultPage, NameDefaultPage, SessionDefaultPage
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Update the documentation without confirmation.

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

### -Handbook
Specifies the documentation to set.

```yaml
Type: PSHandbook
Parameter Sets: NameHandbook, IDHandbook, SessionHandbook
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -ID
Current data source session\`s ID where the documentation will be set.

```yaml
Type: Guid
Parameter Sets: IDHandbook, IDDefaultPage
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Name
Current data source session\`s name where the documentation will be set.

```yaml
Type: String
Parameter Sets: NameHandbook, NameDefaultPage
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Refresh
Send refresh notification to Remote Desktop Manager application.

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

### -Session
Session where the documentation will be set.

```yaml
Type: PSConnection
Parameter Sets: SessionHandbook, SessionDefaultPage
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

### None
## OUTPUTS

### None
## NOTES
For more information, type "Get-Help Set-RDMSessionDocumentation -detailed".
For technical information, type "Get-Help Set-RDMSessionDocumentation -full".

## RELATED LINKS

[Get-RDMRootSession](http://127.0.0.1:1111/docs/Get-RDMRootSession/)

[Get-RDMSession](http://127.0.0.1:1111/docs/Get-RDMSession/)

[Get-RDMSessionDocumentation](http://127.0.0.1:1111/docs/Get-RDMSessionDocumentation/)

