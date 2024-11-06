---
title: 'Update-DSSSHShellEntry'
date: 2024-11-06
---


# Update-DSSSHShellEntry

## SYNOPSIS
Update an SSH Shell entry.

## SYNTAX

```
Update-DSSSHShellEntry -EntryID <Guid> [-Group <String>] [-Name <String>] [-Password <String>]
 [-Description <String>] [-Tags <String>] [-DisplayMode <ConnectionDisplayMode>]
 [-DisplayMonitor <DisplayMonitor>] [-DisplayVirtualDesktop <DisplayVirtualDesktop>] [-AlwaysAskForPassword]
 [-Username <String>] [-PrivateKeyType <PrivateKeyType>] [-PrivateKeyPath <String>]
 [-PrivateKeyPassphrase <String>] [-PromptForPassphrase] [-HostName <String>] [-HostPort <Int32>]
 [-AfterConnectMacroDelay <Int32>] [-AfterConnectMacros <String>]
 [-AfterConnectMacroEnterAfterCommand <Boolean>] [-BeforeDisconnectMacroDelay <Int32>]
 [-BeforeDisconnectMacro <String>] [-BeforeDisconnectMacroEnterAfterCommand <Boolean>]
 [-OverrideTerminalName <String>] [-Encoding <TerminalEncoding>] [-AutoWrap <TerminalAutoWrap>]
 [-LocalEcho <TerminalLocalEcho>] [-InitialKeypadMode <TerminalKeypadMode>]
 [-DisableKeypadMode <DefaultBoolean>] [-CursorType <TerminalCursorType>] [-CursorBlink <TerminalCursorBlink>]
 [-ForceNonDestructiveBackspace] [-ImplicitCRinLF] [-ImplicitLFinCR] [-MaxScrollbackLines <Int32>]
 [-DoubleClickDelimiters <String>] [-FontMode <TerminalFontMode>] [-BellMode <TerminalBellMode>]
 [-RemoteCommand <String>] [-CursorKeyMode <TerminalCursorKeyMode>]
 [-BackspaceKeyMode <TerminalBackspaceKeyMode>] [-HomeEndKeyMode <TerminalHomeEndKeyMode>]
 [-FunctionKeyMode <TerminalFunctionKeysMode>] [-ProxyMode <ProxyMode>] [-ProxyType <String>]
 [-ProxyHost <String>] [-ProxyHostPort <String>] [-ProxyUsername <String>] [-ProxyPassword <String>]
 [-ProxyLocalHostConnections <String>] [-ProxyExcludedHosts <String>]
 [-ProxyDNSLookupType <TelnetTerminalDnsLookupType>] [-ProxyTelnetCommand <String>] [-WarnIfAlreadyOpened]
 [-CredentialViewedCommentIsRequired] [-TicketNumberIsRequiredOnCredentialViewed] [-CredentialViewedPrompt]
 [-OpenCommentPrompt] [-OpenCommentIsRequired] [-TicketNumberIsRequiredOnOpen] [-CloseCommentPrompt]
 [-CloseCommentIsRequired] [-TicketNumberIsRequiredOnClose] [-NewFieldsList <Field[]>] [-AsLegacyResponse]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Update an SSH Shell entry using supplied parameters.

## EXAMPLES

### EXAMPLE
```
PS C:\> $parameters = @{
        EntryID     = '00000000-0000-0000-0000-000000000000'
        Password    = 'n3WPa$$w0rd!'     
        }
        
        Update-DSSSHShellEntry @parameters
```

Change the name and password of the specified entry.

## PARAMETERS

### -AfterConnectMacroDelay
Delay in ms before starting after-connection macros.
The default value is the minimal one, 500 ms.

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

### -AfterConnectMacroEnterAfterCommand
If it should send 'Enter' input after entering an after-connection macro.
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

### -AfterConnectMacros
Macros to run after connection

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

### -AlwaysAskForPassword
If it should always ask for password when checking out

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

### -AutoWrap
Toggle terminal autowrapping

```yaml
Type: TerminalAutoWrap
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BackspaceKeyMode
Keyboard backspace key mode (Default/Control-H/Control-?
(ASCII code 127))

