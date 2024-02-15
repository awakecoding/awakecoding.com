+++
title = "Active Directory Kerberos KDC certificate selection"
slug = "active-directory-kerberos-kdc-certificate-selection"
date = 2023-09-06
updated = 2023-09-07

[extra]
banner = "/images/banners/active-directory-kerberos-kdc-certificate-selection.png"
+++

So, you've decided to embark on a quest to reliably select a specific KDC certificate in Active Directory, because randomly-selected certificates that you *think* you have control over are not a desirable thing? Here's what happened to the last person that went down this path:

![Kerberos KDC he tried selecting a kdc certificate](/images/posts/ad-pkinit-he-tried-selecting-a-kdc-certificate.jpg)

The Kerberos KDC certificate is used in PKINIT, a Kerberos extension used in [Windows smartcard authentication](https://learn.microsoft.com/en-us/windows/security/identity-protection/smart-cards/smart-card-architecture), among other things. Contrary to popular belief, it is possible to select a *different* certificate for PKINIT and LDAPS, but the magical recipe had long been lost to time.

Buckle up, because if you thought [selecting a specific LDAPS server certificate](https://awakecoding.com/posts/active-directory-ldaps-certificate-selection-deep-dive/) in Active Directory was painful, this is nothing in comparison.

## Analysis Technique

I have used [IDA Pro](https://hex-rays.com/ida-pro/) to look at the specific private functions located in kdcsvc.dll:
 * KdcInitializeCerts
 * KdcMyStoreWaitHandler
 * KdcEventWriteKdcCertLog
 * KdcCheckKdcCertificate
 * KdcCheckLegacyKdcCertificate
 * KdcGetKdcCertificate
 * KdcCheckPkinitPreAuthData

Please note that the KDC service is hosted inside lsass.exe despite being primarily handled by the code from kdcsvc.dll. I have mostly done static analysis combined with a lot of PowerShell code to try and confirm the actual application behavior.

## Preparing Test Certificates

To properly test the KDC service selects its certificate from multiple valid candidates, I have duplicated the built-in "Kerberos Authentication" certificate template with the following modifications:

 * On the **Request Handling** tab, check **Allow private key to exported**
 * On the **Subject Name** tab, select **Supply in the request**

![Kerberos Certificate Template - Allow Private Key Export](/images/posts/ad-pkinit-kerberos-auth-cert-template-allow-export.png)

I have then manually generated 5 certificates with numbers from to 1 to 5 to make them easier to distinguish. The certificate subject name and subject alternative names (SANs) are not relevant to the selection process itself, even if invalid names can cause trouble down the road. To manually specify valid subject name information, generate a certificate using the original "Kerberos Authentication" built-in template and then use the same values. When **Subject Name** is set to **Build from Active Directory information** in the template, only SANs are used, with no subject name:

![Kerberos Certificate Template - Subject Name Information](/images/posts/ad-pkinit-kerberos-auth-cert-template-subject-name.png)

Last but not least, to test certificate selection behavior with the *same* certificates, I have exported the test certificates to .pfx files with their private keys:

![Kerberos Test Certificates](/images/posts/ad-pkinit-kerberos-test-server-certificates.png)

Now that the certificates are prepared, I am free to delete them from the Windows certificate store and re-import them as desired to see what happens.

## KDC Certificate Event Logs

The KDC service only looks in the local machine personal certificate store (cert:\LocalMachine\My) for its KDC certificate, which is different from the [LDAPS certificate selection process](https://awakecoding.com/posts/active-directory-ldaps-certificate-selection-deep-dive/) that looks in both the NTDS service certificate store and only then the local machine personal certificate store.

So, how does one tell which KDC certificate was selected? Believe it or not, this time, there are logs you can enable! In the Windows Event Viewer (eventvwr.msc), go to **Applications and Services Logs / Microsoft / Windows / Kerberos-Key-Distribution-Center**, right-click Operational, then select **Enable Log**:

 > The Key Distribution Center (KDC) uses the below KDC certificate for smart card or certificate authentication.

![Windows Event Viewer - KDC selected certificate](/images/posts/ad-pkinit-kerberos-kdc-certificate-event-viewer.png)

Once the logs are enabled, you can reboot the domain controller, or force a KDC certificate reload by "touching" the certificate store, causing new events to appear in the Event Viewer (don't forget to refresh!):

```powershell
$dummyCert = New-SelfSignedCertificate -DnsName "dummy.local" -CertStoreLocation "cert:\LocalMachine\My"
Get-ChildItem -Path "cert:\LocalMachine\My" | Where-Object { $_.Thumbprint -eq $dummyCert.Thumbprint } | Remove-Item
```

You can also get the thumbprint of the currently selected KDC certificate in PowerShell by extracting it from the last Windows event:

```powershell
$KdcLogName = 'Microsoft-Windows-Kerberos-Key-Distribution-Center/Operational'
Get-WinEvent -FilterHashtable @{LogName=$KdcLogName; ID=302} -MaxEvents 1 | ForEach-Object {
    $_.Properties[2].Value
}
```

The KDC service watches the local machine personal certificate store (cert:\LocalMachine\My) for changes using the [CertControlStore function with the CERT_STORE_CTRL_NOTIFY_CHANGE type](https://learn.microsoft.com/en-us/windows/win32/api/wincrypt/nf-wincrypt-certcontrolstore) and calls the internal KdcMyStoreWaitHandler function when triggered.

 > The Key Distribution Center (KDC) cannot find a suitable certificate to use. This KDC is not enabled for smart card or certificate authentication.

![KDC no suitable certificate found warning event](/images/posts/ad-pkinit-kerberos-warning-no-suitable-certificate-found.png)

 > The Key Distribution Center (KDC) failed to validate its current KDC certificate. This KDC might not be enabled for smart card or certificate authentication.

![KDC certificate revocation check failure event](/images/posts/ad-pkinit-kerberos-error-certificate-revocation-check.png)

## Enumerating KDC Certificates

The KDC service calls [CertEnumCertificatesInStore](https://learn.microsoft.com/en-us/windows/win32/api/wincrypt/nf-wincrypt-certenumcertificatesinstore) to enumerate certificates from the local machine personal store, and picks the *first* valid KDC server certificate. Easy enough, right? Let's call the same Windows API from PowerShell to enumerate the certificates and filter them in the same way `KdcMyStoreWaitHandler` does it:

```powershell
Import-Module -Name Microsoft.PowerShell.Security

Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    
    public class Crypt32 {
        [DllImport("crypt32.dll", CharSet = CharSet.Auto, SetLastError = true)]
        public static extern IntPtr CertOpenStore(
            int storeProvider,
            int messageAndCertEncodingType,
            IntPtr cryptProvHandle,
            int certStoreFlags,
            string storeName);
            
        [DllImport("crypt32.dll", SetLastError = true)]
        public static extern IntPtr CertEnumCertificatesInStore(
            IntPtr storeProvider,
            IntPtr prevCertContext);
            
        [DllImport("crypt32.dll", SetLastError = true)]
        public static extern bool CertCloseStore(
            IntPtr certStoreHandle,
            int flags);
    }
"@

function Get-KdcCertStoreEnumeratedCerts {
    [CmdletBinding()]
    Param(
        [switch] $SkipFilter
    )

    $storeProvider = 0xA # CERT_STORE_PROV_SYSTEM
    $storeFlag = 0x20000 -bor 1 # CERT_SYSTEM_STORE_LOCAL_MACHINE | CERT_STORE_READONLY_FLAG
    $storeHandle = [Crypt32]::CertOpenStore($storeProvider, 0, [IntPtr]::Zero, $storeFlag, "MY")

    if ($storeHandle -eq [IntPtr]::Zero) {
        throw "Failed to open certificate store"
    }

    try {
        $certContext = [Crypt32]::CertEnumCertificatesInStore($storeHandle, [IntPtr]::Zero)
        while ($certContext -ne [IntPtr]::Zero) {
            $cert = (New-Object System.Security.Cryptography.X509Certificates.X509Certificate2 -ArgumentList $certContext)
            if ($SkipFilter -or ($cert.HasPrivateKey -and
                ($cert.EnhancedKeyUsageList.ObjectId -contains "1.3.6.1.5.2.3.5"))) { # KDC Authentication
                Write-Output $cert
            }
            $certContext = [Crypt32]::CertEnumCertificatesInStore($storeHandle, $certContext)
        }
    }
    finally {
        [void][Crypt32]::CertCloseStore($storeHandle, 0)
    }
}
```

Let's give our new `Get-KdcCertStoreEnumeratedCerts` PowerShell cmdlet a try, and list candidate KDC certificates:

```powershell
Get-KdcCertStoreEnumeratedCerts | Select-Object -Property Thumbprint,Subject,SerialNumber

Thumbprint                               Subject          SerialNumber
----------                               -------          ------------
E7BD43BC57EC891EDD630CD8A58F264550A9214B CN=IT-HELP-TEST1 2B0000002FEB4AA6D7E7A1177400000000002F
9FDEBF3E1FF9C1124E582D1E725D00A1601192CB CN=IT-HELP-TEST3 2B00000031C26575890844C2E5000000000031
9CEAA4D79905047605671A3FC8AFCB1D39FAF4A8 CN=IT-HELP-TEST5 2B0000003356E7262CEB5B1EE1000000000033
78690FD0A7CE804D02511E03662801162D6A25D6 CN=IT-HELP-TEST4 2B000000328F9E1508D59AACEC000000000032
4020607270DCCDB7EF0B383EAB3AF88F62BF52E4 CN=IT-HELP-TEST2 2B00000030B74823097E00754F000000000030
```

Notice how the ordering doesn't seem to follow a specific pattern. If you look at the certificate store registry keys, we can see they are in the *reverse* order than what `CertEnumCertificatesInStore` returns:

![Kerberos certificate store ordering registry keys](/images/posts/ad-pkinit-kerberos-cert-store-ordering-registry.png)

So, which order is the correct one to predict KDC server certificate selection? Neither, because experimentally, the order doesn't match the KDC service certificate selection ordering! We'll come back to this later, since we still need to cover certificate validation rules.

## KDC Certificate Validation

Our previous `Get-KdcCertStoreEnumeratedCerts` PowerShell cmdlet enumerates candidate KDC certificates with some filtering, but it does not *validate* them. The subject name and subject alternative names on the certificate are *not* checked, so dummy certificates with incorrect subject names could accidentally be selected if you're not careful.

### CA Chain

The root CA needs to be in the machine **Trusted Root Certification Authorities** store, and the issuer CA needs to be in the machine **Intermediate Certification Authorities** store. The CA chain also needs to suitable for Kerberos authentication with the right EKU (1.3.6.1.5.2.3.5).

### NTAuth Store

The issuer CA certificate needs to be in the NTAuth store of the domain controller, otherwise [CertVerifyCertificateChainPolicy](https://learn.microsoft.com/en-us/windows/win32/api/wincrypt/nf-wincrypt-certverifycertificatechainpolicy) with CERT_CHAIN_POLICY_NT_AUTH will fail. This is the exact same requirement [for strict KDC validation on the client that can result in "the specified user name does not exist" errors in mstsc](https://awakecoding.com/posts/rdp-smartcard-logon-user-name-does-not-exist/).

You can view the list of certificates in the machine NTAuth store using `certutil.exe -viewstore -enterprise ntauth`.

If your issuer CA certificate is missing from the NTAuth store, you can add it from an elevated shell with the

```powershell
certutil.exe -enterprise -addstore NTAuth .\ISSUER-CA.cer
```

### Revocation Checks

Certificate revocation checks need to work during the certificate selection process. This can be a problem during boot time, if the check happens before the network is fully available. For CRL-based checks, the **CRLTimeoutPeriod** registry key can be used to set a timeout:

```powershell
$KdcRegPath = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kdc\Parameters'
Set-ItemProperty -Path $KdcRegPath -Name 'CRLTimeoutPeriod' -Value '15' -Type DWORD
```

You can also disable revocation checking by the KDC service when it selects its KDC certificate:

```powershell
$KdcRegPath = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kdc\Parameters'
Set-ItemProperty -Path $KdcRegPath -Name 'UseCachedCRLOnlyAndIgnoreRevocationUnknownErrors' -Value '1' -Type DWORD
```

However, you should not leave revocation checking issues unresolved, as they will likely cause problems with the Kerberos clients down the road.

## Legacy KDC Certificates

Domain controllers with AD CS enabled usually have a certificate generated using the **Domain Controller** built-in template. This is a *legacy* certificate, identified as such using the [certificate template name extension](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-wcce/3aec3e50-511a-42f9-a5d5-240af503e470) (1.3.6.1.4.1.311.20.2) with the string value **DomainController**:

![Kerberos Legacy KDC certificate](/images/posts/ad-pkinit-kerberos-legacy-kdc-certificate.png)

Unlike "modern" KDC certificates, legacy KDC certificates do not have the Kerberos authentication EKU (1.3.6.1.5.2.3.5). The KDC service selects the first legacy KDC certificate only if no suitable modern KDC certificate can be found in the certificate store. Since legacy certificates require **DomainController** as the template name encoded inside the X.509 certificate, it is not possible to use a custom template, as it would result in a different name. For all of these reasons, it is recommended to use modern KDC certificates generated using the **Kerberos Authentication** built-in template (or equivalent).

## KDC Certificate Selection

Through a lot of trial and error, and I have devised a method to select a specific KDC certificate. I can't explain why, but experimentally, **the certificate ordering as seen by the KDC service matches the certificate import order**. In other words, the first suitable certificate imported in the certificate store will be picked. This means that if we export, delete and re-import all the *other* certificates, we should have a working `Select-KdcCertificate` cmdlet! Here's the additional PowerShell code for KDC certificate selection:

```powershell
function Reset-KdcCertificate {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true, Position=0)]
        [string] $Thumbprint
    )

    $Certificate = Get-Item "cert:\LocalMachine\My\$Thumbprint"

    if ($Certificate -eq $null) {
        throw "Certificate $Thumbprint count not be found!"
    }

    $SerialNumber = $Certificate.SerialNumber
    $ExportPath = Join-Path $Env:TEMP $Thumbprint
    Export-Certificate -Cert $Certificate -FilePath $ExportPath | Out-Null
    Remove-Item -Path $Certificate.PSPath # delete cert, but leave private key intact
    Import-Certificate -FilePath $ExportPath -CertStoreLocation "cert:\LocalMachine\My" | Out-Null
    & certutil.exe -repairstore My $SerialNumber | Out-Null # relink cert with private key
    Remove-Item $ExportPath -ErrorAction SilentlyContinue
}

function Select-KdcCertificate {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true, Position=0)]
        [string] $Thumbprint
    )

    $Certificate = Get-Item "cert:\LocalMachine\My\$Thumbprint"

    if ($Certificate -eq $null) {
        throw "Certificate $Thumbprint count not be found!"
    }

    $CandidateThumbprints = Get-KdcCertStoreEnumeratedCerts | Select-Object -ExpandProperty Thumbprint
    $CandidateThumbprints | Where-Object { $_ -ne $Thumbprint } | ForEach-Object { Reset-KdcCertificate $_ }
}

function Get-SelectedKdcCertificate {
    [CmdletBinding()]
    Param()

    $KdcLogName = 'Microsoft-Windows-Kerberos-Key-Distribution-Center/Operational'
    Get-WinEvent -FilterHashtable @{LogName=$KdcLogName; ID=302} -MaxEvents 1 | ForEach-Object {
        $Thumbprint = $_.Properties[2].Value
        Get-Item "cert:\LocalMachine\My\$Thumbprint"
    }
}
```

The tricky part is to remove certificates from the store without touching the private key, and to re-import the certificate [with a proper link to the same private key](https://learn.microsoft.com/en-us/troubleshoot/developer/webapps/iis/development/assign-certificate-private-key). Some certificates also don't have exportable private keys, so even if wanted to make a temporary copy of the keys, it would not be possible. Let's give those new PowerShell cmdlets a try!

```powershell
PS > Get-KdcCertStoreEnumeratedCerts | Select-Object -Property Thumbprint,Subject

Thumbprint                               Subject
----------                               -------
E7BD43BC57EC891EDD630CD8A58F264550A9214B CN=IT-HELP-TEST1
9FDEBF3E1FF9C1124E582D1E725D00A1601192CB CN=IT-HELP-TEST3
9CEAA4D79905047605671A3FC8AFCB1D39FAF4A8 CN=IT-HELP-TEST5
78690FD0A7CE804D02511E03662801162D6A25D6 CN=IT-HELP-TEST4
4020607270DCCDB7EF0B383EAB3AF88F62BF52E4 CN=IT-HELP-TEST2

PS > Get-SelectedKdcCertificate | Select-Object -Property Thumbprint,Subject

Thumbprint                               Subject
----------                               -------
E7BD43BC57EC891EDD630CD8A58F264550A9214B CN=IT-HELP-TEST1
```

The currently selected certificate is IT-HELP-TEST1 (E7BD43BC57EC891EDD630CD8A58F264550A9214B). Let's select IT-HELP-TEST5 instead (9CEAA4D79905047605671A3FC8AFCB1D39FAF4A8) using `Select-KdcCertificate`:

```powershell
PS > Select-KdcCertificate -Thumbprint 9CEAA4D79905047605671A3FC8AFCB1D39FAF4A8
PS > Get-SelectedKdcCertificate | Select-Object -Property Thumbprint,Subject

Thumbprint                               Subject
----------                               -------
9CEAA4D79905047605671A3FC8AFCB1D39FAF4A8 CN=IT-HELP-TEST5
```

It worked! Now let's try it with IT-HELP-TEST3 (9FDEBF3E1FF9C1124E582D1E725D00A1601192CB), just to be sure it's not a fluke:

```powershell
PS > Select-KdcCertificate -Thumbprint 9FDEBF3E1FF9C1124E582D1E725D00A1601192CB
PS > Get-SelectedKdcCertificate | Select-Object -Property Thumbprint,Subject

Thumbprint                               Subject
----------                               -------
9FDEBF3E1FF9C1124E582D1E725D00A1601192CB CN=IT-HELP-TEST3
```

It worked again! We've finally cracked it!

## Closing Thoughts

This blog has been way harder to write than I originally expected, mostly because I couldn't figure out the certificate ordering. Active Directory is arguably one of the most important Microsoft products in existence alongside Windows, but even then, things as simple as selecting a certificate in a predictable and reliable manner have been overlooked. It's not rocket science, a simple [registry key with a certificate thumbprint](https://learn.microsoft.com/en-us/troubleshoot/windows-server/remote/remote-desktop-listener-certificate-configurations) like what the RDP server uses would have been enough. Instead, we have this semi-random, opaque, undocumented just-pick-any-cert-that-might-work selection process.
