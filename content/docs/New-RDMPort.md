---
title: 'New-RDMPort'
date: 2024-11-06
---


# New-RDMPort

## SYNOPSIS
Generate port number(s) based on the specified parameters.

## SYNTAX

```
New-RDMPort [-Count <Int32>] [-ExcludePort <Int32[]>] [-IncludeWellKnownPorts] [-IncludeRegisteredPorts]
 [-IncludePortsUsedByOthersSessions] [-Maximum <Int32>] [-Minimum <Int32>]
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Generate port number(s) based on the specified parameters.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $port = New-RDMPort -Minimum 50 -Maximum 2048 -IncludeWellKnownPorts -IncludeRegisteredPorts -IncludePortsUsedByOthersSessions
```

Generate a port between 50 and 2048.
The port can be already used by another session, or be a well known or registered port.

### EXAMPLE 2
```
PS C:\> $port = New-RDMPort -Minimum 10 -Maximum 15 -IncludeWellKnownPorts -IncludeRegisteredPorts -ExcludePort 11,12,13
```

The port will have a value of either 10, 14 or 15.
If another session use one of the ports, that port will be excluded from the possibilities.

### EXAMPLE 3
```
PS C:\> $ports = New-RDMPort -Count 10
```

10 ports will be generated and stored in $ports.

### EXAMPLE 4
```
PS C:\> $sess = Get-RDMSession -Name ARemotePwsh; $sess.PowerShell.Port = New-RDMPort -Minimum 1024; Set-RDMSession -Session $sess -Refresh
```

The user fetch an existing remote powershell session called ARemotePwsh and change its port.
The new port in at least 1024, not a well known port, not a registered port and unused by other sessions.
The user save the modification.

## PARAMETERS

### -Count
Number of ports to be generated.
Default value is 1.

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

### -ExcludePort
Those ports will not be generated.

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

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

### -IncludePortsUsedByOthersSessions
Allows ports used by others sessions to be generated.

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

### -IncludeRegisteredPorts
Allows registered ports to be generated.
For a list of registered ports, see: https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers#Registered_ports

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

### -IncludeWellKnownPorts
Allows well known ports to be generated.
For a list of well known ports, see: https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers#Well-known_ports

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

### -Maximum
Maximum port value generated.
By default, the boundary is set at the absolute maximum 65 535.

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

### -Minimum
Minimum port value generated.
By default, the boundary is set at 0.
A recommended value is 1024.

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
For more information, type "Get-Help New-RDMPort -detailed".
For technical information, type "Get-Help New-RDMPort -full".

## RELATED LINKS
