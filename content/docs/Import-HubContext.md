---
title: 'Import-HubContext'
date: 2024-11-06
---


# Import-HubContext

## SYNOPSIS
Import a PSHubContext from a .json file at the path received.

## SYNTAX

### Secure Password
```
Import-HubContext -Path <String> [-SecurePassword] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Password
```
Import-HubContext -Path <String> [-Password <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Import a PSHubContext from a .json file at the path received.
If SecurePassword is provided, prompt to enter a password to decrypt the .json file.
If Password provided, decrypt the .json file with the password received.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Import-HubContext -Path "C:\PATH\TO\YOUR\FILE\file.json"
```

Import a standard PSHubContext.

### EXAMPLE 2
```
PS C:\> Import-HubContext -Path "C:\PATH\TO\YOUR\FILEile.json" -Password "password"
```

Import the PSHubContext from a file protected by a password.

### EXAMPLE 3
```
PS C:\> Import-HubContext -Path "C:\PATH\TO\YOUR\FILEile.json" -SecurePassword
```

Import the PSHubContext from a file protected by a password.
The user will be prompted for the password.

## PARAMETERS

### -Password
Will decrypt the file with the clear password

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
The file path of Hub context to import.

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

### -SecurePassword
Will prompt the password to decrypt the file with

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
For more information, type "Get-Help Import-HubContext -detailed".
For technical information, type "Get-Help Import-HubContext -full".

## RELATED LINKS
