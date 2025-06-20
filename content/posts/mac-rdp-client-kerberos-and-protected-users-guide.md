+++
title = "Mac RDP Client: Kerberos and Protected Users Guide"
slug = "mac-rdp-client-kerberos-and-protected-users-guide"
date = 2024-06-13
description = "Explore the essential steps to secure Mac RDP connections using Kerberos authentication with a focus on troubleshooting Protected Users and NTLM issues. This guide provides practical solutions for configuring Kerberos in an Active Directory environment, ensuring robust security for remote desktop access."

[taxonomies]
tags = ["RDP", "Kerberos", "ActiveDirectory", "CTO"]

[extra]
banner = "/images/banners/mac-rdp-client-kerberos-and-protected-users-guide.png"
+++

## Hardening that breaks RDP

Let's say you're in charge of hardening Active Directory security, and you follow advice to disable inbound NTLM or make certain privileged accounts member of the [Protected Users group](https://learn.microsoft.com/en-us/windows-server/security/credentials-protection-and-management/protected-users-security-group). You make the changes, feel good about it for a few minutes until you start getting messages from Apple users who can no longer connect to Windows machines using the [Mac RDP client](https://learn.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/remote-desktop-mac). Oopsie!

With inbound NTLM disabled, or if you have an invalid password, the error message looks like this:

![Mac RDP Unable to Connect - NTLM Disabled](/images/posts/mac-rdp-krb-unable-to-connect-ntlm-disabled.png)

> We couldn't connect to the remote PC. This might be due to an expired password. If this keeps happening, contact your network administrator for assistance. Error code: 0x207

With using an account member of the Protected Users group, the error message looks like this instead:

![Mac RDP Unable to Connect - Protected Users](/images/posts/mac-rdp-krb-unable-to-connect-protected-users.png)

> We couldn't connect to the remote PC because a user account restriction is preventing you from signing in. Contact your network administrator for assistance. Error code: 0xc07

## The NTLM fallback problem

TL;DR: Kerberos is not working, so the Mac RDP client is falling back to NTLM, which won't work with inbound NTLM disabled, or when the user is a member of the Protected Users group in Active Directory, which also disables NTLM as a side-effect. The only fix is to make Kerberos work from the Mac RDP client, but if you're reading this, chances are your previous attempts at figuring out how to do it have failed. You're in luck: I have the solution!

## Kerberos success conditions

For Kerberos to work, the Mac doesn't need to be domain-joined, but it needs to find *and reach* the Kerberos KDC (domain controller) matching the Kerberos realm of the target machine and user. This is commonly described as the KDC line-of-sight, where the Kerberos client can "see" the KDC. If the client cannot see the KDC, then Kerberos just doesn't happen.

![Mac RDP No KDC line-of-sight, No Kerberos](/images/posts/mac-rdp-krb-no-line-of-sight-no-kerberos.png)

The Kerberos *realm* is really a special domain name that is often, but not always, the same as the DNS suffix used for the Active Directory domain. For KDC detection to work, both the machine name and user name need to be mapped to the correct Kerberos realm name. To maximize success, use the Fully-Qualified Domain Name (FQDN) of the target machine, and the User Principal Name (UPN) of the user. Kerberos *may* work without those in certain conditions, but don't count on it.

## Sample lab environment

In my [lab environment](https://github.com/Devolutions/devolutions-labs), I have used the following to test:

 * IT-HELP-DC.ad.it-help.ninja as my domain controller
 * IT-HELP-TEST.ad.it-help.ninja as my destination RDP server
 * ad.it-help.ninja as my Active Directory DNS domain name
 * IT-HELP as my NetBIOS domain name (try hard not to use it)
 * ad.it-help.ninja as my Kerberos realm (same as DNS domain name)
 * ProtectedUser@ad.it-help.ninja, a user that is a member of the Protected Users group

IT-HELP-TEST.ad.it-help.ninja is the FQDN of the destination RDP server. Don't use the IP address (10.10.0.10), or just the machine name (IT-HELP-TEST). Yes, it takes longer to type, but start using the FQDN at all times from now on to avoid issues with Kerberos, you'll thank me later.

As for the user name format, ProtectedUser@ad.it-help.ninja is the UPN format, and IT-HELP\ProtectedUser is the NetBIOS format. I know it is very tempting to use IT-HELP\ProtectedUser (NetBIOS) instead of ProtectedUser@ad.it-help.ninja (UPN) and chances are it *may* work, but refrain from using it.

## Fixing DNS resolution

Windows machines joined to Active Directory have their DNS servers changed to point to the domain controller for internal DNS. Automatic KDC detection uses DNS SRV records which will only work if the Mac client is using the correct DNS servers from Active Directory. If you don't want to change your Mac DNS servers, you can always create a DNS resolver rule to use the domain controllers for DNS for all queries ending in "ad.it-help.ninja":

```bash
sudo mkdir -p /etc/resolver
sudo bash -c 'cat > /etc/resolver/ad.it-help.ninja <<EOF
domain ad.it-help.ninja
search ad.it-help.ninja
nameserver 10.10.0.3
EOF'
```

In this case, 10.10.0.3 is IT-HELP-DC.ad.it-help.ninja, the domain controller for my "ad.it-help.ninja" Active Directory domain. Another solution is to create new entries manually in the /etc/hosts file of the client:

```bash
10.10.0.3       IT-HELP-DC.ad.it-help.ninja
10.10.0.10      IT-HELP-TEST.ad.it-help.ninja
```

However, the hosts file can only be used to fix name resolution, which is not sufficient to make automatic DNS SRV detection work. Do not worry - KDC detection can work without DNS SRV detection, it just takes more work.

## Automatic DNS SRV KDC detection

Let's say you are in the ideal scenario: the Mac is configured to use the domain controller for DNS. Use the `nslookup` command to query DNS SRV records to confirm that it works, replacing "ad.it-help.ninja" with your Kerberos realm name:

```bash
nslookup -type=srv _kerberos._tcp.dc._msdcs.ad.it-help.ninja
Server:         10.10.0.3
Address:        10.10.0.3#53

_kerberos._tcp.dc._msdcs.ad.it-help.ninja       service = 0 100 88 it-help-dc.ad.it-help.ninja.
```

The DNS SRV record should point to the domain controller, or Kerberos KDC. If it is not the case, then DNS SRV detection is not working, and you will need manual KDC configuration instead.

## Manual KDC configuration

Create the /etc/krb5.conf file with the following contents, replacing "IT-HELP-DC.ad.it-help.ninja" with your domain controller, and "ad.it-help.ninja", "AD.IT-HELP.NINJA" with your lowercase and uppercase Kerberos realm names:

```bash
[libdefaults]
    dns_lookup_kdc = false
    dns_lookup_realm = false

[realms]
    ad.it-help.ninja = {
        kdc = tcp/IT-HELP-DC.ad.it-help.ninja
    }
    AD.IT-HELP.NINJA = {
        kdc = tcp/IT-HELP-DC.ad.it-help.ninja
    }

[domain_realm]
    .ad.it-help.ninja = ad.it-help.ninja
```

Let's explain the krb5.conf configuration file, section by section:

```bash
[libdefaults]
    dns_lookup_kdc = false
    dns_lookup_realm = false
```

The dns_lookup_kdc, dns_lookup_realm options are disabled to properly test that the configuration works without accidentally using DNS-based detection. You can leave them enabled if you want DNS SRV detection to be attempted.

```bash
[realms]
    ad.it-help.ninja = {
        kdc = tcp/IT-HELP-DC.ad.it-help.ninja
    }
    AD.IT-HELP.NINJA = {
        kdc = tcp/IT-HELP-DC.ad.it-help.ninja
    }
```

The Kerberos realm name is historically uppercase, but in practice, both lowercase and uppercase variants are mixed, especially with Active Directory. The problem is that GSSAPI implementations on platforms other than Windows tend to be case sensitive, which is why we register the realm *twice*. This is very important because even if you see successful Kerberos requests to the KDC in Wireshark, the Mac RDP client may still silently downgrade to NTLM because of a failed case sensitive comparison.

The other important part is the "tcp/" prefix which is used to force TCP instead of UDP as the transport. If you don't force TCP, you are likely to encounter issues where KDC requests sent over UDP are rejected with a maximum response size error, before falling back to TCP.

## Confirming Kerberos works

Once you have configured KDC detection (either automatic with DNS SRV or manual with krb5.conf), you can now test that Kerberos works using the `kinit` command to authenticate with your test user:

```bash
kinit ProtectedUser@ad.it-help.ninja
ProtectedUser@ad.it-help.ninja's password:***
```

If Kerberos authentication worked, you should now have a ticket listed by the `klist` command:

```bash
klist
Credentials cache: API:CAA29FD0-DE6E-40AF-8BD0-AD68D31522C2
        Principal: ProtectedUser@AD.IT-HELP.NINJA

  Issued                Expires               Principal
May  1 17:46:11 2024  May  1 21:46:11 2024  krbtgt/ad.it-help.ninja@AD.IT-HELP.NINJA
```

You are now ready to try authenticating from the Mac RDP client again. Don't forget to use the FQDN format for the host, and the UPN format for the user! If the Mac RDP client still fails but the `kinit` command works, make sure your krb5.conf file contains both lowercase and uppercase variants of the Kerberos realm, as described earlier.

## What if I don't have a KDC line-of-sight?

Well... you're out of luck for the Mac RDP client. In the Windows world, [KDC proxying](https://syfuhs.net/kdc-proxy-for-remote-access) is an option to provide a KDC line-of-sight for machines that are out of the Active Directory network, but the GSSAPI implementation in macOS doesn't support it properly. Microsoft has a [plan to deprecate NTLM by implementing the IAKerb Kerberos protocol extension](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/the-evolution-of-windows-authentication/ba-p/3926848), but we have yet to see it comr to fruition, and it's unclear if the Mac RDP client will be improved to support it. Your best solution is likely going to be a VPN, unfortunately.

## Devolutions Gateway is the way

Another solution path for simple cross-platform Kerberos support in RDP without a VPN is to use [Devolutions Gateway](https://devolutions.net/gateway/) with [Remote Desktop Manager](https://devolutions.net/remote-desktop-manager/) and [Devolutions Server](https://devolutions.net/server/). You get the security benefits of just-in-time RDP connections with KDC proxying integrated in our cross-platform RDP clients ([FreeRDP](https://www.freerdp.com/) and [IronRDP](https://github.com/Devolutions/IronRDP)) combined with our cross-platform Kerberos implementation ([sspi-rs](https://github.com/Devolutions/sspi-rs)) that supports KDC proxying, unlike the Mac RDP client. It is indeed a step up from using the Mac RDP client, but if you're serious about RDP security, it's definitely worth looking into.

## Conclusion

If you don't currently have a plan to significantly reduce or eliminate NTLM usage in your Active Directory environment, now is the time. NTLM security can't and won't be improved by Microsoft, so your only choice is to start using Kerberos today. Attackers are getting quite creative at chaining all kinds of NTLM-based attacks, such that when they gain initial access to your network, it's really a matter of time before it's game over. Disabling NTLM is easier said than done, but hopefully this blog post will make the work easier!
