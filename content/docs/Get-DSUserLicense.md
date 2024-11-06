---
title: 'Get-DSUserLicense'
date: 2024-11-06
---


# Get-DSUserLicense

## SYNOPSIS
Get all the assignments of a specific license

## SYNTAX

### InputObject
```
Get-DSUserLicense -InputObject <PSLicenseInfo> [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### GetByID
```
Get-DSUserLicense -Serial <String> [-AsLegacyResponse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Get all the assignments of a specific license.
To assign a license, modify the IsMember field of the desired user.
Once the modifications are done, use the Set-DSUserLicense cmdlet.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $assignResponse = Get-DSUserLicense -Serial XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
        $assignments = $assignResponse.Data
        $asssignments | Where -Property IsMember -eq $true | Select Name, UserId
```

Obtain all the users who have been assigned the license 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX'

### EXAMPLE 2
```
PS C:\> $AsLegacyResponse = $true
        $licResponse = Get-DSLicence;
        $license = $licRespones.Data | Where -Property License -like XXXXX* | Select -First 1
        $assignResponse = Get-DSUserLicense -InputObject $license
        $assignments = $assignResponse.Data
        $aUserAssignment = $asssignments | Where Name -eq 'Name of the user to assign'
        $aUserAssignment.IsMember = $true
        Set-DSUserLicense -InputObject $aUserAssignment
```

Assign the license starting with XXXXX to the user 'Name of the user to assign'

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

### -InputObject
User license assignments of this specific serial

```yaml
Type: PSLicenseInfo
Parameter Sets: InputObject
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Serial
User license assignments of this specific serial

```yaml
Type: String
Parameter Sets: GetByID
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSLicenseInfo
License object obtained from the data field of the Get-DSLicense response

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSLicenseAssignmentInfo[]
### RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[RemoteDesktopManager.PowerShellModule.PSOutputObject.PSLicenseAssignmentInfo, Devolutions.PowerShell, Version=2024.3.0.0, Culture=neutral, PublicKeyToken=null]]
## NOTES
For more information, type "Get-Help Get-DSUserLicense -detailed".
For technical information, type "Get-Help Get-DSUserLicense -full".

## RELATED LINKS

[Get-DSLicense](http://127.0.0.1:1111/docs/Get-DSLicense/)

[Set-DSUserLicense](http://127.0.0.1:1111/docs/Set-DSUserLicense/)

