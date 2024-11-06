---
title: 'Invoke-RDMLoadFromInventorySession'
date: 2024-11-06
---


# Invoke-RDMLoadFromInventorySession

## SYNOPSIS
Invoke a Load from inventory action.

## SYNTAX

```
Invoke-RDMLoadFromInventorySession [[-Credential] <PSCredential>] [-Session] <PSConnection[]>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
## EXAMPLES

### EXAMPLE
```
PS C:\> $list = Get-RDMSession; Invoke-RDMLoadFromInventorySession -Session $list[0]; Set-RDMSession -Session $list[0] -Refresh
```

Invoke a Load from inventory on the first session in the list.

## PARAMETERS

### -Credential
PSCredential object.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
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

### -Session
PSConnection object, must be retrieved from Get-RDMSession or created via New-RDMSession.

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
For more information, type "Get-Help Invoke-RDMLoadFromInventorySession -detailed".
For technical information, type "Get-Help Invoke-RDMLoadFromInventorySession -full".

## RELATED LINKS

[Invoke-RDMUnparentSession](http://127.0.0.1:1111/docs/Invoke-RDMUnparentSession/)

