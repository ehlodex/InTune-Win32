#==================================================
# Script Name : install.ps1
# Synopsis    : Install ...
# Description : ...
# Notes       : ...
# Last update : yyyy.mm.dd by Your Name Here ...
#==================================================

# Chocolatey
$PackageName = "package"
try {
  Start-Process -FilePath "C:\ProgramData\chocolatey\choco.exe" -ArgumentList "install $PackageName -y"
} catch {
  $ErrorMsg = $_.Exception.Message
  Write-Error $ErrorMsg
  Exit 1
}
Exit 0


# MsiExec
$MsiName = "installer.msi"
try {
  Start-Process "msiexec" -ArgumentList "/i $MsiName /qn" -Wait -NoNewWindow
  # Remove shortcut from Public Desktop
  Remove-Item -Path "C:\Users\Public\Desktop\template.lnk" -Force -ErrorAction SilentlyContinue
} catch {
  $ErrorMsg = $_.Exception.Message
  Write-Error $ErrorMsg
  Exit 1
}
Exit 0


# WinGet
$AppID = "Package.Name"
try {
  $winget = "$(Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" | Sort-Object -Property Path | Select-Object -Last 1)\winget.exe"
  & $winget install --id "$AppID" --scope machine --source winget --silent --accept-package-agreements --accept-source-agreements --disable-interactivity
} catch {
  $ErrorMsg = $_.Exception.Message
  Write-Error $ErrorMsg
  Exit 1
}
Exit 0
