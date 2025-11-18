+++
title = "Disabling MSBuild Node Reuse to Avoid File Locking Issues"
slug = "disabling-msbuild-node-reuse-to-avoid-file-locking-issues"
date = 2025-11-20
description = "Intermittent .NET host processes locking your build outputs? MSBuild's node reuse feature causes file locking in complex build systems. Learn how MSBUILDDISABLENODEREUSE fixes years of sporadic build failures, why this optimization backfires, and when you should disable it."

[taxonomies]
tags = ["MSBuild", "Windows", "PowerShell", "CTO"]

[extra]
banner = "/images/banners/disabling-msbuild-node-reuse-to-avoid-file-locking-issues.png"
+++

Ever been ready to commit your code, only to have MSBuild abort with a cryptic file locking error? You kill the processes, rebuild, and it works... until it doesn't. Again. And again.

For years at Devolutions, developers have fought this elusive problem. Some hit it occasionally. Others couldn't build in Visual Studio at all anymore. The worst part? Nobody knew why perfectly idle processes were holding onto our assemblies and refusing to let go.

The error usually looks like this—a file that can't be copied because multiple .NET host processes refuse to let go:

> warning MSB3026: Could not copy "obj\Debug\net9.0\RemoteDesktopManager.Business.dll" to "bin\Debug\net9.0\RemoteDesktopManager.Business.dll". Beginning retry 6 in 1000ms. The process cannot access the file 'bin\Debug\net9.0\RemoteDesktopManager.Business.dll' because it is being used by another process. The file is locked by: ".NET Host (54076), .NET Host (65656), .NET Host (17676)"

To get unblocked "quickly", you may go through the task manager, find the offending processes to kill them one by one, or use the process ids in PowerShell:

```powershell
Stop-Process -Id 54076
Stop-Process -Id 65656
Stop-Process -Id 17676
```

This tedious whack-a-mole doesn't prevent the problem from coming back. It's a band-aid, not a cure.

In recent months, the frequency escalated. One developer couldn't build from Visual Studio at all—only the dotnet CLI worked *most* of the time. When killing processes and rebooting isn't enough to get back to work, you know something is fundamentally broken. I had blamed using VSCode alongside Visual Studio, but the real culprit was hiding in plain sight.

## When GitHub Copilot Reveals What Google Can't

If you're still just googling error messages, you're fighting with one hand tied behind your back. I pasted the error into GitHub Copilot and asked: "I don't understand why I've got dangling processes keeping locks, figure out if they're still active and what they are."

![GitHub Copilot analysis of processes holding file locks](/images/posts/msbuild-node-reuse-github-copilot-error-analysis.png)

Not only did it figure out a shorter way to kill all processes at once:

```powershell
Stop-Process -Id 54076, 65656, 17676 -Force
```

But more importantly, it told me about a `dotnet` command I had no idea existed before, meant to terminate **MSBuild worker nodes**:

```powershell
dotnet build-server shutdown
```

So if they're worker nodes, why are they sticking around? Closing Visual Studio doesn't make them go away. Let's ask GitHub Copilot what controls the lifetime of those worker processes:

![GitHub Copilot msbuild worker node lifetime control](/images/posts/msbuild-node-reuse-github-copilot-lifetime-control.png)

Oh. *Oh.*

MSBuild worker nodes deliberately stick around **as a feature**. They're supposed to speed up builds by avoiding process startup costs. Noble goal, terrible side effect: when they load an assembly into memory, that file stays locked. If another process tries to overwrite it, the build fails.

Our build system runs code generators that load assemblies, performs manual file copy operations, and generally does the kind of complex orchestration that doesn't play nice with persistent worker processes. What Microsoft designed as an optimization turned into a reliability problem for us.

## The Fix: Disable Node Reuse and Reclaim Your Sanity

The `MSBUILDDISABLENODEREUSE` environment variable can be set to disable MSBuild node reuse. Each build will spawn new worker processes instead of reusing old worker processes from previous builds. Don't forget to logout or reboot to make sure the environment variable gets properly loaded:

```powershell
[System.Environment]::SetEnvironmentVariable('MSBUILDDISABLENODEREUSE', '1', 'User')
```

The performance impact? Negligible. Process startup time is a rounding error in our total build time. If you want to revert the change:

```powershell
[System.Environment]::SetEnvironmentVariable('MSBUILDDISABLENODEREUSE', $null, 'User')
```

**The result?** Weeks without a single file locking issue. Zero. Problem solved.

(Well, except when I forget to stop the debugger before rebuilding. But that's my mistake.)

## Why Node Reuse Fails for Complex Build Systems

MSBuild's node reuse is optimized for simple, repeated builds where the same assemblies get compiled over and over. It's perfect for rapid edit-compile-test cycles in straightforward projects.

But throw in code generators, custom build steps that load assemblies dynamically, or file copy operations that happen outside MSBuild's knowledge, and the optimization backfires. The worker nodes cache assemblies in memory, unaware that other processes need to write to those same files.

Microsoft designed this feature for speed. They didn't account for build systems that do more than just invoke the compiler.

## The Real Lesson

Sometimes "optimizations" are just deferred problems. This issue plagued our team for *years* because nobody thought to question whether those lingering .NET host processes were intentional. We assumed they were bugs, leaks, or environmental issues. Turns out, they were a feature.

And here's the kicker: I had googled this error dozens of times and never found the answer. GitHub Copilot surfaced it in seconds by understanding the context better than search engines ever could. If you're not using AI assistants for debugging yet, you're investigating with blinders on.
