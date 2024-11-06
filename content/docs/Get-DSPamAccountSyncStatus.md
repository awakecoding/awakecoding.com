---
title: 'Get-DSPamAccountSyncStatus'
date: 2024-11-06
---


# Get-DSPamAccountSyncStatus

## SYNOPSIS
Verify if the provider can still access the account in the Domain or the Local SSH machine.

## SYNTAX

```
Get-DSPamAccountSyncStatus -AccountID <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Verify if the provider can still access the account in the Domain or the Local SSH machine.
The supported credential types are AzureADUser, DomainUser, LocalUser, SqlServer, and WindowsLocalAccount.
If not, an internal server error will be received.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -AccountID
Pam account's ID

```yaml
Type: Guid
Parameter Sets: (All)
Aliases: PamAccountID

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

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

### Devolutions.RemoteDesktopManager.Business.PamHeartbeatResult
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=7.4.4.500, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]
## NOTES
For more information, type "Get-Help Get-DSPamAccountSyncStatus -detailed".
For technical information, type "Get-Help Get-DSPamAccountSyncStatus -full".

## RELATED LINKS

[Get-DSPamAccount](http://127.0.0.1:1111/docs/Get-DSPamAccount/)

[New-DSPamAccount](http://127.0.0.1:1111/docs/New-DSPamAccount/)

[Remove-DSPamAccount](http://127.0.0.1:1111/docs/Remove-DSPamAccount/)

[Update-DSPamAccount](http://127.0.0.1:1111/docs/Update-DSPamAccount/)

