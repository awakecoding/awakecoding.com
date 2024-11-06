---
title: 'New-DSRDPEntry'
date: 2024-11-06
---


# New-DSRDPEntry

## SYNOPSIS
Create a new RDP entry.

## SYNTAX

```
New-DSRDPEntry -Name <String> [[-Domain] <String>] [[-Username] <String>] [[-Password] <String>]
 [[-MnemonicPassword] <String>] [[-VaultID] <Guid>] [[-Group] <String>] [-PromptCredentials]
 [-LinkedCredentialValue <String>] [-CredentialMode <CredentialSourceMode>] [-Description <String>]
 [-Tags <String>] [-Expiration <String>] [-WarnIfAlreadyOpened] [-CredentialViewedCommentIsRequired]
 [-TicketNumberIsRequiredOnCredentialViewed] [-CredentialViewedPrompt] [-OpenCommentPrompt]
 [-OpenCommentIsRequired] [-TicketNumberIsRequiredOnOpen] [-CloseCommentPrompt] [-CloseCommentIsRequired]
 [-TicketNumberIsRequiredOnClose] [-CheckoutMode <CheckOutMode>] [-AllowOffline <AllowOffline>]
 -HostName <String> [-AdminMode] [-Port <String>] [-RDPType <RDPType>] [-RoleName <String>]
 [-AzureInstanceID <Int32>] [-HyperVInstance <String>] [-UseEnhancedSessionMode] [-UsesClipboard <Boolean>]
 [-UsesDevices] [-UsesHardDrives <Boolean>] [-UsesPrinters] [-UsesSerialPorts <Boolean>] [-UsesSmartDevices]
 [-SoundHook <SoundHook>] [-AudioQualityMode <RDPAudioQualityMode>] [-AudioCaptureRedirectionMode <Boolean>]
 [-KeyboardHook <String>] [-AlternateShell <String>] [-ShellWorkingDirectory <String>]
 [-AfterLoginProgram <String>] [-AfterLoginDelay <Int32>] [-RemoteApplicationProgram <String>]
 [-RemoteApplicationCmdLine <String>] [-NetworkConnectionType <String>] [-DesktopBackground <Boolean>]
 [-FontSmoothing] [-DesktopComposition] [-Animations] [-VisualStyles <Boolean>] [-NetworkAutoDetect]
 [-AutoReconnection <Boolean>] [-RedirectDirectX] [-RedirectVideoPlayback]
 [-ShowContentWhileDragging <Boolean>] [-DataCompression <Boolean>] [-PersistentBitmapCaching <Boolean>]
 [-BandwidthAutoDetect <Boolean>] [-LoadAddonsMode <DefaultBoolean>] [-ClientSpec <RDPClientSpec>]
 [-KeepAliveInternal <Int32>] [-DisplayMode <ConnectionDisplayMode>] [-DisplayMonitor <DisplayMonitor>]
 [-DisplayVirtualDesktop <DisplayVirtualDesktop>] [-NewFieldsList <Field[]>] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a new RDP entry with the parameters supplied.
All fields have a default value corresponding to those of Remote Desktop Manager.

## EXAMPLES

### EXAMPLE
```
PS C:\> $NewRDPEntry = @{
        VaultId                                  = ([guid]::Empty)
        Name                                     = 'rootlocal '
        Username                                 = 'root'
        Password                                 = 'Pa$$w0rd!'
        Group                                    = 'Powershell rules'
        credentialViewedCommentIsRequired        = $true
        credentialViewedPrompt                   = $true
        ticketNumberIsRequiredOnCredentialViewed = $true
        checkOutMode                             = 'Default'
        Description                              = 'This is a description'
        Tags                                     = '1 2 3 4 5'
        HostName                                 = 'TBD'
    };
                
    New-DSRDPEntry @NewRDPEntry
```

Create a new RDP entry.

## PARAMETERS

### -AdminMode
Open the administration console

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

### -AfterLoginDelay
Delay (in miliseconds) to launch application after login.
500 ms by default.
Must be betwen 0 and 60000.

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

### -AfterLoginProgram
Path (including filename) of application to launch in alternate shell

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

### -AllowOffline
Entry's offline mode.

```yaml
Type: AllowOffline
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AlternateShell
Path (including filename) of application to launch in alternate shell

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

### -Animations
Enable animations

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

### -AudioCaptureRedirectionMode
ecord audio from RDP session.
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AudioQualityMode
RDP Audio Quality.
Dynamic by default.

```yaml
Type: RDPAudioQualityMode
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AutoReconnection
Enable automatic reconnection if RDP drop.
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AzureInstanceID
Azure Cloud Service's instance ID

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

### -BandwidthAutoDetect
Enable bandwith autodetection.
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CheckoutMode
Entry's checkout mode.

```yaml
Type: CheckOutMode
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ClientSpec
Cache specifications

