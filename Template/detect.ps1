#==================================================
# Software : Template
# Action   : Detect
# Method   : Chocolatey, winget, registry, etc
# Updated  : yyyy.mm.dd by Your Name Here ...
#==================================================

# Chocolatey
$PackageName = "package"
[int]$PackagesInstalled = "$((choco list $PackageName | findstr "packages installed.")[0])"
If ($PackagesInstalled -eq 1) {
  Write-Output "Cound not find $PackageName because count was $PackagesInstalled"
  Exit 1
}
Write-Output "Package $PackageName is installed with count $PackagesInstalled"
Exit 0


# MsiExec
# Use the MSI detection rule in InTune


# WinGet
$AppID = "Package.Name"
try {
  $winget = "$(Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" | Sort-Object -Property Path | Select-Object -Last 1)\winget.exe"
  $installed = (& $winget list --id "$AppID" | findstr "$AppID")
  If (! $installed) { throw "$AppID is not installed!" }
} catch {
  $ErrorMsg = $_.Exception.Message
  Write-Error $ErrorMsg
  Exit 1
}
Write-Output "$AppID is installed!"
Exit 0
