+++
title = "RDP NLA with Azure AD: The PKU2U Nightmare"
slug = "rdp-nla-with-azure-ad-the-pku2u-nightmare"
date = 2023-08-10
+++

So, you've decided to joining systems to Azure AD, either as hybrid-joined (HAADJ) or as pure Azure AD joined (AADJ). The future is in the cloud, and the cloud is better (as long as it is Azure)! That's until you try using RDP to connect to your systems, only to receive a frustratingly persistent "Your credentials did not work" error. You've triple checked the password, and it really should work, but it just won't. Why? Welcome to the PKU2U nightmare: a temporary solution that became permanent in the Azure AD world. Yes, I know it's called Entra ID now, but for simplicy I'll stick to the terminlogy and acronyms most people are familiar with.

## Solution 1: Disable RDP NLA, and move on with your life

That's what [Scott Hanselman blogged about in 2020 when he hit the problem himself](https://www.hanselman.com/blog/how-to-remote-desktop-rdp-into-a-windows-10-azure-ad-joined-machine), so maybe just do the same? I'm only half-kidding: disabling RDP NLA is obviously bad, but Microsoft is guilty of creating a problem that didn't exist before without providing a suitable alternative solution. The reason why disabling RDP NLA works well is because you end up sending credentials to Winlogon on the server without doing any of the authentication process on the client. It turns out that's the way most people would like RDP to work in practice, except at Microsoft.

## Solution 2: Don't Disable RDP NLA, and make your life harder

So, you want to do the right thing, and make it work with RDP NLA? Fasten your seatbelt, as PKU2U is one hell of a beast from a parallel universe where common sense doesn't apply:

### Problem 1: PKU2U is not enabled on both client and server

PKU2U needs to be enabled on *both* the RDP client and server. Even though PKU2U is mandatory for RDP NLA + Azure AD to work, it is disabled by default in Windows.

Open the Group Policy Editor (gpedit.msc) and navigate to **Computer Configuration / Windows Settings / Security Settings / Local Policies / Security Options**, then enable **Network security: Allow PKU2U authentication requests to this computer to use online identities**:

![Allow PKU2U Group Policy](/images/posts/rdp-nla-aad-allow-pku2u-gpo.png)

Alternatively, you can enable PKU2U using the registry key using PowerShell:

```powershell
$Pku2uRegPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\Pku2u'
New-Item -Path $Pku2uRegPath -Force | Out-Null
Set-ItemProperty -Path $Pku2uRegPath -Name 'AllowOnlineID' -Value '1' -Type DWORD
```

Instead of using PowerShell, you can also download and import [EnablePku2u.reg](/files/EnablePku2u.reg) to set the registry key.

While the change should be applied immediately, a reboot is required on the server.

{{ mp4_video(path="/videos/posts/rdp-nla-aad-pku2u-disabled-issue.mp4", caption="RDP NLA + Azure AD: PKU2U disabled issue") }}

### Problem 2: Client not Azure AD workplace joined with same user

The second requirement for RDP NLA + Azure AD to work is that you are either logged in to Windows using the same Azure AD account, or that you are "workplace joined" with the same Azure AD user. There is unfortunately no way to automate this process, and it needs to be done in addition to supplying the full credentials during the RDP NLA connection process.

In the Settings app, naviguate to "Accounts > Email & Accounts", then click "Add a work or school account":

![AAD Workplace Join - 1](/images/posts/rdp-nla-aad-workplace-join1.png)

Enter your Azure AD credentials to sign in:

![AAD Workplace Join - 2](/images/posts/rdp-nla-aad-workplace-join2.png)

Wait for the Azure AD workplace join to complete:

![AAD Workplace Join - 3](/images/posts/rdp-nla-aad-workplace-join3.png)

If it worked, you should see the "You're all set!" dialog. Click "Done":

![AAD Workplace Join - 4](/images/posts/rdp-nla-aad-workplace-join4.png)

Once this is done, "dsregcmd /status" should return a "work account" entry.

![AAD Workplace Join - 5](/images/posts/rdp-nla-aad-workplace-join5.png)

The workplace join details can also be found in the registry:

![AAD Workplace Join - 6](/images/posts/rdp-nla-aad-workplace-join6.png)

You can query the Azure AD workplace join information using `dsregcmd.exe /status` or with PowerShell:

