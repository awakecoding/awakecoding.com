---
title: 'Disconnect-HubAccount'
date: 2024-11-06
---


# Disconnect-HubAccount

## SYNOPSIS
Disconnect to Hub

## SYNTAX

```
Disconnect-HubAccount [-ApplicationKey <String>] [-All] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
If ApplicationKey is provided, disconnect and remove PSHubContext from PowerShell session.
If All is provided, disconnect and remove all PSHubContext from PowerShell session.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Disconnect-HubAccount -All
```

Disconnect all Hub Accounts and remove all PSHubContext.

### EXAMPLE 2
```
PS C:\> Disconnect-HubAccount -ApplicationKey "24526a88-7f18-4356-95bd-11690f7bc59b;468ce2d5-ea4b-42ff-bc02-d93c71b4e554"
```

Disconnect the Hub account associated with the application key.
The PSHubContext will also be removed.

## PARAMETERS

### -All
Disconnect all Hub context

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

### -ApplicationKey
Disconnect a particular connected Hub context

```yaml
Type: String
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

### None
## NOTES
For more information, type "Get-Help Disconnect-HubAccount -detailed".
For technical information, type "Get-Help Disconnect-HubAccount -full".

## RELATED LINKS
