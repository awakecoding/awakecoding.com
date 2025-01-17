+++
title = "Windows Virtual Network using Wintun and tun2socks"
slug = "windows-virtual-network-using-wintun-and-tun2socks"
date = 2025-01-21
description = "Learn how to set up a TUN-based virtual network interface in Windows using WinTun and tun2socks, route traffic through a SOCKS proxy, and build your own custom VPN solution from scratch"

[taxonomies]
tags = ["Windows", "Networking", "CTO"]

[extra]
banner = "/images/banners/windows-virtual-network-using-wintun-and-tun2socks.png"
+++

A [TUN interface](https://www.baeldung.com/linux/tun-interface-purpose) is a virtual network device operating at Layer 3 that routes IP packets between user space and the kernel, allowing software to process IP traffic as if it were traveling through a real network interface and making it particularly useful for VPN and tunneling scenarios.

Historically, TUN support in Windows has been limited, but the [WireGuard project](https://www.wireguard.com/) developed [Wintun](https://www.wintun.net/), providing developers with a code-signed driver and a simple API to create and manage TUN interfaces in Windows.

## Overview

Today, we'll guide you through the steps required to create a virtual network interface mapped to a SOCKS proxy, and configure the client to connect through it to detect its external IP address using [https://ipinfo.io/ip].

* **Proxy VM**: A virtual machine in a *separate* network with a public IP address, like an Azure VM. Fictional IP address: 52.235.58.59
* **Client VM**: A local virtual machine that you will configure to connect *through* the Proxy VM. Fictional IP address: 74.56.34.56

It is important that both VMs used to follow these steps have *different* external IP addresses, since we'll be using [IPInfo](https://ipinfo.io/) to test if we're going through the proxy or not. The final flow will look like this:

curl ➙ wintun ➙ tun2socks ➙ ccproxy ➙ ipinfo.io

## CCProxy

In the *proxy VM*, [download](https://update.youngzsoft.com/ccproxy/update/ccproxysetup.exe) and install [CCProxy](https://www.youngzsoft.net/ccproxy/), a simple proxy application for Windows, with a free version sufficient for testing.

![CCProxy up and running](/images/posts/wintun-ccproxy-up-and-running.png)

Add a Windows firewall rule to allow inbound traffic on TCP/1080, the default port used for SOCKS in CCProxy:

```powershell
New-NetFirewallRule -DisplayName "CCProxy SOCKS" -Direction Inbound -Protocol TCP -LocalPort 1080 -Action Allow
```

Last but not least, figure out what your external IP address is:

```powershell
curl.exe https://ipinfo.io/ip
52.235.58.59
```

Make sure that your *proxy VM* has a public IP address that can be used to reach it, and that it is the same one returned by the previous command.

## wintun

In the *client VM*, open a PowerShell terminal, move to the Downloads directory (`cd ~\Downloads`), then run the following to download and extract wintun.dll:

```powershell
$Arch = if ($Env:PROCESSOR_ARCHITECTURE -eq 'ARM64') { "arm64" } else { "amd64" }
$WintunUrl = "https://www.wintun.net/builds/wintun-0.14.1.zip"
Invoke-WebRequest -Uri $WintunUrl -OutFile "wintun.zip" -ErrorAction Stop
Expand-Archive "wintun.zip" -Destination .
Remove-Item "wintun.zip"
Move-Item "./wintun/bin/$Arch/wintun.dll" "wintun.dll"
Remove-Item "./wintun" -Recurse | Out-Null
```

Wintun ships as a DLL (wintun.dll) that exports an API - the driver is embedded into that DLL to be extracted and installed when necessary as you call those APIs. This is why there is no separate driver file in the Wintun zip package, but we'll come back to this later.

## tun2socks

Next, in the same PowerShell terminal, run the following to [download](https://github.com/xjasonlyu/tun2socks/releases) and extract tun2socks.exe alongside wintun.dll:

```powershell
$Arch = if ($Env:PROCESSOR_ARCHITECTURE -eq 'ARM64') { "arm64" } else { "amd64" }
$BaseUrl = "https://github.com/xjasonlyu/tun2socks/releases/download/v2.5.2"
$ZipFileName = "tun2socks-windows-$Arch.zip"
Invoke-WebRequest -Uri "$BaseUrl/$ZipFileName" -OutFile $ZipFileName -ErrorAction Stop
Expand-Archive $ZipFileName -Destination .
Remove-Item $ZipFileName | Out-Null
Move-Item "tun2socks-windows-$Arch.exe" "tun2socks.exe"
```

[tun2socks](https://github.com/xjasonlyu/tun2socks) is a tool that implements a TUN interface wrapping a SOCKS proxy, accepting IP packets on one side, and making SOCKS proxy on the other side. While this approach has limited performance, it can be used to build a *functional* VPN solution.

## Testing the SOCKS proxy

From your *local VM*, find out your external IP address without going through a proxy:

```powershell
curl.exe https://ipinfo.io/ip
74.56.34.56
```

Now do the same, using your SOCKS proxy *explicitly*:

```powershell
curl -x socks5h://52.235.58.59:1080 https://ipinfo.io/ip
52.235.58.59
```

If it worked, a different IP address should be returned. It should also confirm that CCProxy in your *proxy VM* is working.

## Putting it all together

Open an **elevated** PowerShell terminal, move to the same directory used earlier, then launch tun2socks:

```powershell
.\tun2socks.exe --device tun://ProxyAdapter --proxy socks5://52.235.58.59:1080 --loglevel debug
2025/01/17 13:21:05 Installing driver 0.14
2025/01/17 13:21:05 Extracting driver
2025/01/17 13:21:05 Installing driver
2025/01/17 13:21:06 Creating adapter
```

On first use, the Wintun driver will be extracted and installed to "C:\Windows\System32\wintun.sys":

![Wintun driver file from WireGuard](/images/posts/wintun-driver-file-from-wireguard.png)

Open another elevated Powershell terminal, then assign an IP address to the virtual network interface:

```powershell
netsh interface ip set address name="ProxyAdapter" static 10.7.0.1 255.255.255.0
```

The assigned IP address doesn't matter that much, as long as it doesn't conflict with other network interfaces.

The new "ProxyAdapter" network adapter should now be listed by the "ipconfig /all" command:

```powershell
Unknown adapter ProxyAdapter:

   Connection-specific DNS Suffix  . :
   Description . . . . . . . . . . . : WireGuard Tunnel
   Physical Address. . . . . . . . . :
   DHCP Enabled. . . . . . . . . . . : No
   Autoconfiguration Enabled . . . . : Yes
   Link-local IPv6 Address . . . . . : fe80::e827:8d87:72c9:4c3b%77(Preferred)
   IPv4 Address. . . . . . . . . . . : 10.7.0.1(Preferred)
   Subnet Mask . . . . . . . . . . . : 255.255.255.0
   Default Gateway . . . . . . . . . :
   NetBIOS over Tcpip. . . . . . . . : Enabled
```

Create a new rule to route traffic going to ipinfo.io through the network adapter:

```powershell
$ifIndex = (Get-NetAdapter "ProxyAdapter").ifIndex
$ipInfo = (Resolve-DnsName -Name "ipinfo.io" -Type A).IPAddress
route add $ipInfo mask 255.255.255.255 10.7.0.1 metric 1 if $ifIndex
```

Confirm that the rule worked by fetching "https://ipinfo.io/ip" *without* using an explicit proxy:

```powershell
curl.exe https://ipinfo.io/ip
52.235.58.59
```

You can then delete the rule:

```powershell
route delete $ipInfo
```

## Wrapping Up

So, what just happened? The curl command resolved ipinfo.io to the same IP address matching our rule, then connected to our virtual network interface. tun2socks processed the TCP connection from the IP packets, and adapted it to an outgoing SOCKS proxy connection through CCProxy running in the *proxy VM*. Since ipinfo.io saw the request coming from the *proxy VM* and not the *client VM*, the external IP address of the *proxy VM* was returned. This is all done without the need for explicit proxy support in the client application (curl).

## Closing Thoughts

This guide was short and functional, but should illustrate the most basic usage of a TUN interface in Windows. Rules can be added to forward entire subnets to a virtual network interface, instead of individual IPs. Getting private DNS mapped properly requires more fiddling. While UDP is supported by some SOCKS proxies like CCProxy, it is only useful to make UDP-based protocols like QUIC in modern HTTP work, but don't except good performance.
