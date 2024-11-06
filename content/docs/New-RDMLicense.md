---
title: 'New-RDMLicense'
date: 2024-11-06
---


# New-RDMLicense

## SYNOPSIS
Create a new license instance.

## SYNTAX

```
New-RDMLicense [-AutoAssign] [-Serial] <String> [-SetLicense] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a license instance.
The instance has not yet been saved.
Assign the result to a variable then call "Set-RDMLicense $s" to save the license.

## EXAMPLES

### EXAMPLE
```
PS C:\> New-RDMLicense -Serial "a-valid-serial-123" -AutoAssign -SetLicense
```

Create & save a new license that will be automatically assigned to new users.

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

### -Serial
New license serial.

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

### -SetLicense
Save the new license.

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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSLicenseInfo
## NOTES
For more information, type "Get-Help New-RDMLicense -detailed".
For technical information, type "Get-Help New-RDMLicense -full".

## RELATED LINKS
