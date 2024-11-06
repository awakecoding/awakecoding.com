---
title: 'Connect-HubAccount'
date: 2024-11-06
---


# Connect-HubAccount

## SYNOPSIS
Connect to Hub.

## SYNTAX

### Hub Context
```
Connect-HubAccount -PSHubContext <PSHubContext> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### No Hub Context
```
Connect-HubAccount -Url <String> -ApplicationKey <String> -ApplicationSecret <String>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
If PSHubContext is provided, try to connect to Hub with it.
If PSHubContext is not provided, create a PSHubContext with informations received and try to connect to Hub afterward.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $PSHubContext = [Devolutions.Hub.PowerShell.Entities.PowerShell.PSHubContext]@{ApplicationKey="24526a88-7f18-4356-95bd-11690f7bc59b;468ce2d5-ea4b-42ff-bc02-d93c71b4e554"; ApplicationSecret="U4nmdOjqPAcL0GfbvNC2u8e0FCZjhEJFTnn6YHpIZDY="; Url="https://stagingv3.devolutions.xyz"}; Connect-HubAccount -PSHubContext $PSHubContext
```

The user creates the context with information he knows and uses it to connect to Hub.

### EXAMPLE 2
```
PS C:\> Connect-HubAccount -Url https://stagingv3.devolutions.xyz -ApplicationKey "24526a88-7f18-4356-95bd-11690f7bc59b;468ce2d5-ea4b-42ff-bc02-d93c71b4e554" -ApplicationSecret U4nmdOjqPAcL0GfbvNC2u8e0FCZjhEJFTnn6YHpIZDY=
```

The user etablishes a connection to Hub by passing the context's information directly to the cmdlet.
The associated context is created at the same time.

## PARAMETERS

### -ApplicationKey
Hub Application Key

```yaml
Type: String
Parameter Sets: No Hub Context
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ApplicationSecret
Hub Application Secret

```yaml
Type: String
Parameter Sets: No Hub Context
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PSHubContext
Hub Context

```yaml
Type: PSHubContext
Parameter Sets: Hub Context
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Url
Hub Url

```yaml
Type: String
Parameter Sets: No Hub Context
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
For more information, type "Get-Help Connect-HubAccount -detailed".
For technical information, type "Get-Help Connect-HubAccount -full".

## RELATED LINKS
