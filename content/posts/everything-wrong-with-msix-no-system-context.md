+++
title = "Everything Wrong with MSIX: No System Context"
slug = "everything-wrong-with-msix-no-system-context"
date = 2026-05-06
description = "Microsoft's new Inside MSIX series explains that MSIX has no install, only stage and register. This design creates real system context limitations for PowerShell, scheduled tasks, services, remoting, and WinGet automation."

[taxonomies]
tags = ["MSIX", "Windows", "PowerShell", "CTO"]

[extra]
banner = "/images/banners/everything-wrong-with-msix-no-system-context.png"
+++

Microsoft has started a new [Inside MSIX](https://devblogs.microsoft.com/insidemsix/) blog series, and the first architecture post is a useful place to start: ["There is no Install - it's 'Stage' and 'Register'"](https://devblogs.microsoft.com/insidemsix/there-is-no-install-its-stage-and-register/).

The post explains that "install" is not a formal MSIX concept. MSIX deployment is split into indexing, staging, and registering. Indexing and staging are per-machine activities, while registration is per-user. Registering the package is what effectively makes it usable for that user. The [MSIX documentation on preinstalling packaged apps](https://learn.microsoft.com/windows/msix/desktop/deploy-preinstalled-apps) says the same thing from a deployment angle: staging can happen without user accounts on the device, but registration occurs on a per-user basis when a user logs on.

PowerShell is [deprecating its MSI installer in favor of MSIX](https://devblogs.microsoft.com/powershell/powershell-msi-deprecation/), starting with PowerShell 7.7-preview.1. Existing releases, including PowerShell 7.6, will keep their MSI packages, but PowerShell 7.7 GA and beyond are not expected to ship one.

That makes PowerShell a useful test case for MSIX as infrastructure packaging. MSIX is a modern packaging system, and the PowerShell announcement frames the move as an accessibility issue. That is fair: MSIX supports installer accessibility correctly. The problem is not that MSIX is modern; the problem is that its design is opinionated in a way that does not match true system-wide command-line tooling. It stages packages on the machine, then expects them to be registered on a per-user basis.

The concern is whether this switch is ready for all the scenarios PowerShell currently supports. The same PowerShell announcement acknowledges the gap directly:

> At this time, MSIX doesn't support all use case scenarios that MSI enabled, such as remoting and execution by system-level services (like Task Scheduler). We recognize this gap and are actively working to address it.

That caveat matters because PowerShell is not just an app you launch from Windows Terminal. It is infrastructure used by scheduled tasks, deployment systems, services, remote administration workflows, and endpoint management tools. A large amount of that automation runs as `NT AUTHORITY\SYSTEM`.

So here is my own companion series to Inside MSIX: a look at where MSIX does not yet line up with the way Windows administration workflows actually run. Let's start with the big one: **MSIX does not behave like a normal machine-wide installation from the SYSTEM context**.

## Reproducing Issues with PsExec

Let's install PowerShell 7 from the MSIX package using WinGet:

```powershell
winget install --id Microsoft.PowerShell --installer-type msix
```

So far, so good. `pwsh.exe` is available for the current user:

```powershell
PS> Get-AppxPackage Microsoft.PowerShell | Select-Object -Property Name,Version,Publisher,PackageFullName,InstallLocation

Name            : Microsoft.PowerShell
Version         : 7.6.1.0
Publisher       : CN=Microsoft Corporation, O=Microsoft Corporation, L=Redmond, S=Washington, C=US
PackageFullName : Microsoft.PowerShell_7.6.1.0_x64__8wekyb3d8bbwe
InstallLocation : C:\Program Files\WindowsApps\Microsoft.PowerShell_7.6.1.0_x64__8wekyb3d8bbwe
```

The `pwsh` command is also available through an app execution alias under `%LOCALAPPDATA%\Microsoft\WindowsApps`:

```powershell
PS> (Get-Command pwsh).Source
C:\Users\Administrator.IT-HELP\AppData\Local\Microsoft\WindowsApps\pwsh.exe
```

So, what's the problem? PowerShell is available to regular users who log on interactively to Windows, but it is not registered in the SYSTEM context. That matters as soon as PowerShell needs to run from a service, deployment agent, endpoint management tool, or scheduled task. Let's simulate that with PsExec:

```powershell
psexec -nobanner -s -i pwsh.exe -NoLogo -NoProfile

PsExec could not start pwsh.exe on IT-HELP-TEST:
The system cannot find the file specified.
```

Oops. Why can't PsExec find `pwsh.exe`? Launch `powershell.exe` instead, which ships with Windows and is not MSIX-packaged:

```powershell
psexec -nobanner -s -i powershell.exe -NoLogo -NoProfile
```

If psexec worked, you should now see the "classic" console host. Can you guess why that is? You guessed it: Windows Terminal is packaged as an MSIX, so forget about having it running in a system context. Old, ugly console it is, then. Confirm the new shell runs as `nt authority\system`, then try using PowerShell 7:

```powershell
PS C:\WINDOWS\system32> whoami
nt authority\system
PS C:\WINDOWS\system32> Get-AppxPackage Microsoft.PowerShell
PS C:\WINDOWS\system32> pwsh
pwsh : The term 'pwsh' is not recognized as the name of a cmdlet, function, script file, or operable program. Check
the spelling of the name, or if a path was included, verify that the path is correct and try again.
At line:1 char:1
+ pwsh
+ ~~~~
    + CategoryInfo          : ObjectNotFound: (pwsh:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException
```

If you try launching `winget.exe`, it fails in the same way. The package may be staged on the machine, but the per-user registration and app execution alias are not present in the SYSTEM context.

That is the part MSIX gets wrong for infrastructure tooling. It is not just a desktop application launcher problem. PowerShell scripts run from scheduled tasks in the SYSTEM context. Deployment and endpoint management agents run as services. Network services perform authentication and create sessions under identities that are not normal interactive desktop users. The [WinRM service uses a PowerShell plugin DLL for the PowerShell Remoting server environment](https://awakecoding.com/posts/enable-powershell-winrm-remoting-in-powershell-7/). Treating PowerShell as a per-user registered application breaks those assumptions by design.

## MSIX Is Not a Better MSI

MSIX doesn't "install" in the traditional sense. It "stages" and "registers" instead. That is an opinionated design, and no amount of repeating what MSIX *does* will change what it *doesn't do*. The model does not cover valid Windows use cases such as privileged system services, SYSTEM-scheduled automation, remoting components, or a true system-wide installation where an executable is expected to be available to any account with file-system access.

As Microsoft deprecates MSI in more places and pushes MSIX deeper into Windows, these design decisions start leaking into the wider software ecosystem. The friction was always there, but vendors and administrators could ignore it by continuing to use MSI: the old technology with plenty of flaws, but one that at least worked for these scenarios. In 2026, with PowerShell 7.7 moving to MSIX, the fallback for unsupported scenarios may become manually extracting a PowerShell zip package and recreating the work the MSI used to do. The "upgrade" path to MSIX becomes a downgrade to custom install scripts for too many real-world use cases.

Of course, if you only want PowerShell for the current user, to run scripts as the current user, MSIX fits the bill. The problem is that PowerShell is widely used outside of that narrow scenario.

The trap is treating staging as installation.

MSIX [stages package payloads into the system without registering them](https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.stagepackagebyuriasync), then [registers packages for the current user](https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.registerpackagebyuriasync). Even the high-level [AddPackageByUriAsync](https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanager.addpackagebyuriasync) API adds a package for the current user.

That distinction is the center of the design. MSIX is built around user identity, [package identity](https://learn.microsoft.com/windows/apps/desktop/modernize/modernize-packaged-apps), app activation, declarations, capabilities, and [containerization boundaries](https://learn.microsoft.com/windows/msix/msix-containerization-overview). That can be great for many desktop applications, but it is a different contract than "put the executable under `Program Files` and let any account with permission run it."

SYSTEM is not your interactive user. It is `S-1-5-18`, normally running in session 0 with a different profile, a different `%LOCALAPPDATA%`, and a different app model view. It does not get a combined view of every interactive user's package registrations.

That means these things can generally be done from SYSTEM:

* Stage package payloads on the machine
* Provision packages for users
* Query machine-wide or all-user package state as an administrator
* Run ordinary unpackaged executables if the path and ACLs allow it
* Run properly declared packaged services, within the constraints of the MSIX service model

But these things cannot be assumed to work from SYSTEM:

* Use a package registered only for an interactive user as if it were registered for SYSTEM
* Resolve per-user app execution aliases such as `winget.exe`
* See packaged COM registrations that belong to another user's package graph
* Activate packaged apps through user-scoped activation metadata
* Treat a staged package as a normal machine-wide command-line tool

This is the part that is easy to miss: a package can be staged on the machine, registered for your user, visible in `Get-AppxPackage -AllUsers`, and still not be usable from SYSTEM as the current user. Those statements describe different layers of the MSIX deployment model.

## WinGet Shows the Same Boundary

WinGet is another visible example of the same MSIX boundary.

In [microsoft/winget-cli#5991](https://github.com/microsoft/winget-cli/issues/5991), the maintainers were asked whether the WinGet CLI is supported from the SYSTEM user running in session 0. The answer was direct:

> The CLI is not supported from SYSTEM at all, as one cannot register the MSIX package for the SYSTEM user.

Microsoft's own [WinGet troubleshooting documentation](https://learn.microsoft.com/windows/package-manager/winget/troubleshooting#exit-codes) now says the same thing: WinGet is delivered through App Installer as a packaged application, depends on an app execution alias being resolved on `PATH`, and is not supported in the system context.

That is enough for this post. WinGet has its own PowerShell module and packaged COM details, but those are separate problems. The point here is simpler: MSIX-packaged command-line tools do not automatically become system-context tools just because their payloads are staged on the machine.

## Closing Thoughts

The PowerShell team is right to care about accessibility. MSIX solves a real installer accessibility problem.

But accessibility cannot be used as a blanket justification for regressing core administration scenarios. PowerShell is not just an interactive desktop application. It is one of the main tools people use to keep Windows environments alive.

MSIX may be the future, but for system context automation, the current gaps still need to be closed before it can be the only supported PowerShell package.
