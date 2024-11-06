---
title: 'Get-DSEntryOTP'
date: 2024-11-06
---


# Get-DSEntryOTP

## SYNOPSIS
Get a PSObject containing the OTP code with the remaining time of an OTP entry and the corresponding end time (UTC)

## SYNTAX

```
Get-DSEntryOTP -EntryID <Guid> [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get a PSObject containing the OTP code with the remaining time of an OTP entry and the corresponding end time (UTC).
The entry must be specified by its ID.

## EXAMPLES

### EXAMPLE
```
PS C:\> $response = Get-DSEntryOTP -EntryID '12345678-1234-1234-1234-123456789ABC'
        $otpCode = $response.code
```

Get the OTP code of the entry whose ID is '12345678-1234-1234-1234-123456789ABC'

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

### -EntryID
ID of the entry for which you want to retrieve the OTP

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

### System.Management.Automation.PSObject
### RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=7.4.4.500, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]
## NOTES
For more information, type "Get-Help Get-DSEntryOTP -detailed".
For technical information, type "Get-Help Get-DSEntryOTP -full".

## RELATED LINKS
