---
title: 'Get-RDMEntryOTP'
date: 2024-11-06
---


# Get-RDMEntryOTP

## SYNOPSIS
Get a hastable of the OTP code with the remaining time of an OTP entry

## SYNTAX

### Id
```
Get-RDMEntryOTP [-ID] <Guid> [-Comment <String>] [-TicketID <String>] [-VaultMode <VaultMode>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### InputObject
```
Get-RDMEntryOTP [-InputObject] <PSConnection> [-Comment <String>] [-TicketID <String>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get a hastable of the OTP code with the remaining time of an OTP entry.
    To obtain the OTP code, the user must be able to copy it.
Generally, this means the right to view it.
The status of the entry, such as Locked or Expired, can also prevent the obtention of the OTP code.
    If the data source required a prompt on credentials viewed, the user will be prompted for each required field.
To avoid this, the TicketID and Comment parameters must be used.

## EXAMPLES

### EXAMPLE
```
PS C:\> $otp = Get-RDMEntry -Name MyOTPEntry | Get-RDMEntryOTP;
    $otp.Code
```

Get the OTP code of the entry MyOTPEntry

## PARAMETERS

### -Comment
Comment for the credential viewed log.

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

### -ForcePromptAnswer
Switch to use with caution.
It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions.
In case of multiple prompts, multiple values can be passed to this parameter.
Here are the accepted values:
- Yes: Accept the prompt.
Cover the OK and Automatic value.
- No: Refuse the yes/no/cancel prompt.
Cancel is the fallback option if there is not an option No.
- Cancel: Cancel the yes/no/cancel prompt.
No is the fallback option if there is not an option Cancel.

```yaml
Type: DialogResult[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ID
ID of the entry to modify.
Use the VaultMode parameter to search in the User vault or the Global vault.

```yaml
Type: Guid
Parameter Sets: Id
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Specifies the entry to get the OTP from.

```yaml
Type: PSConnection
Parameter Sets: InputObject
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -TicketID
Ticket number for the credential viewed log

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

### -VaultMode
Vault where the command will be applied.
Three choices are offered:
- Default: Current vault that has been set.
- User: Vault specific to the current user.
- Global: Global vault of the data source.

```yaml
Type: VaultMode
Parameter Sets: Id
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection
PSConnection object of the OTP entry obtained from Get-RDMEntry

## OUTPUTS

### System.Collections.Generic.Dictionary`2[[System.String, System.Private.CoreLib, Version=8.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e],[System.String, System.Private.CoreLib, Version=8.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
## NOTES
For more information, type "Get-Help Get-RDMEntryOTP -detailed".
For technical information, type "Get-Help Get-RDMEntryOTP -full".

## RELATED LINKS

[Set-RDMEntryOTP](http://127.0.0.1:1111/docs/Set-RDMEntryOTP/)

