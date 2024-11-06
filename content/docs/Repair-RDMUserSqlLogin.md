---
title: 'Repair-RDMUserSqlLogin'
date: 2024-11-06
---


# Repair-RDMUserSqlLogin

## SYNOPSIS
Fix the SQL login of an existing user

## SYNTAX

```
Repair-RDMUserSqlLogin [-InputObject] <PSUserInfo> [-PassThru] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Fix the SQL login of an existing user, applicable to Microsoft Azure SQL or Microsoft SQL Server data sources.
Ensure the user's authentication type aligns with one of the following ServerUserType property values of the PSUserInfo object: SqlServer (2), AzureAD (8), or Okta (10).

## EXAMPLES

### EXAMPLE
```
PS C:\> Get-RDMUser -Name 'myUsername' | Repair-RDMUserSqlLogin
```

Fix the SQL login of the user named 'myUserName'

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

### -InputObject
User needing SQL login fixing

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

### -PassThru
Return the PSUserInfo object after the SQL login fix

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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSUserInfo
User object obtained from Get-RDMUser

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSUserInfo
## NOTES
For more information, type "Get-Help Repair-RDMUserSqlLogin -detailed".
For technical information, type "Get-Help Repair-RDMUserSqlLogin -full".

## RELATED LINKS

[Get-RDMUser](http://127.0.0.1:1111/docs/Get-RDMUser/)

