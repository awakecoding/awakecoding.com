---
title: 'Get-RDMEntryOTPKey'
date: 2024-11-06
---


# Get-RDMEntryOTPKey

## SYNOPSIS
Get the OTP key of an OTP entry

## SYNTAX

### Id
```
Get-RDMEntryOTPKey [-ID] <Guid> [-Comment <String>] [-TicketID <String>] [-AsPlainText]
 [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### InputObject
```
Get-RDMEntryOTPKey [-InputObject] <PSConnection> [-Comment <String>] [-TicketID <String>] [-AsPlainText]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get the OTP key of an OTP entry.
The entry is either specified by its ID, or by the PSConnection obtained from Get-RDMEntry.
When using the parameter ID, the parameter VaultMode can be used to specify to look in the Global vault or the User vault directly.
If the parameter VaultMode is not used, the current vault will be searched, followed by the User and Global vaults.
The TicketID and Comment parameters can be used to fill the log prompt.
It is used to fill the prompt for comment on credentials viewed.
This a setting of the data source or vault in the Common -\> Logs tab.
The user must have the rights to edit the entry to obtain the OTP key.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMEntry -Name MyOTPEntry | Get-RDMEntryOTPKey -AsPlainText
```

Get the OTP key of the entry named MyOTPEntry

### EXAMPLE 2
```
PS C:\> Get-RDMEntryOTPKey -ID $otpEntryID -VaultMode User -AsPlainText
```

Get the OTP key of the entry, in the user vault, whose ID is stored in the variable $otpEntry

## PARAMETERS

### -AsPlainText
Return the OTP key as plain text.

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
OTP entry's ID with the OTP key to extract

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
OTP entry obtained from Get-RDMEntry with the OTP key to extract

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
PSConnection object obtained from Get-DSEntry

## OUTPUTS

### System.String
### System.Security.SecureString
## NOTES
For more information, type "Get-Help Get-RDMEntryOTPKey -detailed".
For technical information, type "Get-Help Get-RDMEntryOTPKey -full".

## RELATED LINKS
