---
title: 'Get-RDMRole'
date: 2024-11-06
---


# Get-RDMRole

## SYNOPSIS
Retrieve the list of available roles.

## SYNTAX

```
Get-RDMRole [-CaseSensitive] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Retrieve the list of available roles for the current selected data source..

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMRole
```

Retrieves the list of available role.

### EXAMPLE 2
```
PS C:\> $list = Get-RDMRole; $list[0]
```

Retrieves the list of available roles and displays the first item.

### EXAMPLE 3
```
PS C:\> $list = Get-RDMRole; $list[1].Name = "New Name";Set-RDMRole $list[1]
```

Retrieves the list of available roles, modify the name of the second role, update the role.

## PARAMETERS

### -CaseSensitive
Case sensitive

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

### -Name
Role name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
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

### System.String
Role name

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRoleInfo[]
## NOTES
For more information, type "Get-Help Get-RDMRole -detailed".
For technical information, type "Get-Help Get-RDMRole -full".

## RELATED LINKS

[Set-RDMRole](http://127.0.0.1:1111/docs/Set-RDMRole/)

[New-RDMRole](http://127.0.0.1:1111/docs/New-RDMRole/)

[Set-RDMRoleProperty](http://127.0.0.1:1111/docs/Set-RDMRoleProperty/)

[Remove-RDMRole](http://127.0.0.1:1111/docs/Remove-RDMRole/)

