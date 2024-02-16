+++
title = "PowerShell Remoting Trusted Hosts: What does it mean?"
slug = "powershell-remoting-trusted-hosts-what-does-it-mean"
date = 2023-06-17
description = "This guide demystifies the \"TrustedHosts\" setting in PowerShell remoting, explaining its significance and how to configure it to avoid common errors. It offers solutions for enabling remote connections, particularly when Kerberos or HTTPS isn't used, ensuring security and connectivity for non-domain-joined machines or across different domains."

[taxonomies]
tags = ["PowerShell", "Kerberos", "CTO"]

[extra]
banner = "/images/banners/powershell-remoting-trusted-hosts-what-does-it-mean.png"
+++

If you're trying to use PowerShell remoting and hit this cryptic error about a "TrustedHosts" configuration setting, you've come to the right place:

> Enter-PSSession : Connecting to remote server 10.10.0.7 failed with the following error message : The WinRM client cannot process the request. If the authentication scheme is different from Kerberos, or if the client computer is not joined to a domain, then HTTPS transport must be used or the destination machine must be added to the TrustedHosts configuration setting. Use winrm.cmd to configure TrustedHosts. Note that computers in the TrustedHosts list might not be authenticated. You can get more information about that by running the following command: winrm help config. For more information, see the about_Remote_Troubleshooting Help topic.

