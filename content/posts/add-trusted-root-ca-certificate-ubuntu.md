+++
title = "Add Trusted Root CA certificate on Ubuntu"
slug = "add-trusted-root-ca-certificate-ubuntu"
date = 2022-11-24
+++

Do you need to add a custom trusted root CA on Ubuntu, and somehow always forget the correct procedure? Here's a quick reminder to use as reference!

Certificates need to be in PEM (textual) format, with the .crt extension. Use the `file` command to tell if the certificate file is using the DER (binary) format:

```bash
$ file -b my-root-ca.cer
data
```

If the `file` command returns "data", or anything other than "PEM certificate", then convert it using OpenSSL:

```bash
openssl x509 -inform der -in my-root-ca.cer -out my-root-ca.crt
```

The .cer and .der file extensions are normally used for binary encoding, but the .crt file extension is used for both binary and textual encodings. Ensure that the resulting certificate uses PEM encoding with the .crt file extension:

```bash
$ file -b my-root-ca.crt
PEM certificate
```

Move the certificate file to '/usr/local/share/ca-certificates/' and then call `update-ca-certificates`:

```bash
sudo mv my-root-ca.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
```

That's it, your root CA certificate should now be trusted system-wide!