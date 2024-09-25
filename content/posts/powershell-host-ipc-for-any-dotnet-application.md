+++
title = "PowerShell Host IPC for any .NET application"
slug = "powershell-host-ipc-for-any-dotnet-application"
date = 2024-09-25
description = "Explore how PowerShell enables interprocess communication (IPC) using named pipes in .NET applications, allowing seamless remote control and API access. This hands-on guide walks through creating custom named pipes, using Enter-PSHostProcess for connection, and integrating PowerShell with your .NET projects to enhance flexibility and streamline automation workflows with real-world examples."

[taxonomies]
tags = ["PowerShell", "CTO"]

[extra]
banner = "/images/banners/powershell-host-ipc-for-any-dotnet-application.png"
+++

What if I told you that PowerShell can do interprocess communication over named pipes out of the box? Don't believe me? Try it out:

1. Open a first PowerShell terminal and print its process id using `$PID` (10832 in this case)
2. Open a second PowerShell terminal and call `Enter-PSHostProcess` with the first process id
3. Congratulations, you are now running PowerShell inside the first process!

![PowerShell Host IPC Quick Start](/images/posts/pshost-ipc-quick-start.png)

## PowerShell Host Default Pipe Name

Let's start at the beginning: how does `Enter-PSHostProcess` connect to a PowerShell host process using nothing but its process id? Every PowerShell process has a default named pipe listener with a name that can be reconstructed using the process id, process start time and name, like this:

```powershell
function Get-PSHostNamedPipeName {
    param (
        [int] $ProcessId,
        [switch] $WithPrefix
    )

    $Process = Get-Process -Id $ProcessId

    if ($IsWindows) {
        $DefaultAppDomainName = "DefaultAppDomain"
        $PrefixPath = "\\.\pipe\"
        $StartTime = $Process.StartTime.ToFileTime().ToString([System.Globalization.CultureInfo]::InvariantCulture)
    } else {
        $DefaultAppDomainName = "None"
        $PrefixPath = [System.IO.Path]::GetTempPath() + "CoreFxPipe_"
        $StartTime = $Process.StartTime.ToFileTime().ToString("X8").Substring(1, 8)
    }

    $PipeName = "PSHost.{0}.{1}.{2}.{3}" -f $StartTime, $Process.Id, $DefaultAppDomainName, $Process.ProcessName

    if ($WithPrefix) {
        $PrefixPath + $PipeName
    } else {
        $PipeName
    }
}
```