```powershell
$WorkplaceJoinReg = "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\WorkplaceJoin"
(Get-Item "$WorkplaceJoinReg\JoinInfo").GetSubkeyNames() | ForEach-Object {
    $WorkplaceThumbprint = $_
    $WorkplaceCertificate = Get-Item "cert:\CurrentUser\My\$WorkplaceThumbprint"
    $JoinInfo = Get-ItemProperty "$WorkplaceJoinReg\JoinInfo\$WorkplaceThumbprint"
    $WorkplaceTenantId = $JoinInfo.TenantId
    $WorkplaceUserEmail = $JoinInfo.UserEmail
    $TenantInfo = Get-ItemProperty "$WorkplaceJoinReg\TenantInfo\$WorkplaceTenantId"
    $WorkplaceTenantName = $TenantInfo.DisplayName
    Write-Host "WorkplaceThumbprint: $WorkplaceThumbprint"
    Write-Host "WorkplaceCertificate: $WorkplaceCertificate"
    Write-Host "WorkplaceUserEmail: $WorkplaceUserEmail"
    Write-Host "WorkplaceTenantId: $WorkplaceTenantId"
    Write-Host "WorkplaceTenantName: $WorkplaceTenantName"
}
```

As if this wasn't enough of a problem, you can only be workplace joined with up to 3 users at the same time:

{{ mp4_video(path="/videos/posts/rdp-nla-aad-workplace-join-limit.mp4", caption="Azure AD workplace join account limit") }}

### Problem 3: Incorrect Azure AD username format

The Microsoft RDP client needs to know that you are connecting with an Azure AD user, otherwise it won't use [CloudAP, this little black box that talks to Azure](https://syfuhs.net/how-azure-ad-windows-sign-in-works). In mstsc, you need to use 'AzureAD\user@contoso.com', if you use 'user@contoso.com', authentication will fail. The 'AzureAD\' prefix is the only thing that tells mstsc it's an Azure AD user and not a "regular" user account.

In a .RDP file, it's a bit trickier. You need to use the ".\AzureAD\" prefix instead of "AzureAD\" like in the mstsc UI, and leave the domain empty:

```
username:s:.\AzureAD\user@contoso.com
domain:s:
```

In Remote Desktop Manager, we've added the "Azure AD Host" option to automatically set the correct "AzureAD\" prefix with different connection modes (embedded, external, etc):

![RDM RDP Azure AD Host Option](/images/posts/rdp-nla-aad-rdm-azure-ad-host.png)

Don't forget that even if PKU2U is enabled, it is *not* doing SSO: you still need to provide the full credentials when connecting.

### Problem 4: Third-Party Application Support

You're on Linux, using FreeRDP? Microsoft says "tough luck" and never bothered properly documenting PKU2U. Yes, there are some links to [generic underlying specifications](https://tools.ietf.org/id/draft-zhu-pku2u-09.txt), but a *real* implementation requires a complete equivalent of the CloudAP black box mentioned earlier with X.509 certificates obtained from Azure AD. This means opening up the part of the Azure AD workplace join process such that third-party applications can do it all without Windows, and maintain their own [Primary Refresh Token (PRT) cache](https://learn.microsoft.com/en-us/azure/active-directory/devices/concept-primary-refresh-token). To be fair, even if Microsoft were to provide an open source SDK for this, it would still be incredibly complex when all the user wants is to pass full credentials to an RDP client. This has nothing to do with NTLM versus Kerberos, as PKU2U is an entirely different thing that simply has no tangible third-party vendor support.

## Closing Thoughts: What about RDS AAD SSO?

[What about it?](https://learn.microsoft.com/en-us/azure/virtual-desktop/configure-single-sign-on) It doesn't use PKU2U which is good, but that's about it. It's not ready for prime time is all I can say, there is not even a way to logout from the client right now, so once you're logged in with that fancy FIDO2 key... your client system will keep doing SSO to that target machine, no questions asked, until some administrator invalidates your token from the Azure AD tenant. As for third-party integration, it's non-existing and not possible at this point, beyond setting `enablerdsaadauth:i:1` in the .RDP file to turn it on. In Remote Desktop Manager, we've exposed RDS AAD authentication as the "Enable Azure AD SSO" option:

![RDM RDP Azure AD SSO](/images/posts/rdp-nla-aad-rdm-enable-aad-sso.png)

RDS AAD authentication is a longer topic that I'll come back to another time. For now, unless you want FIDO2 support, you're probably better off with the older PKU2U protocol.
