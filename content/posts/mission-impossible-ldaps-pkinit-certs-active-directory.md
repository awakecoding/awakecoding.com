+++
title = "Mission Impossible: LDAPS, PKINIT certificates in Active Directory"
slug = "mission-impossible-ldaps-pkinit-certs-active-directory"
date = 2023-08-05
draft = true
+++

Your mission, should you choose to accept it, is to configure two *different* certificates in Active Directory to be used for LDAPS and PKINIT, separately, in a way that ensures the desired certificates are selected by the domain controller.

## LDAPS Certificate

The LDAPS certificate is used by the LDAP server to secure communications using TLS over TCP/636, as an alternative to LDAP over TCP/389 that uses SPNEGO-based security. Enabling and enforcing LDAPS is a common security hardening task in Windows Active Directory environments today. Using [Let's Encrypt certificates is popular for LDAPS](https://blog.devolutions.net/2021/03/how-to-configure-secure-ldap-ldaps-in-active-directory-with-lets-encrypt/) because it is much simpler than using [Active Directory Certificate Services (AD CS)](https://learn.microsoft.com/en-us/windows-server/identity/ad-cs/) if you don't already have it deployed.

In theory, it all looks great, until you realize that not only you can't explicitly select the LDAPS certificate to use, but there are no logs to enable, and no way to diagnose the problem. The next best thing is a detailed explanation of the internal process used to validate and select the final LDAPS certificate which is used on TCP port 636, so you can go over the list until you find what's wrong.

### Certificate Subject Name

The certificate needs to match the FQDN of the domain controller, with trailing '.' removed, if present:

```powershell
[System.Net.Dns]::GetHostEntry("localhost").HostName.TrimEnd('.')
```

Under the hood, a private GetLocalMachineName function calls [GetComputerNameEx](https://learn.microsoft.com/en-us/windows/win32/api/sysinfoapi/nf-sysinfoapi-getcomputernameexw) with ComputerNameDnsFullyQualified (3) as [computer name format](https://learn.microsoft.com/en-us/windows/win32/api/sysinfoapi/ne-sysinfoapi-computer_name_format). Here's a longer code snippet that uses the same APIs as the original GetLocalMachineName function:

```powershell
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
using System.Text;

public class ntdsai
{
    [DllImport("kernel32.dll", CharSet = CharSet.Auto)]
    static extern bool GetComputerNameEx(int NameType, StringBuilder lpBuffer, ref uint lpnSize);

    public static string GetLocalMachineName()
    {
        const int ComputerNameDnsFullyQualified = 3;
        StringBuilder buffer = new StringBuilder(256);
        uint size = (uint)buffer.Capacity;
        GetComputerNameEx(ComputerNameDnsFullyQualified, buffer, ref size);
        return buffer.ToString().TrimEnd('.');
    }
}
"@

[ntdsai]::GetLocalMachineName()
```

If the subject name on the certificate you are trying to use for LDAPS does not match the machine name as returned by GetLocalMachineName, it will be excluded from the selection.

### Certificate Chain Validation

In order to be selected, the certificate is validated against its certificate chain, checking for the server authentication key usage (OID 1.3.6.1.5.5.7.3.1). Under the hood, [CertVerifyCertificateChainPolicy](https://learn.microsoft.com/en-us/windows/win32/api/wincrypt/nf-wincrypt-certverifycertificatechainpolicy) is called with CERT_CHAIN_POLICY_SSL (4) with extra policy parameters to match the leaf certificate against the expected subject name mentioned previously.

This is a fairly standard certificate validation process that looks like what would be done by any application, so the common issues with certificate validation apply. Since browsers perform certificate validation quite differently from desktop applications using the Windows APIs, we'll use the following code snippet from [Jordan Borean](https://www.bloggingforlogging.com/) to fetch the current certificate used by the LDAPS server, and then validate it using [certutil -verify](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/certutil#-verify):

```powershell
function Get-CertificateFromTlsHandshake {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string] $HostName,
        [int] $Port = 443,
        [string] $Destination
    )

    $tcp = New-Object System.Net.Sockets.TcpClient($HostName, $Port)
    $state = @{}
    $ssl = New-Object System.Net.Security.SslStream($tcp.GetStream(), $false, {
        param($Sender, $Certificate, $Chain, $SslPolicyErrors)
        $state.cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2($Certificate)
        return $true
    })

    $ssl.AuthenticateAsClient($HostName)
    $ssl.Dispose()
    $tcp.Dispose()

    if (-Not [string]::IsNullOrEmpty($Destination)) {
        $AsByteStream = if ($PSEdition -eq 'Core') { @{AsByteStream = $true} } else { @{'Encoding' = 'Byte'} }
        Set-Content -Path $Destination -Value $cert.GetRawCertData() @AsByteStream
    }

    return $state.cert
}
```

Let's start by downloading the [letsencrypt.org](https://letsencrypt.org) certificate to validate it manually:

```powershell
$cert = Get-CertificateFromTlsHandshake 'letsencrypt.org' -Port 443 -Destination ".\letsencrypt.org.cer"
certutil.exe -verify ".\letsencrypt.org.cer"
```

We can now do the same with our LDAP server, using the host name of the domain controller and TCP port 636 used for LDAPS. Alternatively, manually export the certificate that isn't getting selected to a file and call certutil.exe -verify on it in a similar way:

```powershell
$LdapServer = [System.Net.Dns]::GetHostEntry("localhost").HostName.TrimEnd('.')
$cert = Get-CertificateFromTlsHandshake $LdapServer -Port 636 -Destination ".\ldap-server.cer"
certutil.exe -verify ".\ldap-server.cer"
```

Are you seeing an error related to a missing certificate in the chain, or a revocation checking error? You need to fix this for your certificate to be selected for LDAPS, otherwise it'll be skipped.

If you're using a certificate authority like [Let's Encrypt](https://letsencrypt.org/) with a PowerShell module like [Posh-ACME](https://github.com/rmbolger/Posh-ACME), make sure that you import the leaf certificate *with its complete chain* (use the fullchain.pfx file) to ensure there is a copy of the issuer CA in the local certificate store.

If the issue is with certificate revocation checking, make sure that you're not blocking CRL or OCSP URLs contained in the certificate chain. You can also read this [excellent blog from Aaron Parker](https://stealthpuppy.com/resolving-issues-starting-ca-offline-crl/) for advanced debugging of certificate revocation issues.

### Certificate Store Search Order

Here's where it gets tricky: the certificates are first searched in the NTDS service personal certificate store, and if no suitable certificate is found, then certificates are searched in the local machine personal certificate store (cert:\LocalMachine\My). In each store, search is performed by enumerating the certificates, checking that they validate properly according the rules described previously, **selecting the certificate with the most distant expiration date in the future**.

That last point is critical, since there is a very high chance that the local machine personal certificate store contains a server certificate suitable for LDAPS that isn't the one you want to use, and with an expiration date much further in the future (1 year) than the one you might be trying to use (3 months with letsencrypt). The best way to accurately configure the certificate that you want for LDAPS is to use the NTDS personal certificate store, which is not visible in the GUI ([certlm.msc](https://learn.microsoft.com/en-us/dotnet/framework/wcf/feature-details/how-to-view-certificates-with-the-mmc-snap-in)) or using the [PowerShell cert:\ provider](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/about/about_certificate_provider).

### Quick & Dirty Method

The NTDS service personal certificate store path in the registry is `'HKLM:/Software/Microsoft/Cryptography/Services/NTDS/SystemCertificates/My/Certificates'`. The trick is to import the certificate that we want in the local machine personal certificate store (`'HKLM:/Software/Microsoft/SystemCertificates/My/Certificates'`) and then copy it to its final destination by registry key paths, without using the certificate store APIs.

First, import the certificate with its private key in `cert:\LocalMachine\My` using [Import-PfxCertificate](https://learn.microsoft.com/en-us/powershell/module/pki/import-pfxcertificate) and save the thumbprint, like this:

```powershell
$CertificatePassword = $(ConvertTo-SecureString -AsPlainText 'poshacme' -Force)
$ImportedCertificate = Import-PfxCertificate -FilePath $Certificate.PfxFullChain `
    -CertStoreLocation 'cert:\LocalMachine\My' -Password $CertificatePassword
$CertificateThumbprint = $ImportedCertificate.Thumbprint
```

Second, copy the imported certificate to the NTDS certificate store using the registry key paths and the certificate thumbprint:

```powershell
$LocalCertStore = 'HKLM:/Software/Microsoft/SystemCertificates/My/Certificates'
$NtdsCertStore = 'HKLM:/Software/Microsoft/Cryptography/Services/NTDS/SystemCertificates/My/Certificates'
if (-Not (Test-Path $NtdsCertStore)) {
    New-Item $NtdsCertStore -Force
}
Copy-Item -Path "$LocalCertStore/$CertificateThumbprint" -Destination $NtdsCertStore
```

The certificate stores are monitored for changes by the NTDS service to automatically reload certificates, but since we didn't use the proper certificate APIs, we need to trigger the renewal manually through LDAP:

```powershell
$dse = [adsi]'LDAP://localhost/rootDSE'
[void]$dse.Properties['renewServerCertificate'].Add(1)
$dse.CommitChanges()
```

## PKINIT Certificate

The PKINIT certificate is used by the Kerberos Key Distribution Center (KDC) for smartcard logons using X.509 client certificates.

TBD, fun stuff here, blah blah blah.
