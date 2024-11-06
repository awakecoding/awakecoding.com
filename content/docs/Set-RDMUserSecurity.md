---
title: 'Set-RDMUserSecurity'
date: 2024-11-06
---


# Set-RDMUserSecurity

## SYNOPSIS
Assign/set user security settings.

## SYNTAX

```
Set-RDMUserSecurity [-User] <PSUserInfo> [[-OfflineMode] <String>] [[-AllowDragAndDrop] <Boolean>] [-SetUser]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Assign/set user security settings.

## EXAMPLES

### EXAMPLE
```
PS C:\> Set-RDMUserSecurity -user $user -AllowRevealPassword $false -OfflineMode "Read/Write"
```

Disallow the user to reveal password and set offline mode to read/write

## PARAMETERS

### -AllowDragAndDrop
Allows the user to move the sessions using drag-and-drop from other applications.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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

### -OfflineMode
Allows the user to enable the Offline Mode on the data sources.
Choose between:
Disabled  : no offline cache allowed for that user
Cache : cache allowed for that user
ReadOnly  : a read-only cache is allowed for Advanced Data Sources.
ReadWrite : an advanced cache, with change synchronization, is allowed for Advanced Data Sources.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetUser
Set user

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
User object, must be retrieved from Get-RDMUser or created via New-RDMUser.

```yaml
Type: PSUserInfo
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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
For more information, type "Get-Help Set-RDMUserSecurity -detailed".
For technical information, type "Get-Help Set-RDMUserSecurity -full".

## RELATED LINKS

[Get-RDMUser](http://127.0.0.1:1111/docs/Get-RDMUser/)

[New-RDMUser](http://127.0.0.1:1111/docs/New-RDMUser/)

[New-RDMUser](http://127.0.0.1:1111/docs/New-RDMUser/)

[Remove-RDMUser](http://127.0.0.1:1111/docs/Remove-RDMUser/)