```yaml
Type: RDPClientSpec
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CloseCommentIsRequired
A comment is required on close

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

### -CloseCommentPrompt
Prompt the user for comment/ticket number on close

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

### -CredentialMode
Credential mode:
CredentialEntry =\> Credential entry in the same vault.
Must use the 'LinkedCredentialValue' parameter to specify the credential ID.
PrivilegedAccount =\> PAM Account to link.
Must use the 'LinkedCredentialValue' parameter to specify the PAM account ID.
PrivateVaultSearch =\> Credential in the user vault.
Must use the 'LinkedCredentialValue' parameter to specify the credential name.

```yaml
Type: CredentialSourceMode
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CredentialViewedCommentIsRequired
A comment is required to view entry's credentials

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

### -CredentialViewedPrompt
Prompt the user for comment/ticket number

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

### -DataCompression
Enable data compression.
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
Entry's description

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

### -DesktopBackground
Enable desktop background.
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DesktopComposition
Enable desktop composition

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

### -DisplayMode
Display mode used by RDP.
Embedded by default.

```yaml
Type: ConnectionDisplayMode
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisplayMonitor
Display monitor used by RDP.
Primary by default.

```yaml
Type: DisplayMonitor
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisplayVirtualDesktop
Virtual desktop used by RPD.
Current by default

```yaml
Type: DisplayVirtualDesktop
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Domain
Domain's name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Expiration
Entry's expiration date (ISO-8601 format (yyyy-mm-ddThh:mm:ss.000Z)

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

### -FontSmoothing
Enable font smoothing

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

### -Group
Entry's location in the vault (folder name, not ID)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HostName
RDP's host name (Address)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HyperVInstance
Hyper-V Instance

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

### -KeepAliveInternal
Keep alive.
1000 by default.

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

### -KeyboardHook
Sets the destination for Windows key combinations (ALT+TAB, for example)

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

### -LinkedCredentialValue
Linked credential ID or the user vault credential's name

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

### -LoadAddonsMode
Sets if addons load in embedded or not.

```yaml
Type: DefaultBoolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MnemonicPassword
Ignored.
Entry's mnemonic password to help remembering the password

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Entry's name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NetworkAutoDetect
Enable network autodetection

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

### -NetworkConnectionType
Connection speed to use for RDP

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

### -NewFieldsList
Fields to add

```yaml
Type: Field[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OpenCommentIsRequired
A comment is required on open

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

### -OpenCommentPrompt
Prompt the user for comment/ticket number on open

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
Entry's password

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PersistentBitmapCaching
Enable persistent bitmap caching.
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Port
Port used by RDP.
3389 by default.

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

### -PromptCredentials
Prompt for password when checkout

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

### -RDPType
RDP Type.
Normal by default.

```yaml
Type: RDPType
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RedirectDirectX
Enable DirectX redirection

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

### -RedirectVideoPlayback
Enable video playback redirection

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

### -RemoteApplicationCmdLine
Parameters for the remote application

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

### -RemoteApplicationProgram
Path (including filename and extension) of application to launch

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

### -RoleName
Azure Cloud Services role name

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

### -ShellWorkingDirectory
Path for alternate shell directory

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

### -ShowContentWhileDragging
Enable content showing while dragging across screen.
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SoundHook
Choose destination for sounds.
BringToThisComputer by default.

```yaml
Type: SoundHook
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tags
Entry's tags (keywords).
Each word separated by a space is considered a keyword.

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

### -TicketNumberIsRequiredOnClose
A ticket number is required on close

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

### -TicketNumberIsRequiredOnCredentialViewed
A ticket number is required to view entry's credentials

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

### -TicketNumberIsRequiredOnOpen
A ticket number is required on open

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

### -UseEnhancedSessionMode
Hyper-V enhanced session (Uses machine's local resources, such as USB drive or printer)

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

### -Username
Entry's username

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UsesClipboard
RDP access to clipboard.
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UsesDevices
RDP access to "devices" (Such as cameras...)

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

### -UsesHardDrives
RDP access to hard drives.
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UsesPrinters
RDP access to printers

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

### -UsesSerialPorts
RDP access to serial ports.
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UsesSmartDevices
RDP access to smart devices

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

### -VaultID
Entry's vault ID.

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VisualStyles
Enable visual styles.
True by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WarnIfAlreadyOpened
Warns the user if RDP session is already opened

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

### System.Management.Automation.PSObject
### RemoteDesktopManager.PowerShellModule.Private.ServerResponse
## NOTES
For more information, type "Get-Help New-DSRDPEntry -detailed".
For technical information, type "Get-Help New-DSRDPEntry -full".

## RELATED LINKS

[New-DSEntryBase](http://127.0.0.1:1111/docs/New-DSEntryBase/)

[New-DSCredentialEntry](http://127.0.0.1:1111/docs/New-DSCredentialEntry/)

[New-DSSSHShellEntry](http://127.0.0.1:1111/docs/New-DSSSHShellEntry/)

