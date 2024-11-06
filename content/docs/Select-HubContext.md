---
title: 'Select-HubContext'
date: 2024-11-06
---


# Select-HubContext

## SYNOPSIS
Select another PSHubContext to change the current PSHubContext

## SYNTAX

```
Select-HubContext -ApplicationKey <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Select another PSHubContext to change the current PSHubContext who will be used for all Hub commands.

## EXAMPLES

### EXAMPLE
```
PS C:\> $availCtxs = Get-HubContext; Select-HubContext -ApplicationKey $availCtxs[2].ApplicationKey
```

The user fetches all available contexts and set the third one as the new current context.

## PARAMETERS

### -ApplicationKey
Select a connected Hub context to current session

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
For more information, type "Get-Help Select-HubContext -detailed".
For technical information, type "Get-Help Select-HubContext -full".

## RELATED LINKS
