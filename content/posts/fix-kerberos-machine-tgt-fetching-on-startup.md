+++
title = "Fix Kerberos Machine TGT Fetching on Startup"
slug = "fix-kerberos-machine-tgt-fetching-on-startup"
date = 2023-02-26
description = "Resolve RDP NLA issues on domain-joined devices outside the corporate network by configuring a scheduled task to fetch the Kerberos machine TGT at startup. This practical solution ensures secure, remote desktop access without compromising network security, detailed with step-by-step instructions and troubleshooting tips."

[taxonomies]
tags = ["Kerberos", "ActiveDirectory"]

[extra]
banner = "/images/banners/fix-kerberos-machine-tgt-fetching-on-startup.png"
+++

Is RDP NLA between domain-joined devices not working outside of the corporate network despite having configured a KDC proxy on both? This is a known issue where lsass.exe fails to fetch the Kerberos machine TGT at boot time, but it can be "fixed" with a scheduled task!

![RDP NLA Failure with broken Kerberos machine TGT](/images/posts/rdp-nla-failure-kerberos-machine-tgt.png)

Create a scheduled task with the following configuration:

Set user account to "SYSTEM"

![krbtgt scheduled task - general](/images/posts/krbtgt-scheduled-task-general.png)

Create a simple trigger at system startup

![krbtgt scheduled task - general](/images/posts/krbtgt-scheduled-task-triggers.png)

Create an action to run "klist.exe get krbtgt"

![krbtgt scheduled task - general](/images/posts/krbtgt-scheduled-task-actions.png)

Last but not least, set a condition to start only if a network connection is available

![krbtgt scheduled task - general](/images/posts/krbtgt-scheduled-task-conditions.png)

To be 100% sure that it works, enforce RDP NLA on the server, and then reboot (be ready to attach a physical keyboard + mouse + screen to undo this change in case RDP fails!). You can then try connecting from your client machine with RDP NLA, using the *machine FQDN*, not the IP!

![RDP NLA Required Server Side Setting](/images/posts/rdp-nla-required-server-side-setting.png)

If you attempt connecting with an IP address or a hostname other than the machine FQDN, or if your client machine is not configured with the KDC proxy properly, you will get "A certification authority could not be contacted for authentication". Edit the hosts file locally can do the trick if you don't feel like adding a DNS record:

![RDP NLA Failure IP Address Not FQDN](/images/posts/rdp-nla-failure-ip-address-not-fqdn.png)

Issues resulting from a failure to fetch Kerberos machine TGT at startup time go much beyond RDP NLA. If you see errors in the Windows event viewer that indicate a failure to fetch the Kerberos machine TGT on startup, just follow the same steps.

*this blog post is based on [this twitter thread](https://twitter.com/awakecoding/status/1629857517353201668)*