The above code snippet matches what [PSHostProcessInfo.GetPipeNameFilePath](https://learn.microsoft.com/en-us/dotnet/api/microsoft.powershell.commands.pshostprocessinfo.getpipenamefilepath) does, but I have replicated the logic here for reference.

On Windows, the named pipe names look like this:

```powershell
PS > Get-PSHostNamedPipeName 10832
PSHost.133717527448573874.10832.DefaultAppDomain.pwsh
PS > Get-PSHostNamedPipeName 10832 -WithPrefix
\\.\pipe\PSHost.133717527448573874.10832.DefaultAppDomain.pwsh
PS > (Get-PSHostProcessInfo 10832).GetPipeNameFilePath()
\\.\pipe\PSHost.133717527448573874.10832.DefaultAppDomain.pwsh
```

On macOS and Linux, the named pipe names look like this instead:

```powershell
PS > Get-PSHostNamedPipeName $PID
PSHost.DB0F7210.746.None.pwsh
PS > Get-PSHostNamedPipeName $PID -WithPrefix
/tmp/CoreFxPipe_PSHost.DB0F7210.746.None.pwsh
PS > (Get-PSHostProcessInfo $PID).GetPipeNameFilePath()
/tmp/CoreFxPipe_PSHost.DB0F7210.746.None.pwsh
```

## PowerShell Host Custom Pipe Name

Now that we know how to construct the PowerShell host pipe name from the process id, you can try using the `-CustomPipeName` parameter of `Enter-PSHostProcess` instead of the process id:

```powershell
PS > Get-PSHostNamedPipeName 10832
PSHost.133717527448573874.10832.DefaultAppDomain.pwsh
PS > Enter-PSHostProcess -CustomPipeName (Get-PSHostNamedPipeName 10832)
[Process:10832]: PS C:\Users\awakecoding\Documents>
```

This is obviously much more work because `Enter-PSHostProcess` can do the same with just the process id, so why bother? Because PowerShell can be launched with a custom pipe name following the convention of your choosing, which can make it much easier to predict without figuring out what the process id is.

First, spawn a new PowerShell process with the `-CustomPipeName MyTest`:

```powershell
pwsh -NoLogo -NoExit -CustomPipeName MyTest
```

From another PowerShell terminal, use `Enter-PSHostProcess` with `-CustomPipeName MyTest`:

```powershell
PS > Enter-PSHostProcess -CustomPipeName MyTest
[Process:6928]: PS C:\Users\awakecoding\Documents>
```

We can see that the process id is now 6928, but all we needed to connect was the custom pipe name.

## .NET PowerShell Host Demo

PowerShell is a .NET language. Wouldn't it be awesome if you could just... expose your .NET application to be controlled remotely through PowerShell? You're in luck, because this can be done with [`RemoteSessionNamedPipeServer.CreateCustomNamedPipeServer`](https://learn.microsoft.com/en-us/dotnet/api/system.management.automation.remoting.remotesessionnamedpipeserver.createcustomnamedpipeserver)!

Create a new project called `PSHostDemo`, then add a reference to the PowerShell SDK:

```powershell
dotnet new console -n PSHostDemo
cd PSHostDemo
dotnet add package Microsoft.PowerShell.SDK --version 7.4
```

Replace the contents of Program.cs with the following:

```cs
using System.Diagnostics;
using System.Management.Automation.Remoting;

namespace PSHostDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            int processId = Process.GetCurrentProcess().Id;
            string pipeName = (args.Length > 0) ? args[0] : "PSHostDemo";
            Console.WriteLine("PipeName: '{0}', ProcessId: {1}", pipeName, processId);
            RemoteSessionNamedPipeServer.CreateCustomNamedPipeServer(pipeName);
            Console.ReadLine(); // Wait for user input to exit
        }
    }
}
```

Build and run the PSHostDemo project, and leave it running:

```powershell
dotnet run
PipeName: 'PSHostDemo', ProcessId: 4503
```

From another PowerShell terminal, connect to your .NET PowerShell host process:

```powershell
PS > Enter-PSHostProcess -CustomPipeName PSHostDemo
[Process:4503]: PS >
```

You are now successfully connected to your .NET process with an interactive PowerShell terminal! This is a big deal, because since PowerShell can access .NET APIs, this gives you a quick and dirty way to call your *existing* .NET APIs without manually instrumenting your application for IPC. If you have a large GUI application, this can be used to access everything that is not exposed properly, like internal properties, or new properties currently in development that haven't been exposed through the GUI yet. Of course, you may need to write additional code to make things easier to call from PowerShell, but the effort should be minimal.

## Going Further

Can we load .NET in a native process that isn't using a .NET language and [make it a PowerShell host process](https://github.com/Devolutions/pwsh-host-rs)? Yes, but it is unfortunately too much for the current blog post. If you're interested, I suggest you look into [PSDetour](https://github.com/jborean93/PSDetour) which does this already. Is it possible to create a PSSession object that can be passed to Invoke-Command? Yes, but unfortunately you'll need to write a bit of code to do it. There's the sample [NamedPipeConnection module](https://github.com/PowerShell/PowerShell/blob/master/test/tools/NamedPipeConnection/src/code/NamedPipeConnection.cs) in the PowerShell repository that does this, it's just a shame that it isn't supported out of the box. The current PSHost cmdlets are focused on interactive usage, but a desirable improvement for the future would be cmdlets that can return PSSession objects for non-interactive usage. Imagine what you could do with PowerShell scripts that can drive your existing .NET applications out-of-process, this is the only thing missing to make it happen.
