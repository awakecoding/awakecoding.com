+++
title = "Windows Hello: Cloud Kerberos Trust, or Key Trust?"
slug = "windows-hello-cloud-kerberos-trust-or-key-trust"
date = 2023-05-15
+++

So you've just enabled [Windows Hello for Business](https://learn.microsoft.com/en-us/windows/security/identity-protection/hello-for-business/hello-overview) through Intune using a [Cloud Kerberos trust deployment](https://learn.microsoft.com/en-us/windows/security/identity-protection/hello-for-business/hello-hybrid-cloud-kerberos-trust) which should work from anywhere once the initial setup is done. You test it with a few users and it works well, so you decide to enable it company-wide, only to be flooded with issues the next day when people try logging in from home:

* Something went wrong and your PIN isn't available (status: 0xC000005E, substatus: 0x0).
* We can't sign you in with this credential because your domain isn't available.
* That option is temporarily unavailable. For now, please use a different method to sign in.

Does that sound familiar? To make it even more confusing, connecting with a VPN helps, but it makes no sense because a domain controller line-of-sight should not be required for the Cloud Kerberos trust deployment type. In our case, we had multiple other issues with the camera, fingerprint and even the PIN authentication factors, even when trying to log in at work. Finding the root cause of the problem was hard because symptoms would vary a lot.

The first thing you want to double-check is the Windows Hello for Business deployment type on the affected system. Open the Windows Event Viewer, and navigate to **Application and Services Logs / Microsoft / Windows / HelloForBusiness / Operational**:

![WHfB Account Has Cloud TGT True](/images/posts/whfb-account-has-cloud-tgt-true.png)

If you don't see **Account has Cloud TGT: True** then you don't have a cloud Kerberos trust deployment, and most likely ended up with a key trust deployment instead. For some reason, the Intune configuration didn't apply properly, and the quickest solution is to set a local group policy manually before re-doing the Windows Hello for Business setup from scratch. Open the Group Policy Editor (gpedit.msc) and navigate to **Administrative Templates / Windows Components / Windows Hello for Business**:

![WHfB Use Cloud Trust On-Premises](/images/posts/whfb-use-cloud-trust-on-premises.png)

Set "Use cloud trust for on-premises authentication" to "enabled". You can leave "Use certificate for on-premises authentication" untouched, but what matters is that [when both of these group policies are not configured, Windows Hello for Business will default to a key trust deployment](https://msendpointmgr.com/2023/03/04/cloud-kerberos-trust-part-3/). This means that if the Intune configuration didn't get applied correctly, all of your users setting up Windows Hello will... end up with the wrong deployment type, and hit many issues that shouldn't happen normally.

Alternatively, you can achieve the same in PowerShell by setting the **UseCloudTrustForOnPremAuth** registry key directly:

```powershell
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork' -Name UseCloudTrustForOnPremAuth -Value 1 -Force
```

Instead of using PowerShell, you can also download and import [UseCloudTrustForOnPremAuth.reg](/files/UseCloudTrustForOnPremAuth.reg) to set the registry key.

In order to switch from a [key trust deployment](https://learn.microsoft.com/en-us/windows/security/identity-protection/hello-for-business/hello-hybrid-key-trust) to a [cloud Kerberos trust deployment](https://learn.microsoft.com/en-us/windows/security/identity-protection/hello-for-business/hello-hybrid-cloud-kerberos-trust), you must first delete the Windows Hello container using the `certutil.exe -DeleteHelloContainer` command:

![WHfB certutil Delete Hello Container](/images/posts/whfb-certutil-delete-hello-container.png)

Once the Windows Hello container is deleted, you can log out or reboot, and then login again. The Windows Hello for Business setup should normally appear - just follow the steps normally. If you encountered issues with the camera before, maybe only bother setting up the fingerprint (if available) and the PIN for now. You can then confirm that your account has a cloud TGT using the previous method show, or by navigating to **Application and Services Logs / Microsoft / Windows / User Device Registration / Admin** in the Windows Event Viewer:

![WHfB User Device Registration Cloud TGT](/images/posts/whfb-user-device-registration-cloud-tgt.png)

If you see **User account had Cloud TGT: Yes**, then congratulations, you now have Windows Hello for Business configured with the right deployment type, which should normally resolve the unexpected issues!
