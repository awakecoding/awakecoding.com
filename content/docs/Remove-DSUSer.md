---
title: 'Remove-DSUSer'
date: 2024-11-06
---


# Remove-DSUSer

## SYNOPSIS
Delete a user

## SYNTAX

```
Remove-DSUSer -UserID <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Delete a user specified by the ID attribute.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -AsLegacyResponse
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object.
Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

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

### -UserID
Id of the user to delete.

```yaml
Type: Guid
Parameter Sets: (All)
Aliases: CandidUserId

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

### RemoteDesktopManager.PowerShellModule.Private.ServerResponse
## NOTES
For more information, type "Get-Help Remove-DSUSer -detailed".
For technical information, type "Get-Help Remove-DSUSer -full".

## RELATED LINKS

[Get-DSUser](http://127.0.0.1:1111/docs/Get-DSUser/)

[New-DSUser](http://127.0.0.1:1111/docs/New-DSUser/)

[Update-DSUser](http://127.0.0.1:1111/docs/Update-DSUser/)

