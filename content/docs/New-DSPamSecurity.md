---
title: 'New-DSPamSecurity'
date: 2024-11-06
---


# New-DSPamSecurity

## SYNOPSIS
Create a new PamUserPermission object

## SYNTAX

```
New-DSPamSecurity [-Role] <PamRoleType> [-Mode] <PermissionResolutionMode> [[-UserID] <Guid[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a new PamUserPermission object.
This can be used to update the security of pam vaults and pam accounts.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $security = New-DSPamSecurity -Role Approver -Mode Global;
    Update-DSPamFolder -FolderID $pamFolderID -Security $security
```

For the PAM folder whose ID is stored in $pamFolderID, its approver security will be set to 'System default'.

### EXAMPLE 2
```
PS C:\> $usersResponse = Get-DSUser;
    $user = $usersResponse.Data | Where Name -eq 'MyUserName';
    $security = New-DSPamSecurity -Role Owner -Mode Override -UserID $user.ID;
    New-DSPamFolder -Name 'MyNewPamVault' -Security $security -AsNewvault
```

Create a new PAM vault whose owner is 'MyUserName'

## PARAMETERS

### -Mode
Resolution mode: Global (System default | Inherited), Override (Custom), Both

```yaml
Type: PermissionResolutionMode
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Role
Predefined role.

```yaml
Type: PamRoleType
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserID
Ids of the users or applications to give access

```yaml
Type: Guid[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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

### Devolutions.Server.ApiWrapper.Models.Pam.Dto.Permission.PamUserPermission
## NOTES
For more information, type "Get-Help New-DSPamSecurity -detailed".
For technical information, type "Get-Help New-DSPamSecurity -full".

## RELATED LINKS
