---
title: 'Set-RDMEntryPassword'
date: 2024-11-06
---


# Set-RDMEntryPassword

## SYNOPSIS
Set the password of an entry

## SYNTAX

### Id
```
Set-RDMEntryPassword [-ID] <Guid> [-Password] <SecureString> [-PasswordAge <Int32>]
 [-PasswordSinceDate <DateTime>] [-PassThru] [-Refresh] [-Set] [-VaultMode <VaultMode>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### InputObject
```
Set-RDMEntryPassword [-InputObject] <PSConnection> [-Password] <SecureString> [-PasswordAge <Int32>]
 [-PasswordSinceDate <DateTime>] [-PassThru] [-Refresh] [-Set] [-VaultMode <VaultMode>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Set the password of an entry.
The entry to modify can be fetched by its id or by a PSConnection object obtained from Get-RDMEntry, New-RDMEntry, Get-RDMPersonalCredentials, or Get-RDMPrivilegedAccount.
In the latter case, the local object will be modified.
        To modify the password, the user must have the appropriate rights: add for a new entry, and edit for an existing one.
        For data source supporting the password age, it is also possible to modify that value for the new password.
It can be used to indicate when the password was generated instead of when the password has been set in the entry.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $entry = New-RDMEntry -Type Credential -Name 'NewCredEntry';
    $entry.Credentials.UserName = 'MyUserName';
    Set-RDMEntryPassword -InputObject $entry -Password (Read-Host -AsSecureString -Prompt 'Password')
    Set-RDMEntry -InputObject $entry
```

The user create a new credential entry.
Its username and password are being set.
The call to Set-RDMEntryPassword does modify the local object.
The user can do more modifications if desired.
The last line finally save the new entry.

### EXAMPLE 2
```
PS C:\> $pwd = ConvertTo-SecureString -AsPlainText -String 'passwordFr0mSomewhereElse';
    Get-RDMEntry -Name 'EntryToModify' | Set-RDMEntryPassword -Password $pwd -PasswordAge 14 -Set -Refresh
```

The entry named 'EntryToModify' will have an updated password, the one stored in $pwd, and it will be aged of 14 days.

### EXAMPLE 3
```
PS C:\> Get-RDMEntry -Name 'UniqueName' |
                    Set-RDMEntryDomain -Domain 'MyOtherDomain.com' -PassThru |
                    Set-RDMEntryPassword -Password $securePassword -PassThru |
                    Set-RDMEntryUsername -UserName 'NewUserName' -PassThru |
                    Set-RDMEntry
```

Modify the domain, password and username of the entry named 'UniqueName'.
The variable $securePassword is a secure string previously set.
Persist the modification with the Set-RDMEntry call.

## PARAMETERS

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
Specifies the ID of the session to get the password from.

Must be a valid GUID, in the form {00000000-0000-0000-0000-000000000000}.

```yaml
Type: Guid
Parameter Sets: Id
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -InputObject
Specifies the session to set the password to.

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

### -PassThru
Return the modified entry.

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

### -Password
Password as SecureString.
Use either "Read-Host -AsSecureString" or "ConvertTo-SecureString"

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PasswordAge
Specifies password age in days.
PasswordAge takes presedence over PasswordSinceDate.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PasswordSinceDate
Specifies date/time (UTC) at which the password was first created.
PasswordAge takes presedence over PasswordSinceDate.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Refresh
Send refresh notification to Remote Desktop Manager application.

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

### -Set
Save the session in the current data source.

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

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: False
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
Entry whose password will be modified.
Can be obtained from Get-RDMEntry, New-RDMEntry, Get-RDMPersonalCredentials, or Get-RDMPrivilegedAccount.

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection
## NOTES
For more information, type "Get-Help Set-RDMEntryPassword -detailed".
For technical information, type "Get-Help Set-RDMEntryPassword -full".

## RELATED LINKS
