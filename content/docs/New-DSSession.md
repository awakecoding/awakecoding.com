---
title: 'New-DSSession'
date: 2024-11-06
---


# New-DSSession

## SYNOPSIS
Establishes a connection with your Devolutions Server instance.

## SYNTAX

### Credentials
```
New-DSSession [[-Credential] <PSCredential>] [-BaseUri] <String> [-DomainId <String>] [-Timeout <Int32>]
 [-AsApplication] [-UseOAuth] [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### WindowsAuthentication
```
New-DSSession [-BaseUri] <String> [-DomainId <String>] [-Timeout <Int32>] [-AsApplication] [-UseOAuth]
 [-WindowsAuthentication] [-AsLegacyResponse] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Establishes a connection with your Devolutions Server by retrieving server informations and setting global variables that are required for accessing the API.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $SecurePassword = ConvertTo-SecureString 'YourPassword' -AsPlainText -Force;
        $SessionData = @{
            BaseURI = "Your/DVLS/Instance/URL"
            Credential = New-Object System.Management.Automation.PSCredential ($YourUsername, $SecurePassword)
        };

        New-DSSession @SessionData
```

Authenticate with the splatting of the hash table containing the required parameters.

### EXAMPLE 2
```
PS C:\> $SecurePassword = ConvertTo-SecureString $YourPassword -AsPlainText -Force
        $Credentials = New-Object System.Management.Automation.PSCredential ($YourUsername, $SecurePassword)
	    $BaseURI = "Your/DVLS/Instance/URL"

        New-DSSession -Credential $Credentials -BaseURI $URI
```

Authenticate by using the parameters.

### EXAMPLE 3
```
PS C:\> $SecurePassword = ConvertTo-SecureString $YourPassword -AsPlainText -Force
	    $Credentials = New-Object System.Management.Automation.PSCredential ($YourUsername, $SecurePassword)
	    $BaseURI = "Your/DVLS/Instance/URL"

        New-DSSession -Credential $Credentials -BaseURI $URI
```

Authenticate using an application user.

### EXAMPLE 4
```
PS C:\> New-DSSession -BaseURI "Your/DVLS/Instance/URL" -WindowsAuthentication
```

A Windows user authenticates himself with his logged account.

### EXAMPLE 5
```
PS C:\> New-DSSession -BaseURI "Your/DVLS/Instance/URL" -UseOAuth
```

Authenticate using OAuth in a web browser.

## PARAMETERS

### -AsApplication
Required when using an application user to authenticate

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

### -BaseUri
URL to your Devolutions Server instance

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
PSCredential with your Devolutions Server username and password

```yaml
Type: PSCredential
Parameter Sets: Credentials
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DomainId
@{Text=}

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

### -Timeout
Polling delay in seconds.
Default value is 15 seconds.
The value must be between 3 and 600 seconds.

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

### -UseOAuth
Use OAuth in a web browser.

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

### -WindowsAuthentication
Use Windows Authentication.
Must be on Windows.

```yaml
Type: SwitchParameter
Parameter Sets: WindowsAuthentication
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

### None
## OUTPUTS

### RemoteDesktopManager.PowerShellModule.Private.ServerResponse
## NOTES
For more information, type "Get-Help New-DSSession -detailed".
For technical information, type "Get-Help New-DSSession -full".

## RELATED LINKS

[Close-DSSession](http://127.0.0.1:1111/docs/Close-DSSession/)

[Get-DSIsLogged](http://127.0.0.1:1111/docs/Get-DSIsLogged/)

