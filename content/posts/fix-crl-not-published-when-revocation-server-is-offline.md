+++
title = "Fix CRL Not Published When Revocation Server Is Offline"
slug = "fix-crl-not-published-when-revocation-server-is-offline"
date = 2025-04-19
description = "Discover why CRL publishing silently fails when a certificate authority is offline at the scheduled time, leading to revocation check errors like CRYPT_E_REVOCATION_OFFLINE. This post explains the root cause, corrects common assumptions about AD CS scheduling, and walks through publishing CRLs over HTTP, adjusting distribution points, and automating recovery with PowerShell and scheduled tasks."

[taxonomies]
tags = ["ActiveDirectory", "Windows", "PowerShell", "CTO"]

[extra]
banner = "/images/banners/fix-crl-not-published-when-revocation-server-is-offline.png"
+++

> **TL;DR:** If your CRL isn't getting published and clients are failing revocation checks, your CA may have missed its scheduled publish time while offline — and AD CS won't retry. This blog post explains how to fix that, and avoid other common pitfalls.

Certificate revocation issues are fairly unpleasant to diagnose and fix, and in the Windows world, the investigation usually begins with a `certutil.exe -verify` command on a certificate file that outputs the following:

> The revocation function was unable to check revocation because the revocation server was offline. 0x80092013 (-2146885613 CRYPT_E_REVOCATION_OFFLINE)

If you've done this before, you will likely try flushing the CRL cache to resynchronize it now:

```powershell
certutil.exe "-urlcache" "crl" "delete"
certutil.exe "-setreg" "chain\ChainCacheResyncFiletime" "@now"
```

But this time, it didn’t work. You’re in luck — here are some CRL-related pitfalls in AD CS you probably didn't know about:
 * CRL renewal only works if AD CS is running at the scheduled publish date and time
 * LDAP CRL distribution is the default, and only works for domain-joined machines
 * HTTP delta CRL distribution is broken with the default IIS configuration
 * HTTP CRLs are only checked if they are listed first inside the certificate

## Installing Active Directory Certificate Services

