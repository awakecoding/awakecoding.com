---
title: 'Set-RDMUserProperty'
date: 2024-11-06
---


# Set-RDMUserProperty

## SYNOPSIS
Set the value of property given to a user.

## SYNTAX

```
Set-RDMUserProperty [-Property] <String> [-User] <PSUserInfo> [-Value] <Object>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Set the value of property given to a user.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Set-RDMuserProperty -User "$user" -Property "Description" -Value "My New Description"
```

Set the description value for the user given.

### EXAMPLE 2
```
PS C:\> $list = Get-RDMUser; Set-RDMUserProperty -User $list[1] -Property "Description" -Value "My description"
```

Retrieves the list of available users and then sets the description value of the the second element in the list.

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

### -Property
Property to set.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -User
Specifies the GUID of the user to get the password from.

Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

```yaml
Type: PSUserInfo
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Value
New value.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
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
For more information, type "Get-Help Set-RDMUserProperty -detailed".
For technical information, type "Get-Help Set-RDMUserProperty -full".

## RELATED LINKS

[Get-RDMUser](http://127.0.0.1:1111/docs/Get-RDMUser/)

[New-RDMUser](http://127.0.0.1:1111/docs/New-RDMUser/)

[New-RDMUser](http://127.0.0.1:1111/docs/New-RDMUser/)

[Remove-RDMUser](http://127.0.0.1:1111/docs/Remove-RDMUser/)

