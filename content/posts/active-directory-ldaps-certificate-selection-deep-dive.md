+++
title = "Active Directory LDAPS certificate selection deep dive"
slug = "active-directory-ldaps-certificate-selection-deep-dive"
date = 2023-08-12
+++

The LDAPS certificate is used by the LDAP server to secure communications using TLS over TCP/636, as an alternative to LDAP over TCP/389 that uses SPNEGO-based security. Enabling and enforcing LDAPS is a common security hardening task in Windows Active Directory environments today. Using [Let's Encrypt certificates is popular for LDAPS](https://blog.devolutions.net/2021/03/how-to-configure-secure-ldap-ldaps-in-active-directory-with-lets-encrypt/) because it is much simpler than using [Active Directory Certificate Services (AD CS)](https://learn.microsoft.com/en-us/windows-server/identity/ad-cs/) if you don't already have it deployed.

In theory, it all looks great, until you realize that not only you can't explicitly select the LDAPS certificate to use, but there are no logs to enable, and no way to diagnose the problem. The next best thing is a detailed explanation of the internal process used to validate and select the final LDAPS certificate which is used on TCP port 636, so you can go over the list until you find what's wrong.

## Analysis Technique

For such a detailed analysis, I have used [IDA](https://blog.devolutions.net/2021/12/finding-secret-rdp-registry-keys-using-ida-free/) and looked at the specific private functions located in ntdsai.dll:
 * InitializeSSL
 * SearchForCertificate
 * ValidateLdapCertificate
 * RenewServerAuthCertificate

I then proceeded to write a lot of PowerShell code snippets matching what I could observe to confirm the LDAPS certificate selection and loading behavior.

## Certificate Subject Name

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

## Certificate Chain Validation

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

## Certificate Store Search Order

Here's where it gets tricky: the certificates are first searched in the NTDS service personal certificate store, and if no suitable certificate is found, then certificates are searched in the local machine personal certificate store (cert:\LocalMachine\My). In each store, search is performed by enumerating the certificates, checking that they validate properly according the rules described previously, **selecting the certificate with the most distant expiration date in the future**.

That last point is critical, since there is a very high chance that the local machine personal certificate store contains a server certificate suitable for LDAPS that isn't the one you want to use, and with an expiration date much further in the future (1 year) than the one you might be trying to use (3 months with letsencrypt). The best way to accurately configure the certificate that you want for LDAPS is to use the NTDS personal certificate store, which is not visible in the GUI ([certlm.msc](https://learn.microsoft.com/en-us/dotnet/framework/wcf/feature-details/how-to-view-certificates-with-the-mmc-snap-in)) or using the [PowerShell cert:\ provider](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/about/about_certificate_provider).

## Certificate Importing

To open the "NTDS\MY" certificate store, we'll use the [`Get-ServiceCertStore` cmdlet from Jordan Borean](https://gist.github.com/jborean93/9758823e0546abf561b07d380bc60c53) for which I have included an abridged copy inline here:

```powershell
Import-Module -Name Microsoft.PowerShell.Security

function Get-ServiceCertStore {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $ServiceName,

        [Parameter()]
        [string] $Name = 'My',

        [Security.Cryptography.X509Certificates.OpenFlags]
        $OpenFlags = [Security.Cryptography.X509Certificates.OpenFlags]::MaxAllowed
    )

    begin {
        $typeParams = @{
            TypeDefinition = @'
using Microsoft.Win32.SafeHandles;
using System;
using System.Runtime.InteropServices;

namespace X509
{
    public class NativeMethods
    {
        [DllImport("Crypt32.dll")]
        public static extern bool CertCloseStore(
            IntPtr hCertStore,
            uint dwFlags);

        [DllImport("Crypt32.dll", CharSet=CharSet.Unicode, SetLastError=true)]
        public static extern SafeX509Store CertOpenStore(
            IntPtr lpszStoreProvider,
            uint dwEncodingType,
            IntPtr hCryptProv,
            uint dwFlags,
            string pvPara);
    }

    public class SafeX509Store : SafeHandleZeroOrMinusOneIsInvalid
    {
        public SafeX509Store() : base(true) { }

        protected override bool ReleaseHandle()
        {
            return NativeMethods.CertCloseStore(handle, 0);
        }
    }
}
'@
        }
        Add-Type @typeParams

        $provider = [IntPtr]::new(10)
        $flags = (0x00050000 -bor 0x00000004)
        $flagType = [Security.Cryptography.X509Certificates.OpenFlags]

        $openMode = [int]$OpenFlags -band 3
        $accessFlags = switch ($openMode) {
            0 { 0x00008000 }
            2 { 0x00001000 }
            default { 0 }
        }
        $flags = $flags -bor $accessFlags

        if ($OpenFlags.HasFlag($flagType::OpenExistingOnly)) {
            $flags = $flags -bor 0x00004000
        }
        if ($OpenFlags.HasFlag($flagType::IncludeArchived)) {
            $flags = $flags -bor 0x00000200
        }
    }

    process {
        $handle = [X509.NativeMethods]::CertOpenStore(
            $provider, 0, [IntPtr]::Zero, $flags, "$ServiceName\$Name"
        ); $err = [Runtime.InteropServices.Marshal]::GetLastWin32Error()

        if ($handle.IsInvalid) {
            $exp = [ComponentModel.Win32Exception]$err
            Write-Error -Message "Failed to open '$ServiceName\$Name': $($exp.Message)" -Exception $exp
            return
        }

        try {
            [Security.Cryptography.X509Certificates.X509Store]::new($handle.DangerousGetHandle())
        }
        finally {
            $handle.Dispose()
        }
    }
}
```

From an elevated PowerShell terminal, load `Get-ServiceCertStore`, then import your LDAP server certificate with the right key storage flags into the "NTDS\MY" certificate store like this:

```powershell
$CertificateFile = Resolve-Path '.\ldap-server.pfx'
$CertificatePassword = "cert123!"
$KeyStorageFlags = [System.Security.Cryptography.X509Certificates.X509KeyStorageFlags]'MachineKeySet, PersistKeySet'
$Certificate = [System.Security.Cryptography.X509Certificates.X509Certificate2]::new($CertificateFile, $CertificatePassword, $KeyStorageFlags)
$CertificateThumbprint = $Certificate.Thumbprint

$CertificateStore = Get-ServiceCertStore -ServiceName "NTDS" -Name "My"
$CertificateStore.Add($Certificate)
```

Please note that the key storage flags used here are very important: the NTDS service needs to be able to read the private key, or will will skip the corresponding certificate. Importing the private key with MachineKeySet + PersistKeySet ensures it will work.

You can also list certificates in order of selection preference contained within the store, and testing for validity. If the first entry in the list isn't the one you expect, remove other certificates from the store. If Test-Certificate fails on the certificate you wanted, you can now look into fixing the validation issue.

```powershell
$CertificateStore = Get-ServiceCertStore -ServiceName "NTDS" -Name "My"
$LdapServer = [System.Net.Dns]::GetHostEntry("localhost").HostName.TrimEnd('.')
$CertificateStore.Certificates | Sort-Object NotAfter -Descending | Where-Object {
    $_.MatchesHostName($LdapServer) -and
    $_.EnhancedKeyUsageList.ObjectId -contains "1.3.6.1.5.5.7.3.1" } | Where-Object {
    Test-Certificate -Cert $_ -Policy SSL -EKU @("1.3.6.1.5.5.7.3.1") -DNSName $LdapServer -ErrorAction Continue
}
```

I have simulated a problem by importing a certificate with an incomplete CA chain (I have the root CA, but not the issuer CA), causing the following error:

```powershell
WARNING: Chain status:
    CERT_TRUST_REVOCATION_STATUS_UNKNOWN
    CERT_TRUST_IS_OFFLINE_REVOCATION
    CERT_TRUST_IS_PARTIAL_CHAIN
Missing issuer: CN=IT Help Ninja Issuing CA
```

After installing the issuer CA in the system **Intermediate Certification Authorities** and ensuring my root CA is in the system **Trusted Root Certification Authorities**, I am now down to just one error:

```powershell
WARNING: Chain status:
    CERT_TRUST_REVOCATION_STATUS_UNKNOWN
```

Here's the thing: I have created a [relatively simple CA chain with a script](https://gist.github.com/awakecoding/5d5589af207f7f2b181aae9ef8681edb), and it does not contain usable CRL or OCSP URLs for revocation checking, because it takes more work. The certificate *will* be loaded despite the unknown revocation status, but that's only pushing the problem down to the clients that probably won't be happy about it. In other words: you will have to do the extra work of fixing revocation checking for your clients, or LDAPS will still likely fail.

Normally, the new certificate should be reloaded automatically, but if you've used an alternate trick involving copying registry keys to `'HKLM:/Software/Microsoft/Cryptography/Services/NTDS/SystemCertificates/My/Certificates'`, you will need to trigger the hot reload manually through LDAP:

```powershell
$dse = [adsi]'LDAP://localhost/rootDSE'
[void]$dse.Properties['renewServerCertificate'].Add(1)
$dse.CommitChanges()
```

Please note that while dealing with the NTDS certificate store through its registry path is not recommended, it can be used as a lazy method to remove certificates: just find the key that corresponds to the certificate thumbprint and delete it.

## Closing Thoughts: PKINIT

I originally meant for this blog to cover *both* LDAPS and PKINIT certificates, but it turned out to be massive undertaking to document both in depth. I will come back to PKINIT in a separate blog post, but the important thing to remember is that it does *not* use the NTDS service certificate store, and that yes, it can be configured separately from the LDAPS certificate, despite what people may think.
