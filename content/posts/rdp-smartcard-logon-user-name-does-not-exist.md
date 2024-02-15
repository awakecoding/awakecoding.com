+++
title = "RDP Smartcard Logon: User Name Does Not Exist"
slug = "rdp-smartcard-logon-user-name-does-not-exist"
date = 2023-08-04
description = "Navigate through the confusion of \"the specified user name does not exist\" error during RDP smartcard logon, offering insights into common misinterpretations and actionable solutions. This post breaks down error messages, suggests disabling strict KDC validation, and guides on certificate trust validation, ensuring successful authentication with practical steps and PowerShell commands."

[extra]
banner = "/images/banners/rdp-smartcard-logon-user-name-does-not-exist.png"
+++

## Misleading Error Messages, Analyzed

So, you've hit the dreaded "the specified user name does not exist" error with RDP smartcard authentication:

![RDP Logon Error: The specified user name does not exist](/images/posts/rdp-sc-the-specified-user-name-does-not-exist-error.png)

You then likely went through the same thought process I did:

> The specified user name does not exist.

Yes it does, here's my client certificate that proves it?

> Verify the user name and try logging in again.

What do you want me to do, select the same certificate again?

> If the problem continues, contact your system administrator or technical support.

Guess who's reading this blog post now? I'm the "system administrator or technical support"!

Alternatively, you may have hit the "NLA required, DC cannot be contacted" error instead:

![RDP Logon Error: NLA required, DC cannot be contacted](/images/posts/rdp-sc-nla-required-dc-cannot-be-contacted-error.png)

> The remote computer that you are trying to connect to requires Network Level Authentication (NLA),

I sure hope it requires NLA, you're not supposed to disable it! What did you expect?

> but your Windows domain controller cannot be contacted to perform NLA.

Hum... don't you mean NLA + **Kerberos**? NLA + NTLM works without a DC line-of-sight last time I checked?

> You can try connecting to the remote computer using your username and password instead.

Ah! You really mean to make me try NTLM with password-based authentication instead because Kerberos doesn't work!

Jokes aside, what do these error messages mean? Is it true that the specified user name does not exist, or that the domain controller cannot be contacted? Maybe, but the exact same errors are thrown for a wide variety of unrelated reasons, misleading users into fixing imaginary problems.

## Please, Just Make It Work!

Do the following conditions apply to your environment?

1. Is your client system joined to the *same* domain as the target computer? (No)
2. Does your client system have a line-of-sight with the target domain controller? (Yes)

If you do not have a line-of-sight with the target domain controller, then work on fixing that first and then come back here (out-of-scope for this blog).

If your machine is joined to the same domain as the target computer, then it's possible that the issue truly is with [X.509 client certificate name mapping](https://learn.microsoft.com/en-us/windows/security/identity-protection/smart-cards/smart-card-certificate-requirements-and-enumeration#client-certificate-mappings) (also out-of-scope for this blog).

Otherwise, the most likely cause of the problem is with **trust validation of the certificate used by the KDC server for PKINIT**, so let's **disable strict KDC validation** on the client:

Open the Group Policy Editor (gpedit.msc) and navigate to **Administrative Templates / System / Kerberos**:

![Kerberos require strict KDC validation GPO](/images/posts/rdp-sc-kerberos-require-strict-kdc-validation-gpo.png)

Set the **Require strict KDC validation** policy to **Disabled**, then reboot. Try connecting again, and see if the error is gone. If it worked, congratulations, we have a winner!

If it doesn't work instantly, don't give up, sometimes the issue is mixed with unreliable domain controller detection. To check if this is the case, open the Event Viewer (eventvwr.msc) and navigate to **Application and Services Logs / Microsoft / Windows / Security-Kerberos / Operational**. If the log is empty, right-click **Operational** and then select **Enable Log**, after which you can trigger the problem again.

![Kerberos client could not locate DC warning](/images/posts/rdp-sc-kerberos-client-could-not-locate-dc-warning.png)

If you see "The Kerberos client could not locate a domain controller for domain XYZ: 0xC000005E. Kerberos authentication requires communicating with a domain controller." then there's an issue with the domain controller line-of-sight, or with the detection of the domain controller when it's reachable. Make sure that those warnings are gone before continuing, as they will trigger the error condition.

## Fixing Strict KDC Validation

