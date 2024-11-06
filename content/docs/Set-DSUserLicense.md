---
title: 'Set-DSUserLicense'
date: 2024-11-06
---


# Set-DSUserLicense

## SYNOPSIS
Set the license assignments

## SYNTAX

```
Set-DSUserLicense -InputObject <PSLicenseAssignmentInfo[]> [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Set the license assignments.
To assign or unassign a user to a license, modify the IsMember field of the desired user.

## EXAMPLES

### EXAMPLE
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
User assignements to a license obtained from Get-DSUserLicense

```yaml
Type: PSLicenseAssignmentInfo[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
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

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSLicenseAssignmentInfo[]
Modified assignments obtained from Get-DSUserLicense

## OUTPUTS

### RemoteDesktopManager.PowerShellModule.Private.ServerResponse
## NOTES
For more information, type "Get-Help Set-DSUserLicense -detailed".
For technical information, type "Get-Help Set-DSUserLicense -full".

## RELATED LINKS

[Get-DSUserLicense](http://127.0.0.1:1111/docs/Get-DSUserLicense/)

