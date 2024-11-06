---
title: 'Set-RDMPrivateSessionPassword'
date: 2024-11-06
---


# Set-RDMPrivateSessionPassword

## SYNOPSIS
Set the password from the specified session.

## SYNTAX

### Id
```
Set-RDMPrivateSessionPassword [-ID] <Guid> [-Password] <SecureString> [[-PasswordAge] <Int32>] [-PassThru]
 [[-PasswordSinceDate] <DateTime>] [-Refresh] [-SetSession] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### InputObject
```
Set-RDMPrivateSessionPassword [-Password] <SecureString> [[-PasswordAge] <Int32>] [-PassThru]
 [[-PasswordSinceDate] <DateTime>] [-Refresh] [-Session] <PSConnection> [-SetSession]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Set the password from the specified session.
Session must be marked as "Allow show credentials" if not null is returned. 
To persist the new password, the switch SetSession must be used.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Set-RDMUserVaultSessionPassword -ID "{00000000-0000-0000-0000-000000000000}" -Password (Read-Host -AsSecureString "Password") -SetSession
```

Set the password from the session with ID = "{00000000-0000-0000-0000-000000000000}".

### EXAMPLE 2
```
PS C:\> $list = Get-RDMUserVaultSession; Set-RDMUserVaultSessionPassword -ID $list[1].ID -Password (Read-Host -AsSecureString "Password") -SetSession
```

Retrieves the list of available sessions and sets the password from the the second element in the list.

### EXAMPLE 3
```
PS C:\> Get-RDMUserVaultSession -Name 'UniqueName' |
                    Set-RDMUserVaultSessionDomain -Domain "MyOtherDomain.com" -PassThru |
                    Set-RDMUserVaultSessionPassword -Password $securePassword -PassThru |
                    Set-RDMUserVaultSessionUsername -UserName 'NewUserName' -PassThru |
                    Set-RDMUserVaultSession
```

Modify the domain, password and username of the entry named 'UniqueName'.
The variable $securePassword is a secure string previously set.
Persist the modification with the Set-RDMUserVaultSession call.

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
Position: 3
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
Position: 4
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

### -Session
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

### -SetSession
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection
## NOTES
For more information, type "Get-Help Set-RDMPrivateSessionPassword -detailed".
For technical information, type "Get-Help Set-RDMPrivateSessionPassword -full".

## RELATED LINKS
