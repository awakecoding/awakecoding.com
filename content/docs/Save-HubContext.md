---
title: 'Save-HubContext'
date: 2024-11-06
---


# Save-HubContext

## SYNOPSIS
Save the current PSHubContext to a .json file at the path received

## SYNTAX

### Secure Password
```
Save-HubContext [-PSHubContext <PSHubContext>] -Path <String> [-SecurePassword] [-Force]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Password
```
Save-HubContext [-PSHubContext <PSHubContext>] -Path <String> [-Password <String>] [-Force]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Save the current PSHubContext to a .json file at the path received.
If PSHubContext is provided, save this one to a .sjon file.
If Force is provided, overwrite file if the path already exist.
If SecurePassword is provided, prompt to user to enter a password to encrypt the .json file.
If Password provided, encrypt the .json file with the password received.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Save-HubContext -Path "C:\PATH\TO\YOUR\FILE\file.json"
```

Save the current PSHubContext.

### EXAMPLE 2
```
PS C:\> Save-HubContext -Path "C:\PATH\TO\YOUR\FILE\file.json" -Password "password"
```

Save the current PSHubContext in a file protected by a password.

### EXAMPLE 3
```
PS C:\> $availCtxs = Get-HubContext; Save-HubContext -Path "C:\PATH\TO\YOUR\FILEile.json" -PSHubContext $availCtxs[2] -SecurePassword
```

Fetch all available contexts.
Save the third PSHubContext in a file protected by a password who will be filled be a prompt.

## PARAMETERS

### -Force
Overwrite the file if exist

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

### -Password
Will encrypt the file with the clear password

```yaml
Type: String
Parameter Sets: Password
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Specifies the path of the file to save Hub context.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PSHubContext
Save Hub context to file.

```yaml
Type: PSHubContext
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SecurePassword
Will prompt the password to encrypt the file with

```yaml
Type: SwitchParameter
Parameter Sets: Secure Password
Aliases:

Required: True
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

### None
## NOTES
For more information, type "Get-Help Save-HubContext -detailed".
For technical information, type "Get-Help Save-HubContext -full".

## RELATED LINKS
