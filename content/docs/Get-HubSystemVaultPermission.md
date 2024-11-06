---
title: 'Get-HubSystemVaultPermission'
date: 2024-11-06
---


# Get-HubSystemVaultPermission

## SYNOPSIS

## SYNTAX

### User
```
Get-HubSystemVaultPermission -UserId <Guid> [-HubContext <HubContext>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### Group
```
Get-HubSystemVaultPermission -GroupId <Guid> [-HubContext <HubContext>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -GroupId
Group Id

```yaml
Type: Guid
Parameter Sets: Group
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HubContext
Hub context

```yaml
Type: HubContext
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserId
User Id

```yaml
Type: Guid
Parameter Sets: User
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
For more information, type "Get-Help Get-HubSystemVaultPermission -detailed".
For technical information, type "Get-Help Get-HubSystemVaultPermission -full".

## RELATED LINKS
