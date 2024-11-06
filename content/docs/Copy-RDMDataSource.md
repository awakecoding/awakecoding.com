---
title: 'Copy-RDMDataSource'
date: 2024-11-06
---


# Copy-RDMDataSource

## SYNOPSIS
Copy an existing data source

## SYNTAX

### Id
```
Copy-RDMDataSource [-ID] <Guid> [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### InputObject
```
Copy-RDMDataSource [-InputObject] <PSDataSource> [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Copy an existing data source.
The user can be prompted if the data source requires an MFA.
On a Windows OS, a policy can disable this cmdlet.
In case of a SQL server with a custom login, it is possible to connect using different credentials.

## EXAMPLES

### EXAMPLE
```
PS C:\> Get-RDMDataSource -Name 'CustomSQL' | Copy-RDMDataSource | Set-RDMCurrentDataSource
```

Connect to a copy of the data source 'CustomSQL'.
If the user is prompted for the credentials, different credentials can be entered.

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

### -ID
ID of the data source to copy

```yaml
Type: Guid
Parameter Sets: Id
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
PSDataSource obtained from Get-RDMDataSource to copy

```yaml
Type: PSDataSource
Parameter Sets: InputObject
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSDataSource
Data source object to copy obtained from Get-RDMDataSource.

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSDataSource
## NOTES
For more information, type "Get-Help Copy-RDMDataSource -detailed".
For technical information, type "Get-Help Copy-RDMDataSource -full".

## RELATED LINKS

[Get-RDMDataSource](http://127.0.0.1:1111/docs/Get-RDMDataSource/)

[Set-RDMDataSource](http://127.0.0.1:1111/docs/Set-RDMDataSource/)

