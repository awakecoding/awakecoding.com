+++
title = "Debugging PowerShell Binary Modules in Visual Studio"
slug = "debugging-powershell-binary-modules-in-visual-studio"
date = 2023-10-21
description = "Learn to create and debug PowerShell binary modules in Visual Studio, covering both local and remote debugging. This guide simplifies the development process for PowerShell modules, enhancing productivity with practical examples and troubleshooting tips for common issues."

[taxonomies]
tags = ["PowerShell"]

[extra]
banner = "/images/banners/debugging-powershell-binary-modules-in-visual-studio.png"
+++

So you've been tasked with creating a [PowerShell binary module](https://learn.microsoft.com/en-us/powershell/scripting/developer/module/how-to-write-a-powershell-binary-module) to expose functionality from a C# library you're working on, but don't know where to start in Visual Studio. Maybe you don't even like PowerShell and naively thought you could satisfy system administrators with a [traditional .NET CLI](https://learn.microsoft.com/en-us/dotnet/standard/commandline/) instead of a real PowerShell module like they've been asking for. You've then asked around for advice and all you got is ["use VSCode"](https://learn.microsoft.com/en-us/powershell/scripting/dev-cross-plat/vscode/using-vscode-for-debugging-compiled-cmdlets), but you want to stick to Visual Studio because it's what you know, and it feels more appropriate for everything *except* PowerShell.

Let's fix this the manual way for Powershell binary module development in Visual Studio, one manual step at a time, such that you can build and debug your PowerShell project like any other .NET project. This blog post covers both *local* and *remote* debugging of PowerShell *binary* modules, but doesn't cover [PowerShell *script* debugging](https://learn.microsoft.com/en-us/powershell/scripting/dev-cross-plat/vscode/using-vscode?#debugging-with-visual-studio-code), which is another topic entirely.

## Creating PowerShell Demo Project

Let's begin by creating a Visual Studio solution with a sample PowerShell binary module. Since absolute file paths are unfortunately required for many steps, I'll be using `C:\Users\Public\Projects` throughout this guide. Even if this isn't your regular project directory, I'd recommend using it temporarily before changing to something else:

```powershell
$SolutionName = "PowerShellDemo"
$ProjectName = "SampleModule"
$SolutionDir = "C:\Users\Public\Projects\$SolutionName"
New-Item -Type Directory -Path $SolutionDir -ErrorAction SilentlyContinue
Set-Location $SolutionDir
```

Use the [`dotnet` CLI](https://learn.microsoft.com/en-us/dotnet/core/tools/) to create the **PowerShellDemo** solution and **SampleModule** project:

```powershell
dotnet new sln -n PowerShellDemo
dotnet new classlib -n SampleModule -f netstandard2.0
dotnet sln add SampleModule/SampleModule.csproj
dotnet add SampleModule/SampleModule.csproj package PowerShellStandard.Library --version 5.1.1
```

Open PowerShellDemo.sln in Visual Studio (`start .\PowerShellDemo.sln`), then rename Class1.cs to HelloWorldCmdlet.cs and replace its contents with the following code:

```cs
using System.Management.Automation;

namespace SampleModule
{
    [Cmdlet(VerbsCommon.Get, "HelloWorld")]
    public class HelloWorldCmdlet : Cmdlet
    {
        protected override void ProcessRecord()
        {
            WriteObject("Hello");
            WriteObject("World");
        }
    }
}
```

You can now build the solution (Ctrl+Shift+B):

![Class library project can be built](/images/posts/pwsh-msvc-class-library-project-can-be-built.png)

But when you try to start the project in the debugger (F5), or even without it (Ctrl+F5), all you get is this lousy error message:

> A project with an Output Type of Class Library cannot be started directly. In order to debug this project, add an executable project to this solution which references the library project. Set the executable project as the startup project.

![Class library project cannot be started](/images/posts/pwsh-msvc-class-library-project-cannot-be-started.png)

Well, that's not very helpful. How does one even run the Get-HelloWorld cmdlet manually?

1. Look at the Visual Studio build logs to find the output file path for our binary module
2. Open a **fresh** PowerShell terminal, call Import-Module on the binary module output file path
3. Script a few useful things you want to call prior to your cmdlet of interest, then call it
4. Close the PowerShell terminal to release file locks on the binary module output file path

From an interactive PowerShell terminal, this is what it looks like:

```powershell
PS C:\> pwsh -NoLogo
PS C:\> Import-Module "C:\Users\Public\Projects\PowerShellDemo\SampleModule\bin\Debug\netstandard2.0\SampleModule.dll"
PS C:\> Get-Command -Module SampleModule

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Cmdlet          Get-HelloWorld                                     1.0.0.0    SampleModule

PS C:\> Get-HelloWorld
Hello
World
PS C:\> exit
```

If you try to rebuild the Visual Studio project without terminating all PowerShell processes that have the binary module loaded, you will encounter file locking problems:

![Class library project file locked by another process](/images/posts/pwsh-msvc-class-library-project-locked-by-another-process.png)

Launching a fresh pwsh.exe process inside an existing PowerShell terminal may look odd, but it makes it a lot easier to keep the same terminal window. The `exit` command terminates the child pwsh.exe process and returns control to the parent PowerShell terminal.

## Creating PowerShell Launcher Project

Right-click on the **PowerShellDemo** solution, navigate to **Add**, then select **New Project...**. In the **Add a new project** dialog, search for "Empty Project", select the template matching C++ for Windows, then click **Next**:

![Create new Empty Project C++ Template](/images/posts/pwsh-msvc-create-new-empty-project-template.png)

In the **Configure your new project** dialog, use "SampleModule.Launch" as the project name, then click **Create**:

![Create new Empty Project Template Options](/images/posts/pwsh-msvc-create-new-empty-project-options.png)

Right-click on the **SampleModule.Launch** project, then select **Set as Startup Project**.

![Launch project set as startup project](/images/posts/pwsh-msvc-launch-project-set-as-startup-project.png)

Right-click on the **SampleModule.Launch** project, then navigate to **Build Dependencies**, then select **Project Dependencies**. In the **Project Dependencies** dialog, under **Depends on**, select the SampleModule project, then click **OK**:

![Launch project build dependencies](/images/posts/pwsh-msvc-launch-project-build-dependencies.png)

Right-click on the **SampleModule.Launch** project, navigate to **Add**, then select **New Item...**. Name the new file "launch.ps1", then set the following contents:

```powershell
Import-Module "..\SampleModule\bin\Debug\netstandard2.0\SampleModule.dll"
Get-HelloWorld
```

Right-click on the **SampleModule.Launch** project, select **Properties** (it's the last menu item, you can also use the `Alt+Enter` keyboard shortcut).

In the **Property Pages** dialog, navigate to the **Debugging** section, then change the following:

1. Set **Command** to "pwsh.exe"
2. Set **Command Arguments** to "-ExecutionPolicy Bypass -NoLogo -NoExit -File launch.ps1"
3. Set **Debugger Type** to "Mixed (.NET Core)"

![Launch project debugging settings .NET Core](/images/posts/pwsh-msvc-launch-project-debugging-dotnet-core.png)

If you want to debug using Windows PowerShell 5.1 (powershell.exe) instead of PowerShell 7 (pwsh.exe), use the following settings instead:

1. Set **Command** to "powershell.exe"
2. Set **Command Arguments** to "-ExecutionPolicy Bypass -NoLogo -NoExit -File launch.ps1"
3. Set **Debugger Type** to "Mixed (.NET Framework)"

![Launch project debugging settings .NET Framework](/images/posts/pwsh-msvc-launch-project-debugging-dotnet-framework.png)

Now go back to HelloWorldCmdlet.cs to set a breakpoint on the first line inside the `ProcessRecord` function of the Get-HelloWorld PowerShell cmdlet:

![Set breakpoint on Hello World cmdlet](/images/posts/pwsh-msvc-set-breakpoint-on-hello-world-cmdlet.png)

If you've never set a breakpoint in Visual Studio before, all you need is to click in the margin at the left of the line where the red dot appears in the screenshot. You are now ready to give it a try! Press F5 to launch your PowerShell cmdlet in the debugger:

![Hello World cmdlet in debugger break](/images/posts/pwsh-msvc-hello-world-cmdlet-in-debugger-break.png)

If everything worked, you should see the debugger break on the `WriteObject("Hello");` call inside `ProcessRecord`. If you press F10 or click the **Step Over** button, the debugger will move to the next line, and you should see "Hello" printed out to the terminal.

![Hello World cmdlet in debugger step](/images/posts/pwsh-msvc-hello-world-cmdlet-in-debugger-step.png)

You can also click **Continue** to resume program execution, which in this case will terminate the program as there's nothing else in our launch.ps1 script after the `Get-HelloWorld` call.

## Remote Debugging

All the steps up to this point cover the basics of *local* debugging, which is great, but the real deal is *remote* debugging. Who doesn't want to develop from Visual Studio to automatically deploy and debug PowerShell modules in clean Windows Server virtual machines? Brace yourselves, because the complexity for the second part of this blog post is much higher, but trust me, it's absolutely worth it. For testing, I created a test virtual machine "IT-HELP-DEBUG.ad.it-help.ninja", joined to a test domain "ad.it-help.ninja" [in my Hyper-V lab environment](https://github.com/Devolutions/devolutions-labs), but any standalone Windows virtual machine should be enough.

## Remote Debugging Host

In the remote debugging target host, download and install the [Remote Tools for Visual Studio](https://visualstudio.microsoft.com/downloads/#remote-tools-for-visual-studio-2022). You can automate this part with PowerShell:

```powershell
$RemoteToolsUrl = "https://aka.ms/vs/17/release/RemoteTools.amd64ret.enu.exe"
Invoke-WebRequest -Uri $RemoteToolsUrl -OutFile "~\Downloads\RemoteTools.exe"
& "~\Downloads\RemoteTools.exe" /install /quiet
Remove-Item -Path "~\Downloads\RemoteTools.exe"
```

Launch for the first time (msvsmon.exe, or search for "Remote Debugger" in the start menu). In the **Remote Debugging Configuration** dialog, ensure that all boxes are checked in the **Configure Windows Firewall** section, then click **Configure remote debugging**.

![Remote debugging configuration](/images/posts/pwsh-msvc-remote-debugging-configuration.png)

In the Visual Studio Remote Debugger, click **Tools**, then **Options**. Leave the default TCP port (4026), and leave **Windows Authentication** enabled. Click on **Permissions** to make sure that the user you want to use for remote debugging is allowed:

![Remote debugging options and permissions](/images/posts/pwsh-msvc-remote-debugging-options-permissions.png)

## Remote Debugging Client

On top of Visual Studio, click on the downward arrow at the right of the active debugger type, revealing a drop-down with other choices. Select **Remote Windows Debugger**, then select **SampleModule.Launch Debug Properties**:

![Set Windows Remote Debugger Properties](/images/posts/pwsh-msvc-set-remote-windows-debugger-properties.png)

In the **Property Pages** dialog, navigate to the **Debugging** section, then change the following:

1. Set **Command** to "C:\Program Files\PowerShell\7\pwsh.exe"
2. Set **Command Arguments** to "-ExecutionPolicy Bypass -NoLogo -NoExit -File launch.ps1"
3. Set **Working Directory** to "C:\Users\Public\Deploy\PowerShellDemo"
4. Set **Connection** to "Remote with Windows Authentication"
5. Set **Remote Server Name** to "IT-HELP-DEBUG.ad.it-help.ninja:4026"
6. Set **Debugger Type** to "Mixed (.NET Core)"
7. Set **Deployment Directory** to "C:\Users\Public\Deploy\PowerShellDemo"
8. Set **Additional Files to Deploy** to "$(SolutionDir)SampleModule\bin\$(Configuration)\netstandard2.0\*"
9. Set **Deploy Visual C++ Debug Runtime Libraries** to "No"
10. Set **Deploy Visual C++ Runtime Libraries** to "No"

![Launch project remote debugging settings .NET Core](/images/posts/pwsh-msvc-remote-debugging-configuration-dotnet-core.png)

If you want to debug using Windows PowerShell 5.1 (powershell.exe) instead of PowerShell 7 (pwsh.exe) change the following:

1. Set **Command** to "C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe"
2. Set **Debugger Type** to "Mixed (.NET Framework)"

You may notice that we're using *absolute* file paths to the remote executable: unfortunately, this a limitation of the remote debugger.

![Launch project remote debugging settings .NET Framework](/images/posts/pwsh-msvc-remote-debugging-configuration-dotnet-framework.png)

Click on **Configuration Manager** at the top-right of the current dialog, then enable **Deploy** for the SampleModule.Launch project:

![Launch project remote debugging deploy configuration](/images/posts/pwsh-msvc-remote-debugging-deploy-configuration.png)

Navigate to the **General** section under **Configuration Properties**, then change the following:

1. Set **Target Name** to "launch.ps1"
2. Set **Configuration Type** to "Utility"

![Launch project remote debugging general properties](/images/posts/pwsh-msvc-remote-debugging-general-properties.png)

You can now close the SampleModule.Launch properties dialog.

Next, right-click on launch.ps1 and select **Properties** and navigate to the **General** section to make the following changes:

1. Set **Excluded From Build** to "No"
2. Set **Content** to "Yes"
3. Set **Item Type** to "Copy File"

![Launch project remote debugging launch.ps1 properties](/images/posts/pwsh-msvc-remote-debugging-launch-ps1-properties.png)

Update launch.ps1 with the following code (launch.ps1 is now remotely deployed in the same directory as the binary PowerShell module):

```powershell
Import-Module ".\SampleModule.dll"
Get-HelloWorld
```

To avoid getting prompted for credentials, you can save them in the Windows credential manager like this:

```powershell
$TargetHost = "IT-HELP-DEBUG.ad.it-help.ninja"
$UserName = "Administrator@ad.it-help.ninja"
$Password = "DevoLabs123!"
$securePassword = ConvertTo-SecureString $Password -AsPlainText -Force
cmdkey /generic:$TargetHost /user:$UserName /pass:$SecurePassword
```

You can then delete the credentials from the Windows credential manager later:

![Remote debugging saved credentials](/images/posts/pwsh-msvc-remote-debugging-saved-credentials.png)

You are now ready to finally press F5 to remotely deploy and debug your PowerShell binary module. If everything worked, you should get prompted for credentials (if you haven't saved them locally), then after a lot of symbol loading, you will finally hit the breakpoint in Visual Studio:

![Remote debugging client in action](/images/posts/pwsh-msvc-remote-debugging-in-action-client.png)

In the remote debugging target host, the Visual Studio Remote Debugger dialog should show a log entry for the connection. If there isn't one, it means the client isn't connecting. Make sure the **Remote Server Name** configured previously is set to the correct hostname and port ("IT-HELP-DEBUG.ad.it-help.ninja:4026" in my case, but you need to change it to point to your target host). If it still doesn't work, make sure that the firewall is not blocking the connection.

In the success case, you should now see the PowerShell terminal in the target host with our sample PowerShell binary module loaded in the remote debugger:

![Remote debugging server in action](/images/posts/pwsh-msvc-remote-debugging-in-action-client.png)

Congratulations, you can now develop locally, yet remotely deploy and debug an up-to-date copy of your development build just by pressing F5 in Visual Studio! This is so much better than manually copying files over to the remote machine, which is error-prone, and often results in mismatches between local sources and remote binaries. The functionality is already there, but it is difficult to use, with too many repeated steps that could be automated.

## Remote Deployment and Debugging over Remote Development?

A popular trend these days is [VSCode remote development](https://code.visualstudio.com/docs/remote/remote-overview), which most often consists of installing tools in a remote host to present the user interface locally. This is better than connecting to a Windows VM over RDP to run Visual Studio "remotely", as a local user interface is more responsive, especially for typing text. However, the actual development tools still run 100% remotely, meaning you're still doing local debugging, but with a remote user interface. The source code is also built from the *remote* host, rather than built locally to deploy only the resulting build artifacts. This may be great for use cases like [Microsoft Dev Box](https://azure.microsoft.com/en-us/products/dev-box/) where you get a powerful build machine in the cloud, but it doesn't solve the issue of code deployment and execution in clean environments *separate* from the development environment.

With remote deployment and debugging, we could stop building and debugging on the same host: we could cross-compile and debug to all targets from a single development environment. If this is obvious for mobile development to Android or iOS targets, why isn't isn't this the *norm* yet for desktop application development? It's now possible to [debug Linux applications from Visual Studio using WSL](https://learn.microsoft.com/en-us/visualstudio/debugger/debug-dotnet-core-in-wsl-2?view=vs-2022), but there's no simplified equivalent for Windows targets! Remote development solves *a* problem by making it easier to develop on remote hosts, but it doesn't make it easier to keep a single development environment from which you can develop for *all* targets at once. If you work in the Visual Studio team at Microsoft, I have a LOT of feedback to give on how these kinds of workflows could be improved.
