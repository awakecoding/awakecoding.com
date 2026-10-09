+++
title = "Speeding Up .NET Builds on Windows: The NuGet Cache Fix"
slug = "speeding-up-dotnet-builds-on-windows-nuget-cache"
date = 2026-10-09
description = "Windows CI builds always finish last, but is Windows really that slow? Benchmarking the same .NET build on GitHub-hosted Windows and Linux runners revealed that the default NuGet cache location on C: made package restore over three times slower. Learn how moving NUGET_PACKAGES and NUGET_HTTP_CACHE_PATH to the runner's temp drive cut Windows restore times by more than two thirds, and why cross-compiling the same build from Linux keeps surfacing optimizations like this one."

[taxonomies]
tags = ["MSBuild", "NuGet", "Windows", "GitHub", "CTO"]

[extra]
banner = "/images/banners/speeding-up-dotnet-builds-on-windows-nuget-cache.png"
+++

I've done a *lot* of build workflows in my career, and I like to optimize them to remove friction in development. If you're like me and build cross-platform software, you probably know the golden rule: in a CI matrix job, Windows always comes last, behind macOS and Linux. If you want to optimize the wall time for your cross-platform builds, you have to make the Windows build faster.

This is why I am a fan of cross-compilation: from experience, switching from a Windows runner to a Linux runner to build the *same* Windows application often results in faster builds. I've observed this in GitHub Actions, but also on a Windows host through WSL. Over time, I have come to accept as fact that building software on Windows is just slower.

With enough accumulated anecdotal evidence, anyone would come to the same conclusion. What if you take the time to perform elaborate comparison benchmarks? That's what I did for our CI build check workflow that runs on every pull request for [RDM Windows at Devolutions](https://devolutions.net/remote-desktop-manager/):

| Runner | vCPU | Linux | Windows | Windows penalty |
|---|---:|---:|---:|---:|
| GitHub-hosted | 4 | 295.8 s | 423.5 s | 1.43× |
| GitHub-hosted | 8 | 219.6 s | 285.3 s | 1.30× |
| GitHub-hosted | 16 | 166.5 s | 243.0 s | 1.46× |
| WarpBuild | 4 | 262.8 s | 284.9 s | 1.08× |
| WarpBuild | 8 | 157.6 s | 214.5 s | 1.36× |
| WarpBuild | 16 | 131.6 s | 166.7 s | 1.27× |

