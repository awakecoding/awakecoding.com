---
title: 'Update-DSFolderCredentials'
date: 2024-11-06
---


# Update-DSFolderCredentials

## SYNOPSIS
Updates the credentials (Username/password) on a folder.

## SYNTAX

### Clear
```
Update-DSFolderCredentials [-ClearCredentials] -FolderId <Guid> [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Change
```
Update-DSFolderCredentials -FolderId <Guid> [[-Password] <String>] [[-Username] <String>] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Inherited
```
Update-DSFolderCredentials -FolderId <Guid> [-SetInherited] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
If the "ClearCredentials" switch parameter is present, it will delete both username AND password from folder.
If not, it checks which field was provided and check with the current folder credentials to update accordingly with what credentials were supplied.

## EXAMPLES

### EXAMPLE
```
PS C:\> Update-DSFolderCredentials -FolderId "[guid]" -Username "YourNewUsername" -Password "YourNewPassword"
```

Update

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

### -ClearCredentials
Clear the username and the password of the folder.

```yaml
Type: SwitchParameter
Parameter Sets: Clear
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FolderId
ID of the folder to update the credentials

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

### -Password
Password of the folder

```yaml
Type: String
Parameter Sets: Change
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetInherited
Set the credential mode to inherited.

```yaml
Type: SwitchParameter
Parameter Sets: Inherited
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Username
Username of the folder

```yaml
Type: String
Parameter Sets: Change
Aliases:

Required: False
Position: 1
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
For more information, type "Get-Help Update-DSFolderCredentials -detailed".
For technical information, type "Get-Help Update-DSFolderCredentials -full".

## RELATED LINKS
