---
title: 'Remove-DSPamCheckoutPolicy'
date: 2024-11-06
---


# Remove-DSPamCheckoutPolicy

## SYNOPSIS
Delete a PAM checkout policy

## SYNTAX

```
Remove-DSPamCheckoutPolicy -PolicyID <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Delete a checkout policy if it exists.
If not, throws an error indicating that the policy was not found.

## EXAMPLES

### EXAMPLE
```
PS C:\> $response = Get-DSPamCheckoutPolicy;
        $policy = $reponse | Where Name -eq "Policy A";
        Remove-DSPamCheckoutPolicy -PolicyID $policy.ID
```

Delete the policy named "Policy A".

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

### -PolicyID
ID of the policy to delete

```yaml
Type: Guid
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

### RemoteDesktopManager.PowerShellModule.Private.ServerResponse
## NOTES
For more information, type "Get-Help Remove-DSPamCheckoutPolicy -detailed".
For technical information, type "Get-Help Remove-DSPamCheckoutPolicy -full".

## RELATED LINKS

[Get-DSPamCheckoutPolicy](http://127.0.0.1:1111/docs/Get-DSPamCheckoutPolicy/)

[New-DSPamCheckoutPolicy](http://127.0.0.1:1111/docs/New-DSPamCheckoutPolicy/)

[Update-DSPamCheckoutPolicy](http://127.0.0.1:1111/docs/Update-DSPamCheckoutPolicy/)

