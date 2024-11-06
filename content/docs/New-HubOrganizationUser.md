---
title: 'New-HubOrganizationUser'
date: 2024-11-06
---


# New-HubOrganizationUser

## SYNOPSIS

## SYNTAX

### NewOrganizationUserWithoutInvitation
```
New-HubOrganizationUser -Email <String> [-AllowOfflineInRDM <Boolean>]
 [-UserSendMessageConfiguration <UserSendMessagePermission>] [-HubContext <HubContext>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### NewOrganizationUserWithInvitation
```
New-HubOrganizationUser -PSInvitation <PSInvitation> [-HubContext <HubContext>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -AllowOfflineInRDM
Allow offline mode in RDM

```yaml
Type: Boolean
Parameter Sets: NewOrganizationUserWithoutInvitation
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Email
Email of organization user you want to invite

```yaml
Type: String
Parameter Sets: NewOrganizationUserWithoutInvitation
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HubContext
Hub context

```yaml
Type: HubContext
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PSInvitation
Invite organization user by PSInvitation object

```yaml
Type: PSInvitation
Parameter Sets: NewOrganizationUserWithInvitation
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserSendMessageConfiguration
Configuration that allow/disallow to send messages with/without entries

```yaml
Type: UserSendMessagePermission
Parameter Sets: NewOrganizationUserWithoutInvitation
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

### None
## NOTES
For more information, type "Get-Help New-HubOrganizationUser -detailed".
For technical information, type "Get-Help New-HubOrganizationUser -full".

## RELATED LINKS