With strict KDC validation enabled, you should be able to see errors like this in the Windows event viewer, under **Application and Services Logs / Microsoft / Windows / Security-Kerberos / Operational**:

![Kerberos KDC cert trust validation error](/images/posts/rdp-sc-kerberos-kdc-cert-trust-validation-error.png)

"Trust validation of the certificate for the Kerberos Key Distribution Center (KDC) XYZ failed: 0x800B0112. Use the CAPI2 diagnostic traces to identify the reason for the validation failure."

As suggested, let's enable CAPI2 event logging under **Application and Services Logs / Microsoft / Windows / CAPI2 / Operational**. right-click **Operational** and then select **Enable Log**, and watch a flood of new events coming in when you refresh. This is a chatty event log which you'll want to disable once you're done. Reproduce the issue, refresh the CAPI2 logs, and then look for errors similar to this:

![RDP CAPI2 cert chain policy NT Auth error](/images/posts/rdp-sc-capi2-cert-chain-policy-nt-auth-error.png)

According to the [CertVerifyCertificateChainPolicy function](https://learn.microsoft.com/en-us/windows/win32/api/wincrypt/nf-wincrypt-certverifycertificatechainpolicy), the **CERT_CHAIN_POLICY_NT_AUTH** cert chain policy

> checks if the second element in the chain, the CA that issued the end certificate, is a trusted CA for Windows NT Authentication. A CA is considered to be trusted if it exists in the "NTAuth" system registry store found in the CERT_SYSTEM_STORE_LOCAL_MACHINE_ENTERPRISE store location.

In plain English? You need to install the issuer CA certificate into the NTAuth store of your client. No, it is *not* enough to installed the root CA certificate into the machine trusted root CAs, you need to do both or validation will fail. Richard Hicks has a nice blog post on the [NTAuth store](https://directaccess.richardhicks.com/tag/ntauth-store/).

### Importing Issuer CA in NTAuth Store

Here's how you can import the issuer CA certificate into the NTAuth store of your client, from an elevated shell:

```powershell
certutil.exe -enterprise -addstore NTAuth .\ISSUER-CA.cer
```

You can also view the list of certificates in the NTAuth store:

```powershell
certutil.exe -viewstore -enterprise ntauth
```

Last but not least, you can select a certificate to be removed from the NTAuth store:

```powershell
certutil.exe -viewdelstore -enterprise ntauth
```

The NTAuth certificate store is not visible in the regular Windows certificate store view, and it cannot be interacted with directly in PowerShell like other certificate stores. The easiest way to deal with it is the certutil.exe command, unfortunately. If you're curious, the NTAuth store is located under HKLM:\SOFTWARE\Microsoft\SystemCertificates\ROOT\Certificates in the registry. For domain-joined machines, the contents of the local NTAuth store automatically include the NTAuth certificates published in Active Directory.

### Importing Root CA in Machine Trusted Root CAs

We haven't mentioned it previously, but the certificates used for smartcard authentication need to be trusted on the client, so the root CA certificate needs to imported into the machine trusted root CAs. Open the local machine certificates (certlm.msc), then navigate to **Trusted Root Certification Authorities / Certificates**. Right-click **Certificates**, select **All Tasks / Import...**, and then import your root CA certificate.

![Machine Trusted Root CAs](/images/posts/rdp-sc-machine-trusted-root-cas-import.png)

You can also do the same using an elevated PowerShell terminal:

```powershell
Import-Certificate -FilePath .\ROOT-CA.cer -CertStoreLocation "cert:\LocalMachine\Root"
```

If you sign leaf certificates directly from the root CA, then your issuer CA is the same as the root CA, but oftentimes PKI deployments will use an issuer CA to sign leaf certificates, where the issuer CA is signed by the root CA. Don't confuse the two, and make sure to put the issuer CA certificate into the NTAuth store, not the root CA, if they're not the same.

## Investigating Further, if Necessary

If you are unlucky enough to have a problem that wasn't related to strict KDC validation, you will need to keep investigating further. There are many related problems, especially the issue of providing a domain controller line-of-sight, that require their own blog posts. My recommendation would be to make use of the same logs shown in the event viewer to diagnose the issues, and ignore the misleading error messages. Don't go down the same rabbit hole I did, trying to find issues with X.509 certificate name mapping when there was none.
