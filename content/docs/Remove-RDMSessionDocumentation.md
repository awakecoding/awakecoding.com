---
title: 'Remove-RDMSessionDocumentation'
date: 2024-11-06
---


# Remove-RDMSessionDocumentation

## SYNOPSIS
Remove the documentation of a session.

## SYNTAX

### NamePage (Default)
```
Remove-RDMSessionDocumentation [-Force] [[-Name] <String>] [-Page] <String> [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### IDAll
```
Remove-RDMSessionDocumentation [-All] [-Force] [-ID] <Guid> [-Refresh] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### NameAll
```
Remove-RDMSessionDocumentation [-All] [-Force] [[-Name] <String>] [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### SessionAll
```
Remove-RDMSessionDocumentation [-All] [-Force] [-Refresh] [-Session] <PSConnection>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### IDHandbook
```
Remove-RDMSessionDocumentation [-Force] [-Handbook] <PSHandbook> [-ID] <Guid> [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### NameHandbook
```
Remove-RDMSessionDocumentation [-Force] [-Handbook] <PSHandbook> [[-Name] <String>] [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### SessionHandbook
```
Remove-RDMSessionDocumentation [-Force] [-Handbook] <PSHandbook> [-Refresh] [-Session] <PSConnection>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### IDPage
```
Remove-RDMSessionDocumentation [-Force] [-ID] <Guid> [-Page] <String> [-Refresh]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### SessionPage
```
Remove-RDMSessionDocumentation [-Force] [-Page] <String> [-Refresh] [-Session] <PSConnection>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Must have the right to delete.
Three possiblities exist to remove the documentation of a session.The All switch is used to remove all documentation.
The Handbook parameter uses documentation fetched via the Get-RDMDocumentation cmdlet.
The Name parameter allows to delete all pages named the value entered.
The user will be prompted to confirm the delete.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMRootSession | Remove-RDMSessionDocumentation -All
```

Remove all documentation in the root session of the current data source.
The user will be prompted.

### EXAMPLE 2
```
PS C:\> Remove-RDMSessionDocumentation -Name "ASession" -Page "APage" -Force
```

Remove documentation page "APage" from the session "ASession" without prompting the user.

### EXAMPLE 3
```
PS C:\ $id = [Guid]"00000000-0000-0000-0000-000000000000"; $doc = Get-RDMSessionDocumentation -ID $id; $doc.Pages = ($doc.Pages | Where-Object { $_.Default -ne $true }); Remove-RDMSessionDocumentation -ID $id -Handbook $doc -Refresh
```

Remove all documentation pages except the default one from the session with ID = 00000000-0000-0000-0000-000000000000 of the current data source.
The user will be prompted before deleting a page.

## PARAMETERS

### -All
Delete all existing documentation of the session.

```yaml
Type: SwitchParameter
Parameter Sets: IDAll, NameAll, SessionAll
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Delete the documentation without confirmation.

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
Specifies the documentation to delete.

```yaml
Type: PSHandbook
Parameter Sets: IDHandbook, NameHandbook, SessionHandbook
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -ID
Current data source session\`s ID from which to delete the documentation.

```yaml
Type: Guid
Parameter Sets: IDAll, IDHandbook, IDPage
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Name
Current data source session\`s name from which to extract the documentation.

```yaml
Type: String
Parameter Sets: NamePage, NameAll, NameHandbook
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Page
Specifies the documentation page to delete.

```yaml
Type: String
Parameter Sets: NamePage, IDPage, SessionPage
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
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
Session where the documentation will be deleted.

```yaml
Type: PSConnection
Parameter Sets: SessionAll, SessionHandbook, SessionPage
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
For more information, type "Get-Help Remove-RDMSessionDocumentation -detailed".
For technical information, type "Get-Help Remove-RDMSessionDocumentation -full".

## RELATED LINKS

[Get-RDMRootSession](http://127.0.0.1:1111/docs/Get-RDMRootSession/)

[Get-RDMSession](http://127.0.0.1:1111/docs/Get-RDMSession/)

[Get-RDMSessionDocumentation](http://127.0.0.1:1111/docs/Get-RDMSessionDocumentation/)

