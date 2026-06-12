+++
title = "Everything Wrong with MSIX: The Virtual Filesystem Trap"
slug = "everything-wrong-with-msix-the-virtual-filesystem-trap"
date = 2026-06-12
description = "MSIX tries to hide installation details behind package identity and virtualization, but paths are still operational contracts. The result is friction for vendors, administrators, scripts, support calls, and customers migrating from MSI."

[taxonomies]
tags = ["MSIX", "Windows", "PowerShell", "CTO"]

[extra]
banner = "/images/banners/everything-wrong-with-msix-the-virtual-filesystem-trap.png"
+++

In the previous post, I covered one of the most visible MSIX problems for infrastructure software: [MSIX has no proper system context support](/posts/everything-wrong-with-msix-no-system-context/). PowerShell, WinGet, services, scheduled tasks, remoting, deployment agents, and endpoint management tools all run into the same wall when a package is registered for an interactive user but expected to behave like a machine-wide MSI install.

This post is about a quieter problem that looks less important until you support real customers: paths.

MSIX has good intentions. It wants clean uninstall, reliable updates, tamper resistance, user-scoped state, and less system rot. Those are not bad goals. The problem is the assumption that file paths are just implementation details users and administrators should not care about. In practice, paths are operational contracts. They appear in documentation, support scripts, log collectors, firewall and EDR rules, backup policies, roaming profile exclusions, automation, environment variables, and the muscle memory of every support engineer who has ever said, "open File Explorer and go to..."

Changing an install path is not cosmetic. It changes how software is discovered, diagnosed, automated, and trusted. But the install path is only the mild version of the problem. The harder break comes when the application's settings path changes too, because now the packaged and unpackaged versions can behave like two different products with two different user profiles.

## Where Is Windows Terminal?

Let's start with a familiar packaged application: Windows Terminal. From PowerShell, `wt.exe` appears to be on `PATH`:

```powershell
where.exe wt.exe
C:\Users\mamoreau\AppData\Local\Microsoft\WindowsApps\wt.exe
```

That is not the traditional executable install location. It is an app execution alias under the user's profile. The real package payload is somewhere else entirely:

```powershell
Get-AppxPackage Microsoft.WindowsTerminal | Select-Object Name, Version, PackageFullName, PackageFamilyName, InstallLocation

Name              : Microsoft.WindowsTerminal
Version           : 1.24.11321.0
PackageFullName   : Microsoft.WindowsTerminal_1.24.11321.0_x64__8wekyb3d8bbwe
PackageFamilyName : Microsoft.WindowsTerminal_8wekyb3d8bbwe
InstallLocation   : C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.24.11321.0_x64__8wekyb3d8bbwe
```

Now try browsing the parent folder directly:

```powershell
Get-ChildItem 'C:\Program Files\WindowsApps'
Get-ChildItem: Access to the path 'C:\Program Files\WindowsApps' is denied.
```

This is the first support problem. With an MSI install, the answer to "where is the program installed?" is usually a path like this:

```powershell
C:\Program Files\Vendor\Product\Product.exe
```

With MSIX, the answer is split across package identity, user registration, protected storage, and app execution aliases:

```powershell
C:\Users\<user>\AppData\Local\Microsoft\WindowsApps\wt.exe
C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.24.11321.0_x64__8wekyb3d8bbwe\WindowsTerminal.exe
C:\Users\<user>\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState
```

Those paths are not equally visible, stable, writable, or explainable over the phone.

## App Execution Aliases Are Not Install Paths

