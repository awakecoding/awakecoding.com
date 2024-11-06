---
title: 'Update-DSEntryBase'
date: 2024-11-06
---


# Update-DSEntryBase

## SYNOPSIS
Update an entry.

## SYNTAX

### Value
```
Update-DSEntryBase [-JsonBody] <String> [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### RDMConnection
```
Update-DSEntryBase [-FromRDMConnection] <ConnectionInfoEntity> [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Update an entry (Modified entry should be in jsonBody).
Unless you know exactly what you are doing, you should probably use the CMDlets created by us to update entries.

## EXAMPLES

### EXAMPLE
```
PS C:\> $credResponse = Get-DSEntry -EntryID $id
        $cred = $credResponse.data
        $cred.data.passwordItem | Add-Member -MemberType NoteProperty -Name SensitiveData -Value 'newPassword'
        Update-DSEntryBase -JsonBody (ConvertTo-Json -InputObject $cred -Depth 4)
```

An existing credential entry with an existing password is fetched.
Its password is changed to 'newPassword' by adding a sensitive data property to passwordItem.
The entry is converted in json with the requiered depth to avoid being flatten.
The entry is updated afterwards.

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

### -FromRDMConnection
Entry obtained from Get-DSEntry -AsRDMConnection.
It can be used to update an entry

```yaml
Type: ConnectionInfoEntity
Parameter Sets: RDMConnection
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -JsonBody
Entry in JSON

```yaml
Type: String
Parameter Sets: Value
Aliases:

Required: True
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
For more information, type "Get-Help Update-DSEntryBase -detailed".
For technical information, type "Get-Help Update-DSEntryBase -full".

## RELATED LINKS

[Get-DSEntry](http://127.0.0.1:1111/docs/Get-DSEntry/)

[Update-DSRDPEntry](http://127.0.0.1:1111/docs/Update-DSRDPEntry/)

[Update-DSSSHShellEntry](http://127.0.0.1:1111/docs/Update-DSSSHShellEntry/)