```yaml
Type: TerminalBackspaceKeyMode
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BeforeDisconnectMacro
Macros to run before disconnect

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

### -BeforeDisconnectMacroDelay
Delay in ms before starting before-disconnect macro.
The default value is the minimal one, 500 ms.

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

### -BeforeDisconnectMacroEnterAfterCommand
If it should send 'Enter' input after entering a before-disconnect macro.
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

### -BellMode
Select bell mode behavior (Default/None/Sound/Visual)

```yaml
Type: TerminalBellMode
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

### -CursorBlink
Toggle terminal cursor blink

```yaml
Type: TerminalCursorBlink
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CursorKeyMode
Keyboard cursor key mode (Default/Normal/Application)

```yaml
Type: TerminalCursorKeyMode
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CursorType
Select terminal cursor type (Block/Underline/Vertical line)

```yaml
Type: TerminalCursorType
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

### -DisableKeypadMode
Disable terminal application keypad mode

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

### -DisplayMode
Display mode used by SSH Shell.
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
Display monitor used by SSH Shell.
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
Virtual desktop used by SSH Shell.

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

### -DoubleClickDelimiters
Delemiters for double-clicking in terminal

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

### -Encoding
Select terminal encoding

```yaml
Type: TerminalEncoding
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EntryID
ID of the entry to modify.

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

### -FontMode
Select font mode (Default/Override)

```yaml
Type: TerminalFontMode
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForceNonDestructiveBackspace
Force non-destructive backspaces (Disable character 127)

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

### -FunctionKeyMode
Keyboard fn key mode

```yaml
Type: TerminalFunctionKeysMode
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
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HomeEndKeyMode
Keyboard home/end key mode (Default/Standard/RXVT)

```yaml
Type: TerminalHomeEndKeyMode
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HostName
Entry's hostname

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

### -HostPort
Entry's host port.
22 by default.

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

### -ImplicitCRinLF
Convert CR to LF

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

### -ImplicitLFinCR
Convert LF to CR

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

### -InitialKeypadMode
Terminal's initial keypad mode (Default/Enable (Application in Putty)/Disable (Normal in Putty))

```yaml
Type: TerminalKeypadMode
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LocalEcho
Toggle terminal local echo

```yaml
Type: TerminalLocalEcho
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxScrollbackLines
Terminal max scrollback lines.
2000 lines by default.

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

### -Name
Entry's name

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

### -OverrideTerminalName
Override terminal type

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

### -Password
Entry's password

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

### -PrivateKeyPassphrase
Private key passphrase

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

### -PrivateKeyPath
Full private key path (*.ppk)

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

### -PrivateKeyType
Private key type.
The default type is NoKey.

```yaml
Type: PrivateKeyType
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PromptForPassphrase
Prompt for passphrase before checkout.

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

### -ProxyDNSLookupType
Proxy DNS lookup mode.
Automatic by default.

```yaml
Type: TelnetTerminalDnsLookupType
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProxyExcludedHosts
Proxy excluded hosts

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

### -ProxyHost
Proxy Hostname

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

### -ProxyHostPort
Proxy host port

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

### -ProxyLocalHostConnections
Proxy localhost connections

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

### -ProxyMode
Proxy mode (Only None/custom supported)

```yaml
Type: ProxyMode
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProxyPassword
Proxy password

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

### -ProxyTelnetCommand
Telnet/local proxy command (blank for default)

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

### -ProxyType
Proxy type.
Socks5 by default.

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

### -ProxyUsername
Proxy username

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

### -RemoteCommand
Ignored.
Absolute path of the application on the remote computer

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

### -Tags
Entry's tags (keywords).
Each word separated by a space is considered a keyword.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Keywords

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

### -Username
Entry's username

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

### -WarnIfAlreadyOpened
Warns the user if session is already opened

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

### RemoteDesktopManager.PowerShellModule.Private.ServerResponse
## NOTES
For more information, type "Get-Help Update-DSSSHShellEntry -detailed".
For technical information, type "Get-Help Update-DSSSHShellEntry -full".

## RELATED LINKS

[Get-DSEntry](http://127.0.0.1:1111/docs/Get-DSEntry/)

[Update-DSEntryBase](http://127.0.0.1:1111/docs/Update-DSEntryBase/)

[Update-DSRDPEntry](http://127.0.0.1:1111/docs/Update-DSRDPEntry/)

