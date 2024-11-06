---
title: 'Update-DSPamFolder'
date: 2024-11-06
---


# Update-DSPamFolder

## SYNOPSIS
Update a PAM folder with given values.

## SYNTAX

```
Update-DSPamFolder -FolderID <Guid> [-Name <String>] [-Group <String>]
 [-CheckoutApprovalMode <CheckoutApprovalMode>] [-CheckoutReasonMode <CheckoutReasonMode>]
 [-AllowCheckoutOwnerAsApprover <ApproverOptions>] [-IncludeAdminsAsApprovers <ApproverOptions>]
 [-IncludeManagersAsApprovers <ApproverOptions>] [-CheckoutTime <Int32>] [-Permission <PSPermissionWrapper[]>]
 [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Update a PAM folder with given parameters.
Goes through every parameter and check if key match a key in current folder data.
If so, updates current folder data and send 'PUT' web request.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -AllowCheckoutOwnerAsApprover
Users can approve their own Check-out requests

```yaml
Type: ApproverOptions
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

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

### -CheckoutApprovalMode
New checkout approval mode to assign the root

```yaml
Type: CheckoutApprovalMode
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CheckoutReasonMode
New checkout reason mode to assign the root

```yaml
Type: CheckoutReasonMode
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CheckoutTime
New default checkout time in minutes to assign the root

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

### -FolderID
Id of the pam folder to update.

```yaml
Type: Guid
Parameter Sets: (All)
Aliases: CandidFolderID

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Group
For server version prior to 2024.3.0, the id of the new folder's parent.
After that, the group name.

```yaml
Type: String
Parameter Sets: (All)
Aliases: ParentFolderID

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeAdminsAsApprovers
Include administrators when listing approvers

```yaml
Type: ApproverOptions
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeManagersAsApprovers
Include PAM managers when listing approvers

```yaml
Type: ApproverOptions
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
New name to assign to the folder

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

### -Permission
Security permissions.
Prior to server version 2024.3.0.0, use the PamUserPermission type.
Else, use the ConnectionPermission type on the root folder.

```yaml
Type: PSPermissionWrapper[]
Parameter Sets: (All)
Aliases: Security

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

### RemoteDesktopManager.PowerShellModule.Private.ServerResponse
## NOTES
For more information, type "Get-Help Update-DSPamFolder -detailed".
For technical information, type "Get-Help Update-DSPamFolder -full".

## RELATED LINKS

[Get-DSPamFolder](http://127.0.0.1:1111/docs/Get-DSPamFolder/)

[New-DSPamFolder](http://127.0.0.1:1111/docs/New-DSPamFolder/)

[Remove-DSPamFolder](http://127.0.0.1:1111/docs/Remove-DSPamFolder/)