Windows is slower in **all** pairings, with a median penalty of 1.33x. [WarpBuild](https://www.warpbuild.com/) runners are faster than the GitHub-hosted runners, but the numbers clearly show I should pick Linux runners to build RDM Windows faster, and cheaper. It's not a one-off: I ran the benchmarking workflow 5 times to produce an average, and reduce variance between workflow runs.

## Reproducing the benchmark

The biggest issue with reproducing my original benchmarks is that RDM is a closed-source application. Since I couldn't find an open source .NET enterprise application as large as RDM, I used GitHub Copilot's [new HydraFusion model](https://github.blog/ai-and-ml/github-copilot/project-hydrafusion-frontier-quality-via-multi-model-orchestration/) to generate a deliberately bloated sample application that could approximate its size and complexity: [AtlasOps](https://github.com/mamoreau-devolutions/AtlasOps). I created a simple benchmarking workflow to build it on a 4 vCPU GitHub runner, with the following first results, averaged from multiple workflow runs:

| Average | Linux | Windows | Windows delta |
|---|---:|---:|---:|
| Restore | 19.78s | 104.39s | +84.61s (+427.8%) |
| Core build | 113.12s | 130.73s | +17.61s (+15.6%) |
| Total | 142.06s | 249.84s | +107.78s (+75.9%) |

For the exact same AtlasOps Windows build, Windows took 75% more time than Linux. It's the same application, with the same compiler toolchain (Roslyn for C#), and equivalent runner hardware resources. Notice how the biggest delta is when restoring nuget packages (427%), much more than for the core build which is the expected heaviest part (15%).

## Investigating the benchmark

Complex build workflows are mostly constrained by CPU and disk I/O performance. Network I/O usually only affects an early part of the build where packages are fetched. One theory might be that the Windows runners have very bad network performance, but that's something hard to believe wouldn't have been noticed before.

If both runners are assumed to have similar CPU resources, we're down to one main possible culprit: disk I/O performance. But how? The answer lies in the "dotnet restore" step: it is bound to disk write performance, not network performance! The default nuget cache on a Windows runner is on the OS disk (C:\\), *not* on the faster disk where the git clone is located (D:\\). It just happens that on the Linux runners, the default nuget cache path is on the "good" disk, which is why it is several times faster for nuget-related operations.

Once I set NUGET_PACKAGES and NUGET_HTTP_CACHE_PATH environment variables to point to a path on the "good" disk of a Windows runner (D:\\), the numbers started making a lot more sense:

| Host | Restore (s) | Core build (s) | Total (s) |
|---|---:|---:|---:|
| Linux | 36.4 | 136.3 | 172.7 |
| Windows (caches on D:) | 37.6 | 159.4 | 197.0 |
| Windows minus Linux | +1.2 | +23.0 | +24.3 |

The new delta for restoring nuget packages is now small enough to be considered equivalent between Windows and Linux. The core build is now faster because of nuget package *read* operations from the good disk. The core build remains slower on Windows than on Linux, but I'm leaving that part for future investigation. For all I know, it could be as simple as moving another cache path to a faster disk, I just don't know which one.

## The nuget cache path fix

How do you fix your existing GitHub Actions workflow to supercharge your Windows builds? Here's a simple solution you can try today:

```yaml
- name: Move NuGet caches to the temp drive
  if: runner.os == 'Windows' && runner.environment == 'github-hosted'
  shell: pwsh
  run: |
    $packages = Join-Path $Env:RUNNER_TEMP 'nuget\packages'
    $httpCache = Join-Path $Env:RUNNER_TEMP 'nuget\http-cache'
    New-Item -ItemType Directory -Force -Path $packages, $httpCache | Out-Null
    "NUGET_PACKAGES=$packages" >> $Env:GITHUB_ENV
    "NUGET_HTTP_CACHE_PATH=$httpCache" >> $Env:GITHUB_ENV
```

This code snippet will create the directories for the nuget cache paths and set the environment variables that nuget will use in your .NET builds. After I [shared the tip on X](https://x.com/awakecoding/status/2106105659519345050), a few users shared their impressive results:

* [Bradley Grainger](https://x.com/bgrainger/status/2106411800061489602) saw his .NET restore times drop from **5.5 minutes to 1.5 minutes**.
* [Robert McLaws](https://x.com/robertmclaws/status/2106567286953795976) went further by moving the .NET SDK as well, with a full build time down to 4m21s from 6m24s.

## What about using a Dev Drive?

GitHub Actions doesn't use a [Dev Drive](https://learn.microsoft.com/en-us/windows/dev-drive/), but disables Windows Defender by default. A Dev Drive could still help further improve performance, but for now, just using a faster drive makes a huge difference. Speaking of which, if you have a Dev Drive for local development on Windows but did *not* override the nuget cache paths to point to it, you're not fully benefiting from it. The .NET build performance is directly affected by the disk where the nuget cache path is located, locally or in the cloud! 

## Closing Thoughts

It's too easy to dismiss slow build performance on software being large and heavy to build. It becomes impossible to dismiss it when switching the same Windows build to a Linux runner magically makes it much faster. While cross-compilation is officially supported for .NET managed builds, it isn't for .NET NativeAOT. In fact, *native* cross-compilation targeting the Windows MSVC ABI is technically supported in various languages, but requires copying non-redistributable files from a Windows machine.

Microsoft should aim at making Windows match or beat Linux across all compilation workloads. However, if nobody bothers to compare, how can we observe differences worthy of investigation? More opportunities for build performance optimization like this one are currently being investigated, and were all surfaced by cross-compiling the same Windows software from Linux and Windows.

To make Windows builds faster, Microsoft must first embrace cross-compilation from Linux for *all* programming languages.