If you've never installed Active Directory Certificate Services (AD CS) before, here's a quick way to do it using the [Install-AdcsCertificationAuthority](https://learn.microsoft.com/en-us/powershell/module/adcsdeployment/install-adcscertificationauthority) PowerShell cmdlet:

```powershell
$ConfirmPreference = "High"
Install-WindowsFeature -Name AD-Certificate -IncludeManagementTools
$Params = @{
    CAType = "EnterpriseRootCa";
    CryptoProviderName = "RSA#Microsoft Software Key Storage Provider";
    HashAlgorithmName = "SHA256";
    KeyLength = 2048;
    CACommonName = $Env:ComputerName;
}
Install-AdcsCertificationAuthority @Params -Force
```

Simple, right? You now have a certificate authority that *should* work just fine with domain-joined machines.

## Properly Distributing CRL over HTTP

By default, AD CS only distributes the Certificate Revocation List (CRL) over LDAP, which is only usable from domain-joined machines. If you want certificate revocation checks to work from anywhere, you'll need to distribute the CRL over HTTP. Here's a PowerShell code snippet to install IIS and create a site for CRL distribution over HTTP:

```powershell
# Install IIS to serve HTTP CRL
Install-WindowsFeature -Name 'Web-Server' | Out-Null
Remove-IISSite -Name "Default Web Site" -Confirm:$false
$CertSrvPath = "${Env:SystemRoot}\System32\CertSrv"
New-IISSite -Name 'CertSrv' -PhysicalPath $CertSrvPath -BindingInformation "*:80:"
& "${Env:SystemRoot}\system32\inetsrv\appcmd.exe" set config `
    -section:system.webServer/security/requestFiltering -allowDoubleEscaping:True /commit:apphost
Start-IISSite -Name 'CertSrv'
```

One very frustrating problem with CRL distribution over HTTP is the encoding of the '+' character in the *delta* CRL file. By default, IIS will not handle it properly, which is why we have to enable **allowDoubleEscaping**. Since the *base* CRL is first used, the problem only manifests itself later when the *delta* CRL is checked, and the client fails to fetch it.

Next, add the HTTP CRL distribution point, and make it first in the list, **before the LDAP CRL distribution point**:

```powershell
$LdapCrlDP = Get-CACrlDistributionPoint | Where-Object { $_.Uri -Like "ldap://*" }
Remove-CACrlDistributionPoint -Uri $LdapCrlDP.Uri -Force
$HttpCrlDP = Get-CACrlDistributionPoint | Where-Object { $_.Uri -Like "http://*/CertEnroll/*" }
Remove-CACrlDistributionPoint -Uri $HttpCrlDP.Uri -Force
Add-CACrlDistributionPoint -Uri $HttpCrlDP.URI -AddToCertificateCdp -AddToFreshestCrl -Force
$LdapAIA = Get-CAAuthorityInformationAccess | Where-Object { $_.Uri -Like "ldap://*" }
Remove-CAAuthorityInformationAccess -Uri $LdapAIA.Uri -Force
Restart-Service CertSvc
Start-Sleep -Seconds 10 # Wait for CertSvc to become ready again
```

Why does the HTTP CRL distribution point need to be *first* in the list? Believe it or not, if Windows sees the LDAP CRL distribution point listed first in a certificate and it fails to use it, it won't bother trying any of the other CRL distribution points. Last but not least, after restarting **CertSvc** and waiting a few seconds it to become ready again, you can now force republishing the CRLs:

```powershell
$CAConfigName = (certutil -getconfig 2>&1 | Select-String 'Config String:').ToString().Split('"')[1]
$CertAdmin = New-Object -COM "CertificateAuthority.Admin"
$CertAdmin.PublishCRLs($CAConfigName, $([DateTime]::UtcNow), 17)
$CertSrvPath = "${Env:SystemRoot}\System32\CertSrv"
Get-ChildItem "$CertSrvPath\CertEnroll\*.crl" | ForEach-Object { certutil.exe -f -dspublish $_.FullName }
```

If you try to run this without a waiting after the service restart, you may occasionally hit RPC errors. Waiting for the service to restart isn't enough for it to be fully ready — unfortunately, there's no obvious way to check for readiness.

## Fixing Broken CRL Publishing When Server Is Offline

Let's manually inspect the CRL using the `certutil.exe -URL` command and the HTTP URL for the CRL:

```powershell
certutil.exe -URL "http://IT-HELP-DC.ad.it-help.ninja/CertEnroll/IT-HELP-DC.crl"
```

Click **Retrieve**, then double-click the Base CRL or Delta CRL from the list to inspect its properties:

![CRL next publish date](/images/posts/crl-publish-certutil-next-crl-publish.png)

In that screenshot, we can see that the next CRL will be published on April 26th, 2025, at 10:29AM. Here's what took me years to figure out: **if the machine running AD CS is turned off during the next scheduled CRL publishing time and date, it will skip the CRL renewal and won't try again later**. You'd expect AD CS to detect the missed CRL publishing on startup — but it doesn't.

For an Active Directory lab environment in virtual machines that don't run 24/7, this is quite a problem. To fix it, create a scheduled task to run `certutil.exe -crl` on system startup, forcing AD CS to renew and publish CRLs:

```powershell
$TaskAction = New-ScheduledTaskAction -Execute "certutil.exe" -Argument "-crl"
$TaskTrigger = New-ScheduledTaskTrigger -AtStartup
$Params = @{
    Action      = $TaskAction
    Trigger     = $TaskTrigger
    User        = "NT AUTHORITY\SYSTEM"
    TaskName    = "Force AD CS CRL renewal"
    Description = "Force AD CS CRL renewal"
}
Register-ScheduledTask @Params
```

In a production environment, you may want to use a more intelligent trick to avoid a renewal when it is not needed. However, for a lab environment, this will make the sporadic CRL renewal failures causing revocation check errors go away.

## Closing thoughts

If you didn't find the answer you were looking for, I suggest reading [Resolving Issues Starting a CA due to an Offline CRL](https://stealthpuppy.com/resolving-issues-starting-ca-offline-crl/) by Aaron Parker, and bookmarking it. Active Directory Certificate Services is a product frozen in time, but it is the only one deeply integrated in Active Directory. One may wonder why it has so many pitfalls that didn't get fixed over the years despite being so widely used.
