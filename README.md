# INTUNE WINDOWS 32 APPS

Win32 Apps should be used when multiple files are required, or the tasks cannot
be completed through remediation or a one-time script.

InTune Win32 Apps are any custom application that is not part of the Office 365
 Apps, cannot be installed from the Windows Store, and cannot be installed as 
 an unattened .msi, .appx, .appxbundle, .msix, or .msixbundle (transforms are 
 NOT supported!).

Inune has built-in detection methods to determine if the app is installed, such
 as the presence of a registry key or file. You can also create a custom
 detection script to determine if the Win32 App is installed.

It is recommended to create both an install.ps1 and uninstall.ps1 file, so that
 the app can be removed when it is no longer needed. Since the files are
 uploaded as a package, it is not necessary to use the package name as a prefix
 on the files.

Everything for the .intunewin file should be in the ./source folder.
Supporting files (e.g., detection script, logos, and documentation) should be in the project root.

[Prepare Win32 app content for upload](https://learn.microsoft.com/en-us/mem/intune/apps/apps-win32-prepare)

Install Command:  
`powershell.exe -ExecutionPolicy Bypass -File install.ps1`

Uninstall Command:  
`powershell.exe -ExecutionPolicy Bypass -File uninstall.ps1`
