---
title: 'Set-HubContext'
date: 2024-11-06
---


# Set-HubContext

## SYNOPSIS
Set the current PSHubContext

## SYNTAX

```
Set-HubContext -PSHubContext <PSHubContext> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Set the current PSHubContext to the one provided

## EXAMPLES

### EXAMPLE
```
PS C:\> $availCtxs = Get-HubContext; Set-HubContext -PSHubContext $availCtxs[2]
```

The user fetches all available contexts and set the third one as the new current context.

## PARAMETERS

### -PSHubContext
Set Hub context to current session

```yaml
Type: PSHubContext
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
For more information, type "Get-Help Set-HubContext -detailed".
For technical information, type "Get-Help Set-HubContext -full".

## RELATED LINKS
