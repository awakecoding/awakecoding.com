+++
title = "Pinning Apps to the Windows 11 Taskbar with PowerShell"
slug = "pinning-apps-to-the-windows-11-taskbar-with-powershell"
date = 2025-05-14
description = "Learn how to automate taskbar app pinning in Windows 11 using PowerShell by generating a LayoutModification.xml file and forcing the shell to reinitialize the layout without creating new user profiles."

[taxonomies]
tags = ["Windows", "PowerShell", "CTO"]

[extra]
banner = "/images/banners/pinning-apps-to-the-windows-11-taskbar-with-powershell.png"
+++

Pinning apps to the taskbar in Windows 11 is surprisingly tricky to automate. Microsoft's [official solution](https://learn.microsoft.com/en-us/windows/configuration/taskbar/pinned-apps) is to provision a LayoutModification.xml file, which is only applied during user profile initialization. If your user profile is already initialized, or if you just want to test layout modifications for your current user: well, tough luck.

In a first step, we'll generate a working `LayoutModification.xml` file using PowerShell and a list of application shortcuts. In a second step, we'll see how to force Windows to re-initialize the layout modifications for an existing user. It's not elegant, but it makes repeated testing much easier, and it's good enough for automation.

## Generating LayoutModification.xml with PowerShell

The default layout modification file is located in `C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml` and automatically copied to `%AppData%\Microsoft\Windows\Shell\LayoutModification.xml` upon user profile initialization.

Here's a sample layout modification file using only a list of shortcuts to existing applications:

```xml
<LayoutModificationTemplate
    xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout"
    xmlns:taskbar="http://schemas.microsoft.com/Start/2014/TaskbarLayout"
    xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification"
    Version="1">
  <CustomTaskbarLayoutCollection PinListPlacement="Replace">
    <defaultlayout:TaskbarLayout>
      <taskbar:TaskbarPinList>
        <taskbar:DesktopApp DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" />
        <taskbar:DesktopApp DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\File Explorer.lnk" />
        <taskbar:DesktopApp DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Notepad.lnk" />
        <taskbar:DesktopApp DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Calculator.lnk" />
      </taskbar:TaskbarPinList>
    </defaultlayout:TaskbarLayout>
  </CustomTaskbarLayoutCollection>
</LayoutModificationTemplate>
```

The [full XML schema](https://learn.microsoft.com/en-us/windows/configuration/taskbar/xsd) supports more than shortcut files (.lnk), but I won't be covering them to keep things simple. Instead of manually editing the XML, let's use a PowerShell cmdlet to generate it from a list of shortcut files:

```powershell
function New-LayoutModificationXml {
    [CmdletBinding()]
    param (
        [string[]] $LnkPaths,
        [string] $OutputPath = "C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml",
        [ValidateSet("Append", "Replace")]
        [string] $PinListPlacement = "Replace"
    )

    $xml = New-Object System.Xml.XmlDocument
    $root = $xml.CreateElement("LayoutModificationTemplate", "http://schemas.microsoft.com/Start/2014/LayoutModification")
    $xml.AppendChild($root) | Out-Null
    $root.SetAttribute("xmlns:defaultlayout", "http://schemas.microsoft.com/Start/2014/FullDefaultLayout")
    $root.SetAttribute("xmlns:taskbar", "http://schemas.microsoft.com/Start/2014/TaskbarLayout")
    $root.SetAttribute("Version", "1")
    $collection = $xml.CreateElement("CustomTaskbarLayoutCollection", $root.NamespaceURI)
    $collection.SetAttribute("PinListPlacement", $PinListPlacement)
    $root.AppendChild($collection) | Out-Null
    $layout = $xml.CreateElement("defaultlayout:TaskbarLayout", $root.GetAttribute("xmlns:defaultlayout"))
    $collection.AppendChild($layout) | Out-Null
    $pinList = $xml.CreateElement("taskbar:TaskbarPinList", $root.GetAttribute("xmlns:taskbar"))
    $layout.AppendChild($pinList) | Out-Null
    foreach ($lnk in $LnkPaths) {
        $desktopApp = $xml.CreateElement("taskbar:DesktopApp", $root.GetAttribute("xmlns:taskbar"))
        $desktopApp.SetAttribute("DesktopApplicationLinkPath", $lnk)
        $pinList.AppendChild($desktopApp) | Out-Null
    }
    $xml.Save($OutputPath)
}
```

Paste the `New-LayoutModificationXml` cmdlet into a PowerShell terminal, and then paste the following code snippet to generate a sample LayoutModification.xml file in the default location:

```powershell
$LnkPaths = @(
    "%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk"
    "%APPDATA%\Microsoft\Windows\Start Menu\Programs\File Explorer.lnk"
    "%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Notepad.lnk"
    "%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Calculator.lnk"
)
New-LayoutModificationXml -LnkPaths $LnkPaths -PinListPlacement "Replace"
```

Inspect the resulting `LayoutModification.xml` file in Notepad:

```powershell
notepad "C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml"
```

Feel free to edit the XML manually, but I would recommend updating the original cmdlet to accommodate your needs. ChatGPT or Claude can handle this kind of task quite well.

## Testing Taskbar Layout Modifications

So, you now have a `LayoutModification.xml` file which looks good in theory, but you want to see the end result. Instead of using RDP to login interactively with newly created users, I offer you the much simpler `Reset-TaskbarLayout` PowerShell cmdlet instead:

```powershell
function Reset-TaskbarLayout {
    Get-Process explorer | Stop-Process -Force
    Remove-Item "$Env:AppData\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*" -Force -ErrorAction SilentlyContinue
    Remove-Item "$Env:AppData\Microsoft\Windows\Shell\*.dat" -Force -ErrorAction SilentlyContinue
    Remove-Item "$Env:AppData\Microsoft\Windows\Shell\LayoutModification.xml" -Force -ErrorAction SilentlyContinue
}
```

All you have to do is open a terminal, paste the cmdlet definition, then invoke `Reset-TaskbarLayout` after updating the `LayoutModification.xml` file. Here's what a successfully customized taskbar looks like:

![customized pinned apps in taskbar](/images/posts/taskbar-pinned-apps-customized.png)

However, because it's a hack, you can often end up with blank icons:

![blank pinned app icons in taskbar](/images/posts/taskbar-pinned-apps-blank-icons.png)

When this happens, just right-click and unpin all the blank icons, then use `Reset-TaskBarLayout` again. I suspect taskbar pinning relies on a background process (RuntimeBroker.exe) separate from explorer.exe which can't easily be forced to reload everything.

## Conclusion

While taskbar pinning in Windows 11 was never meant to be scripted in this way, using PowerShell to generate `LayoutModification.xml` and forcing a taskbar layout reset gets the job done.

Is this officially supported? No.  
Is it reliable for automation? Mostly.  
Is it good enough? For many scenarios — yes.

If you've found other reliable tricks to simplify taskbar app pinning, feel free to share them with me!
