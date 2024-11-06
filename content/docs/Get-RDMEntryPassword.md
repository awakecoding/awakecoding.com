---
title: 'Get-RDMEntryPassword'
date: 2024-11-06
---


# Get-RDMEntryPassword

## SYNOPSIS
Resolve the password of the specified entry

## SYNTAX

### Id
```
Get-RDMEntryPassword [-ID] <Guid> [-Comment <String>] [-TicketID <String>] [-AsPlainText]
 [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### InputObject
```
Get-RDMEntryPassword [-InputObject] <PSConnection> [-Comment <String>] [-TicketID <String>] [-AsPlainText]
 [-VaultMode <VaultMode>] [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Resolve the password of the specified entry.
The entry can be specified in two way: by its ID and by passing the PSConnection object.
When using the ID parameter, the VaultMode parameter can be used to search the entry in the user vault or in global vault.
For the InputObjet parameter, the entry can be obtained from Get-RDMEntry, Get-RDMPersonalCredentials, and Get-RDMPrivilegedAccount.
        If the password has been modified locally via Set-RDMEntryPassword and the entry is a credential, the old password will be returned.
To see the new password, Update-RDMEntries must be called.
        To obtain the password, the user must be able to copy it.
Generally, this means the right to view it.
However, in some cases, an adminstrator might be required or a non-empty password.
The status of the entry, such as Locked or Expired, can also prevent the obtention of the password.
        If the data source required a prompt on credentials viewed, the user will be prompted for each required field.
To avoid this, the TicketID and Comment parameters must be used.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Get-RDMEntryPassword -ID '00000000-0000-0000-0000-000000000000' -AsPlainText -VaultMode User
```

Obtain, as plain text, the password of the entry in the user vault whose ID is '00000000-0000-0000-0000-000000000000'

### EXAMPLE 2
```
PS C:\> Get-RDMEntry -Name 'MyCredEntry' -VaultMode Global | Get-RDMEntryPassword -TicketID 'tick101' -Comment 'Why not'
```

Obtain, as a SecureString, the password of the entry 'MyCredEntry' in the system vault.
The ticket number and the comment are passed with the associated parameters to avoid being prompted.

### EXAMPLE 3
```
PS C:\> Get-RDMPersonalCredentials | Get-RDMEntryPassword -AsPlainText
```

Obtain, as a plain text, the password of 'My Personal Credentials' in the user settings.

### EXAMPLE 4
```
PS C:\> Get-RDMPrivilegedAccount | Get-RDMEntryPassword -AsPlainText
```

Obtain, as a plain text, the password of 'My Privileged Account' in the user settings.

## PARAMETERS

### -AsPlainText
Return the password as plain text.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
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
ID of the entry to get the password from.

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
Entry to get the password from.
Can be obtained from Get-RDMEntry, Get-RDMPersonalCredentials, or Get-RDMPrivilegedAccount.

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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection
PSConnection object of the entry obtained from Get-RDMEntry, Get-RDMPersonalCredentials, or Get-RDMPrivilegedAccount

## OUTPUTS

### System.String
### System.Security.SecureString
## NOTES
For more information, type "Get-Help Get-RDMEntryPassword -detailed".
For technical information, type "Get-Help Get-RDMEntryPassword -full".

## RELATED LINKS

[Get-RDMEntry](http://127.0.0.1:1111/docs/Get-RDMEntry/)

[Get-RDMPersonalCredentials](http://127.0.0.1:1111/docs/Get-RDMPersonalCredentials/)

[Get-RDMPrivilegedAccount](http://127.0.0.1:1111/docs/Get-RDMPrivilegedAccount/)

[Set-RDMEntryPassword](http://127.0.0.1:1111/docs/Set-RDMEntryPassword/)