Here is what it looks like on a brand new Windows Server 2022 virtual machine that is not domain-joined (yes, [PowerShell 7 still isn't pre-installed](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows)):

![PowerShell Remoting Client Trusted Hosts Error](/images/posts/psremoting-client-trusted-hosts-error.png)

Notice how I've used the IP address to connect - I didn't bother changing DNS servers to resolve the hostnames for my lab environment on that VM. Let's be honest, we know we should be doing all of these extra steps, but don't always do them. Here the side effect is an NTLM downgrade, but I'll explain later why that matters for the trusted hosts setting.

## I Don't Care, Just Tell Me How To Fix It

I couldn't agree more! Just don't forget to read the rest of this blog after. Here are all the ways you can resolve the issue quickly, in order of difficulty:

Open an elevated PowerShell terminal, then set the trusted hosts value to '*':

```powershell
Set-Item 'WSMan:localhost\Client\TrustedHosts' -Value '*' -Force
```

If the [WSMan Provider](https://learn.microsoft.com/en-us/powershell/module/microsoft.wsman.management/about/about_wsman_provider) throws an error like this:

```powershell
Set-Item: The config setting TrustedHosts cannot be changed because is controlled by policies. The policy would need to be set to "Not Configured" in order to change the config setting.
```

Then you can try setting the registry keys directly instead:

```powershell
$WinRMClientRegPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client'
New-ItemProperty -Path $WinRMClientRegPath -Name TrustedHosts -Value 1 -Force
New-ItemProperty -Path $WinRMClientRegPath -Name TrustedHostsList -Value '*' -Force
```

Instead of using PowerShell, you can also download and import [WinRMClientTrustedHosts.reg](/files/WinRMClientTrustedHosts.reg)

Last but not least, in the Group Policy Editor (gpedit.msc), you can navigate to **Administrative Templates / Windows Components / Windows Remote Management (WinRM) / WinRM Client**:

![PowerShell Remoting Client Trusted Hosts GPO](/images/posts/psremoting-client-trusted-hosts-gpo.png)

Enable the **Trusted Hosts** setting and enter '*' for the value of the **TrustedHostList** option, and then click OK.

Finally, you can verify your current TrustedHosts configuration using `Get-Item 'WSMan:localhost\Client\TrustedHosts'`

```powershell
PS > Get-Item 'WSMan:localhost\Client\TrustedHosts'

   WSManConfig: Microsoft.WSMan.Management\WSMan::localhost\Client

Type            Name                           SourceOfValue   Value
----            ----                           -------------   -----
System.String   TrustedHosts                   GPO             *
```

## Now That It's Working, What Does It Even Mean?

Simply put, **"TrustedHosts" is a list of host names that you allow connecting to despite being unable to validate the server identity through TLS or Kerberos**. Yes, you've read that right, the hosts in the "trusted" list are actually *less* trustworthy, because it really is a *security exception* list.

PowerShell Remoting in Windows uses WinRM over HTTP by default, where transport security of the protocol is handled by SPNEGO instead of TLS with HTTPS. The WinRM messages are exchanged over plain HTTP, but the payloads are encrypted using a session key derived from an NTLM or Kerberos exchange at the beginning of the connection. Kerberos, unlike NTLM, has a way to prove server identity to the client, similar to TLS with X.509 server certificate validation.

| WinRM Server Authentication | HTTP | HTTPS |
|----------|----------|----------|
| NTLM     | ✘ | ✔ |
| Kerberos | ✔ | ✔  |

Confused? Let's say you load facebook.com in your browser only to get a big, read, scary invalid certificate warning. The connection is encrypted because it's using TLS, but the server identity for facebook.com could not be automatically validated from the X.509 server certificate chain. The error could be benign, but it could also be caused by an attacker impersonating facebook.com.

As for WinRM versus WSMan, they're often used interchangeably, with no real consistency, even in the Microsoft UI. Just remember that WinRM (Windows Remote Management) is the Microsoft implementation of WSMan or WS-Management (Web Services for Management), a standardized protocol for managing resources using web services.

## Wait, That Sounds Bad - How Do I Fix This Properly?

There are two options to avoid using the PowerShell Remoting client "trusted hosts" list: use Kerberos instead of NTLM for authentication, or use WinRM HTTPS instead of WinRM HTTP for transport security. In a [recent poll I did on Twitter](https://twitter.com/awakecoding/status/1522669345486352384), more than two thirds of respondents are using WinRM HTTP instead of WinRM HTTPS:

![PowerShell Remoting WinRM Transport Poll](/images/posts/psremoting-client-winrm-transport-poll.png)

To be fair, the security of WinRM HTTP is good-enough on the local network. The biggest threat comes from NTLM, regardless of transport security: when using WinRM HTTP, an attacker could passively grab NetNTLMv2 hashes for offline cracking. When using WinRM HTTPS, an attacker could use an NTLM responder to collect NetNTLMv2 hashes to be cracked in a similar way, but it requires more effort due to X.509 server certificate validation.

On a domain-joined machine with a domain controller line-of-sight, Kerberos should work out-of-the-box, as long as you use the FQDN (IT-HELP-GW.ad.it-help.ninja) and not the IP address (10.10.0.7) to connect:

![PowerShell Remoting WinRM Kerberos Domain-Joined](/images/posts/psremoting-winrm-kerberos-domain-joined.png)

```powershell
$Username = 'Administrator@ad.it-help.ninja'
$Password = 'DevoLabs123!'
$SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential @($Username, $SecurePassword)
Enter-PSSession -ComputerName 'IT-HELP-GW.ad.it-help.ninja' -Credential $Credential
```

On my non domain-joined virtual machine, I added a DNS client NRPT rule that redirects all requests ending in '.ad.it-help.ninja' to the domain controller of my lab environment (10.10.0.3):

```powershell
Add-DnsClientNrptRule -Namespace .ad.it-help.ninja -NameServers 10.10.0.3
```

The target FQDN (IT-HELP-GW.ad.it-help.ninja) should now correctly resolve to '10.10.0.7'. Alternatively, the host DNS servers can be modified to achieve the same result. Please note that NRPT rules do not affect the 'nslookup' command on Windows because it uses its own DNS client stack. To remove the NRPT rule later, you can use `Get-DnsClientNrptRule | Remove-DnsClientNrptRule`.

With WinRM HTTPS configured on the target (out-of-scope for this blog), The `-UseSSL` parameter can be added to the `Enter-PSSession` command. Since it is not a domain-joined machine, the trusted root CA certificate needs to manually imported on the client:

![PowerShell Remoting WinRM Kerberos Domain-Joined](/images/posts/psremoting-winrm-https-non-domain-joined.png)

WinRM HTTPS works with both NTLM and Kerberos authentication, since server authentication is provided by TLS X.509 server certificate validation.

For WinRM HTTP + Kerberos, additional steps are required. Even with working DNS, the Kerberos realm needs to be mapped to a KDC first:

```powershell
ksetup /addkdc AD.IT-HELP.NINJA IT-HELP-DC.ad.it-help.ninja
```

The KDC hostname can be omitted from the `ksetup /addkdc` command if [DNS SRV detection works, but I'd rather be explicit than sorry later](https://serverfault.com/questions/384719/how-to-ensure-machine-is-kerberos-domain-joined).

You can then test if the domain controller can be detected properly for the 'ad.it-help.ninja' realm using `nltest /dsgetdc:ad.it-help.ninja`:

```powershell
PS > nltest /dsgetdc:ad.it-help.ninja
           DC: \\IT-HELP-DC.ad.it-help.ninja
      Address: \\10.10.0.3
     Dom Guid: a6752972-0358-44a0-acf4-491ae2b913f2
     Dom Name: ad.it-help.ninja
  Forest Name: ad.it-help.ninja
 Dc Site Name: Default-First-Site-Name
Our Site Name: Default-First-Site-Name
        Flags: PDC GC DS LDAP KDC TIMESERV WRITABLE DNS_DC DNS_DOMAIN DNS_FOREST CLOSE_SITE FULL_SECRET WS DS_8 DS_9 DS_10 KEYLIST
The command completed successfully
```

Cross your fingers, then try using Enter-PSSession, but this time, don't forget to add `-Authentication Negotiate` to your command parameters:

```powershell
$Username = 'Administrator@ad.it-help.ninja'
$Password = 'DevoLabs123!'
$SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential @($Username, $SecurePassword)
Enter-PSSession -ComputerName 'IT-HELP-GW.ad.it-help.ninja' -Credential $Credential -Authentication Negotiate
```

![PowerShell Remoting WinRM Kerberos Non Domain-Joined](/images/posts/psremoting-winrm-kerberos-non-domain-joined.png)

For some reason, Enter-PSSession does not always default to the Negotiate authentication method, making Kerberos fail, and therefore requiring the trusted hosts configuration. This works just fine between domain-joined machines, but if you explicitly set the authentication method, it should always work.

## Well, That Was Easy! Is There Anything Else?

This is just the tip of the iceberg when it comes to PowerShell Remoting and WinRM configuration. Setting up WinRM HTTPS would require a long explanation on how to set up your own CA using AD CS or something else. If you're feeling courageous, I suggest reading on what [PowerShell Remoting to pure Azure AD joined devices looks like right now](https://manage-the.cloud/2023/06/02/windows-remote-management-winrm-on-azure-ad-joined-devices/) with PKU2U instead of Kerberos.
