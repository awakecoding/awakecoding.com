---
title: 'Invoke-RDMUnparentSession'
date: 2024-11-06
---


# Invoke-RDMUnparentSession

## SYNOPSIS
Invoke a refactoring action to move out a connection under a parent connection.

## SYNTAX

```
Invoke-RDMUnparentSession [-Refresh] [-Session] <PSConnection[]> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Move out a session under a parent session.

## EXAMPLES

### EXAMPLE
```
PS C:\> $list = Get-RDMSession; $parent = $list[0]; Invoke-RDMUnparentSession -Session $parent.SubConnections -Refresh
```

The subconnections in the session in the variable $parent are unparented.

## PARAMETERS

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
PSSession object, must be retrieved from Get-RDMSession or created via New-RDMSession that you want to unparented.

```yaml
Type: PSConnection[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
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
For more information, type "Get-Help Invoke-RDMUnparentSession -detailed".
For technical information, type "Get-Help Invoke-RDMUnparentSession -full".

## RELATED LINKS

[Invoke-RDMUnparentSession](http://127.0.0.1:1111/docs/Invoke-RDMUnparentSession/)