App execution aliases exist to make packaged apps launchable from a command line. Microsoft documents the manifest extension as [`uap5:AppExecutionAlias`](https://learn.microsoft.com/uwp/schemas/appxpackage/uapmanifestschema/element-uap5-appexecutionalias), and the Windows Terminal documentation explicitly tells users to enable the alias in "Manage app execution aliases" if `wt.exe` is not found.

Aliases are useful, but they are not the same as installing an executable into `Program Files`. The Sysinternals Store documentation is unusually direct about this: app execution aliases are a special kind of reparse point managed by Windows and stored under `%LOCALAPPDATA%\Microsoft\WindowsApps`.

That has consequences:

1. The alias is per-user.
2. The alias path is not where the application files live.
3. The alias can exist or not exist depending on user registration and settings.
4. The alias hides the package full name, version, architecture, and publisher ID.

That abstraction is nice until a support engineer needs to collect files, verify binaries, compare versions, inspect dependencies, or explain to a customer why `where.exe wt.exe` points at a user profile while the actual package is under `C:\Program Files\WindowsApps`.

Worse, a regular user cannot open `C:\Program Files\WindowsApps` to list the installed package folders. The place where the real MSIX payloads live is intentionally protected, so the obvious discovery path starts with an access-denied dialog.

![MSIX Program Files WindowsApps access denied](/images/posts/msix-filesystem-program-files-windows-apps-access-denied.png)

A user can open a package install folder directly if they already have the exact full path. That is a very different support experience. It is easy to say "open `C:\Program Files`, then open `Vendor`, then open `Product`" on a voice call. It is much harder to dictate or ask someone to manually copy this:

```powershell
C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.24.11321.0_x64__8wekyb3d8bbwe
```

That path is discoverable through PowerShell, but it is not discoverable by browsing, and it is not something a customer can reasonably type from spoken instructions.

![MSIX Program Files WindowsApps Windows Terminal package folder](/images/posts/msix-filesystem-program-files-windows-apps-windows-terminal.png)

## The Package Install Path Is Opaque by Design

MSIX package payloads are installed under `C:\Program Files\WindowsApps`, using a package full name that includes the package name, version, architecture, resource ID, and publisher ID:

```powershell
Microsoft.WindowsTerminal_1.24.11321.0_x64__8wekyb3d8bbwe
```

That path is precise for Windows, but awful for humans. It is versioned, verbose, and contains an opaque publisher identifier. It also changes when the package version changes.

This matters for vendors considering MSIX as an alternative to MSI. Many support and enterprise workflows assume the installation root is a stable, documented path. A customer may have a script that checks `C:\Program Files\Vendor\Product\Product.exe`. A monitoring rule may allowlist a binary path. A support runbook may ask the user to send `C:\Program Files\Vendor\Product\logs\service.log`. A deployment validation script may look for a registry key and an executable under a known directory.

MSIX says: please stop assuming those things. The problem is that the rest of the Windows ecosystem has been assuming those things for decades.

This is why so many ISVs are extremely conservative about install paths. How much software still installs into `C:\Program Files (x86)` by default even when the binaries are native x64 or ARM64? That is not always technical necessity. Often, it is fear of breaking scripts, shortcuts, integrations, monitoring rules, plugins, and customer documentation that quietly depend on the old path.

I consider the executable install path a real but manageable friction point. You can usually document the new location, expose a command-line alias, add a registry key, or teach a script to resolve the installed package. None of that is ideal, but it is survivable.

Settings paths are different. They are not just lookup locations for binaries. They contain user data, customer policy, environment-specific values, support history, and sometimes years of carefully accumulated configuration. When that path changes, the vendor is no longer just explaining where the program is installed. The vendor is deciding what happens to the customer's state.

## The Settings Path Is the Real Trap

Packaged apps get package-scoped app data folders under `%LocalAppData%\Packages\<PackageFamilyName>`:

```powershell
Get-ChildItem "$Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe"

    Directory: C:\Users\mamoreau\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d----          2024-10-01  1:38 PM                AC
d----          2024-03-21 10:20 AM                AppData
d----          2024-10-01  1:38 PM                LocalCache
d----          2026-06-05  2:54 AM                LocalState
d----          2024-03-21 10:20 AM                RoamingState
d----          2024-10-01  1:38 PM                Settings
d----          2024-10-01  1:38 PM                SystemAppData
d----          2024-03-21 10:20 AM                TempState
```

For unpackaged apps, support instructions often use familiar paths:

```powershell
%AppData%\Vendor\Product
%LocalAppData%\Vendor\Product
%ProgramData%\Vendor\Product
```

For packaged apps, the equivalent state may be under paths like these:

```powershell
%LocalAppData%\Packages\<PackageFamilyName>\LocalState
%LocalAppData%\Packages\<PackageFamilyName>\LocalCache
%LocalAppData%\Packages\<PackageFamilyName>\RoamingState
%LocalAppData%\Packages\<PackageFamilyName>\TempState
```

Microsoft's [app data documentation](https://learn.microsoft.com/windows/apps/develop/data/store-and-retrieve-app-data) explains the intended model: packaged apps should use `ApplicationData.Current.LocalFolder`, `LocalCacheFolder`, `RoamingFolder`, and `TemporaryFolder` instead of hardcoding physical paths. That is good API guidance for developers. It does not erase the operational reality that support teams, administrators, and external tools still need to find the physical files.

Windows Terminal makes this split easy to see. The MSIX-packaged version stores its user settings here:

```powershell
%LocalAppData%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
```

The ZIP release from the [Windows Terminal releases page](https://github.com/microsoft/terminal/releases) is unpackaged, so without portable-mode opt-in it uses the unpackaged settings path instead:

```powershell
%LocalAppData%\Microsoft\Windows Terminal\settings.json
```

That is already two settings files for the same application version. If a user changes a profile in the MSIX package, the ZIP build will not read it from `LocalState`; if the user changes the ZIP build settings, the MSIX package will not read them from `%LocalAppData%\Microsoft\Windows Terminal`.

One answer is to say: the future is packaged, so migrate the settings once and move on. That sounds simple until you are the vendor responsible for customer data. Settings migration is risky. If the migration code has a bug, if it misses a file, if it misunderstands a versioned schema, or if it overwrites something the customer expected to keep, you have created a data-loss incident out of an installer choice.

Rollback makes it worse. Suppose a customer installs the MSIX package, launches it, and the application automatically migrates settings from the unpackaged location into the package-scoped location. Then the customer decides MSIX is not working for them and goes back to the MSI or ZIP build. The unpackaged app may start as a fresh, unconfigured application because the active settings now live under `%LocalAppData%\Packages\<PackageFamilyName>`. The files may still exist, but the customer now has two versions of the truth in two different directories.

That is a big operational risk for a problem that often was not a problem. A simple, predictable settings path is a feature. Scripts can bootstrap the application. External tools can preconfigure it. Support can say exactly where the file is. Customers can open the folder, copy the settings, redact internal machine names or other sensitive values, zip the result, and send it back. You do not need package identity, an app data API, or a support utility just to find the configuration file.

This leaves vendors with a set of bad choices:

1. Keep packaged and unpackaged settings separate, and accept that the same user may see different configuration depending on how the app was launched.
2. Copy settings into the package location on first launch, and accept the risk of stale, duplicated state.
3. Move settings into the package location, and risk breaking rollback to MSI, ZIP, or any external tool that still reads the old path.
4. Build two-way synchronization, and accept a new conflict-resolution problem that the product did not need before.
5. Avoid MSIX-specific state APIs and keep using the old path, giving up some of the isolation model MSIX is trying to provide.

None of those choices is equivalent to the old MSI answer: the settings are in the documented settings folder, regardless of how the application was installed.

Windows Terminal also has an explicit portable mode: if a `.portable` marker file is placed next to `Microsoft.Terminal.Settings.Model.dll`, Terminal roots settings and state in a `settings` folder beside that DLL. That makes the portable-mode path look like this:

```powershell
<WindowsTerminalZipRoot>\settings\settings.json
```

That is useful, but it is also another path a support engineer must know to ask about. When a product has packaged, unpackaged, and portable forms, "send me your settings file" is no longer a single instruction.

## VFS Is a Compatibility Layer, Not a Simpler Filesystem

The part that makes this even more confusing is the MSIX virtual file system. Microsoft documents this in [Understanding how packaged desktop apps run on Windows](https://learn.microsoft.com/windows/msix/desktop/desktop-to-uwp-behind-the-scenes#file-system): packaged desktop apps run with special file system behavior depending on the location being accessed.

The important pieces are:

1. The package install directory is read-only at runtime.
2. The package can contain a `VFS` folder with files mapped into well-known Windows locations.
3. Reads can show a merged view of real system folders and package-provided virtual files.
4. Writes under parts of `AppData` can be redirected to a private per-user, per-package location.

The goal is compatibility. If a classic desktop app expected a DLL to exist in `System32`, the package can include it under a corresponding VFS folder and Windows can make it appear in the expected place for that app. If an app writes new files under certain `AppData` locations, Windows can redirect those writes so the package state remains isolated and removable.

That is clever engineering. It is also another source of mismatch between what the app sees and what the user, support engineer, service, script, or external diagnostic tool sees.

When a packaged app reads a path, it may be seeing a merged view. When it writes a path, the write may land somewhere else. When another process inspects the same ordinary-looking path, it may not have the same package identity, package registration, or virtualization context. This is the point where "just open the config file" turns into a mini-forensics exercise.

## Why This Breaks Migration Assumptions

Imagine a vendor with an existing MSI package. The application has been around for years. Customers know where logs are. Support knows where settings are. Automation knows where the executable is. Documentation has screenshots. Enterprise customers have allowlists, detection rules, backup exclusions, and deployment checks.

Then the vendor decides to offer an MSIX package as a "modern" alternative.

Even if the application code works, the operational surface changes:

1. Packaged and unpackaged builds may read different settings files.
2. Automatic settings migration can create rollback and downgrade traps.
3. Existing support scripts may miss logs and settings.
4. Existing customer scripts may bootstrap or preconfigure the wrong directory.
5. User data may move under `%LocalAppData%\Packages\<PackageFamilyName>`.
6. Profile-management products may treat package folders differently.
7. Machine-wide state under `%ProgramData%` may no longer fit the package model.
8. The executable is no longer under a predictable vendor install folder.
9. The visible command-line entry point may be a per-user alias.
10. The real install path is ACL-protected and versioned.

This is why "paths should be irrelevant" is not a serious answer. Paths are part of the product contract, even if they were never written down that way.

## What Vendors Need to Audit Before Offering MSIX

If you are a software vendor considering MSIX as an alternative to MSI, audit the operational contract, not just whether the app launches.

Check at least these areas:

1. Configuration file locations.
2. Log file locations.
3. `%AppData%` and `%LocalAppData%` migration behavior.
4. Rollback behavior from MSIX back to MSI or ZIP.
5. Whether settings migration is one-way, two-way, or deliberately avoided.
6. Support bundle collection scripts.
7. Customer bootstrap and preconfiguration scripts.
8. Backup, roaming profile, FSLogix, and VDI behavior.
9. `%ProgramData%` usage.
10. Service, scheduled task, and helper process assumptions.
11. Documented executable paths.
12. Customer deployment detection rules.
13. EDR, antivirus, firewall, and allowlisting guidance.

The hardest part of shipping MSIX beside MSI is not always packaging the binaries. It is deciding whether to migrate user state at all, how to make that migration safe, and how to support customers who need to move back. The packaged version may look like the same product to the end user while behaving like a different product to everyone responsible for operating it.

That is the uncomfortable part for vendors. MSIX moves risk from the platform model into the product team. If the vendor migrates too aggressively, they can break rollback or corrupt customer state. If they migrate too cautiously, customers see an empty profile and assume the product lost their settings. If they keep both paths alive, support now has to ask which package type launched the app before they can even interpret a log bundle.

## What Support Teams Are Forced to Build

If you support MSIX-packaged apps, you eventually need tooling to translate a package name into the paths users can actually inspect. Here is a small helper:

```powershell
function Get-AppxPathMap {
    param(
        [Parameter(Mandatory = $true)]
        [string] $PackageName
    )

    $appx = Get-AppxPackage -Name $PackageName | Select-Object -First 1
    if (-not $appx) {
        throw "Package not found: $PackageName"
    }

    $packageFamilyName = $appx.PackageFamilyName
    [pscustomobject]@{
        Name            = $appx.Name
        Version         = $appx.Version.ToString()
        PackageFullName = $appx.PackageFullName
        PackageFamily   = $packageFamilyName
        InstallLocation = $appx.InstallLocation
        AliasRoot       = Join-Path $Env:LocalAppData "Microsoft\WindowsApps"
        AppDataRoot     = Join-Path $Env:LocalAppData "Packages\$packageFamilyName"
        LocalState      = Join-Path $Env:LocalAppData "Packages\$packageFamilyName\LocalState"
        LocalCache      = Join-Path $Env:LocalAppData "Packages\$packageFamilyName\LocalCache"
        RoamingState    = Join-Path $Env:LocalAppData "Packages\$packageFamilyName\RoamingState"
        TempState       = Join-Path $Env:LocalAppData "Packages\$packageFamilyName\TempState"
    }
}

Get-AppxPathMap -PackageName Microsoft.WindowsTerminal | Format-List
```

That helper is not a fix. It is evidence of the problem. With a classic MSI install, support documentation usually points at a stable vendor folder. With MSIX, support tooling has to resolve package identity first, then translate it into the install location, alias root, and app data root.

The support cost is not just internal convenience. Customers often need to inspect the files themselves before sharing them. They may need to remove server names, hostnames, usernames, tenant IDs, or other details from a JSON or XML settings file. A predictable path makes that possible with nothing more than File Explorer. A package-scoped path hidden behind identity lookup turns a basic support request into a guided procedure.

## One More Trap: Copying the Package Is Not the ZIP

Windows Terminal also demonstrates another subtle trap: the MSIX package is not simply "the ZIP with a manifest".

I tried a collision-aware export that copied the Windows Terminal package first, then copied dependency files only when they did not overwrite files already present. That avoids the obvious mistake of replacing Terminal's own `resources.pri` with the `resources.pri` from the `Microsoft.UI.Xaml.2.8` framework package. Even then, the result was not equivalent to the official ZIP release:

```powershell
MSIX export files:                   262
Official ZIP files:                   57
Files only in MSIX export:           205
Files only in official ZIP:            0
Same path, different content:          2
```

The two files with the same relative path but different content were:

```powershell
Microsoft.UI.Xaml.dll
resources.pri
```

The packaged version depends on package identity, package graph resolution, framework packages, PRI/resource behavior, and runtime activation details. The official ZIP is built to run unpackaged. A copied MSIX payload is not.

## Closing Thoughts

MSIX is trying to solve real problems: uninstall cleanup, update reliability, package integrity, dependency management, and state isolation. Those are good intentions. But software distribution is not only about installing files. It is also about making software observable, scriptable, supportable, and predictable.

MSI may be old and frustrating, but it gave vendors and administrators a simple mental model: files go here, machine state goes there, user state goes somewhere recognizable, and the installed product can be found without decoding package identity. MSIX replaces that model with a more controlled one, but the cost is real friction. The install path friction is annoying. The settings path friction is dangerous, because it touches user data, rollback behavior, support workflows, and customer trust.

For consumer desktop apps, maybe that trade-off is acceptable. For developer tools, infrastructure tools, enterprise software, and anything with serious support obligations, paths are not irrelevant. They are part of the product experience.

## References

- [Understanding how packaged desktop apps run on Windows](https://learn.microsoft.com/windows/msix/desktop/desktop-to-uwp-behind-the-scenes#file-system)
- [Flexible virtualization](https://learn.microsoft.com/windows/msix/desktop/flexible-virtualization#mechanisms-prior-to-windows-11)
- [MSIX containerization overview](https://learn.microsoft.com/windows/msix/msix-containerization-overview)
- [Troubleshoot runtime issues in an MSIX container](https://learn.microsoft.com/windows/msix/manage/troubleshoot-msix-container)
- [MSIX troubleshooting guide](https://learn.microsoft.com/windows/msix/msix-troubleshooting-guide#runtime-and-virtualization-behavior)
- [Store and retrieve settings and other app data](https://learn.microsoft.com/windows/apps/develop/data/store-and-retrieve-app-data)
- [File access permissions for Windows apps](https://learn.microsoft.com/windows/apps/develop/files/file-access-permissions)
- [uap5:AppExecutionAlias manifest element](https://learn.microsoft.com/uwp/schemas/appxpackage/uapmanifestschema/element-uap5-appexecutionalias)
- [Windows Terminal command-line docs: app execution aliases](https://learn.microsoft.com/windows/terminal/command-line-arguments#add-windows-terminal-executable-to-your-path)
- [Sysinternals Store package notes: app execution aliases](https://learn.microsoft.com/sysinternals/downloads/microsoft-store#app-execution-aliases)
- [Windows Terminal portable mode spec](https://github.com/microsoft/terminal/blob/main/doc/specs/portable-mode-spec.md)