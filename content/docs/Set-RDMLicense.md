---
title: 'Set-RDMLicense'
date: 2024-11-06
---


# Set-RDMLicense

## SYNOPSIS
Save/set the license.

## SYNTAX

```
Set-RDMLicense [-AutoAssign] [-License] <PSLicenseInfo> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Save/set the license.
License must be first fetch via license property of the Get-RDMLicense cmdlet or via the New-RDMLicense result.

## EXAMPLES

### EXAMPLE
```
PS C:\> $license = New-RDMLicense -Name "New License" ;Set-License $license
```

Create & save new license.

## PARAMETERS

### -AutoAssign
Auto assign new users to automatically provide the Remote Desktop Manager serial to all newly created users.
For others serials, it will be ignored.

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

### -License
License object, must be retrieved from Get-RDMLicense or created via New-RDMLicense.

```yaml
Type: PSLicenseInfo
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
For more information, type "Get-Help Set-RDMLicense -detailed".
For technical information, type "Get-Help Set-RDMLicense -full".

## RELATED LINKS
