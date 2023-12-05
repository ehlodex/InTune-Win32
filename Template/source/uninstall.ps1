#==================================================
# Software : Template
# Action   : Uninstall
# Method   : choco, misexec, winget, etc
# Updated  : yyyy.mm.dd by Your Name Here ...
#==================================================

# Chocolatey
$PackageName = "package"
try {
  Start-Process -FilePath "C:\ProgramData\chocolatey\choco.exe" -ArgumentList "uninstall $PackageName -a -x -y"
} catch {
  $ErrorMsg = $_.Exception.Message
  Write-Error $ErrorMsg
  Exit 1
}
Write-Output "$PackageName was removed successfully."
Exit 0


# MsiExec
$MsiName = "installer.msi"
try {
  Start-Process "msiexec" -ArgumentList "/x $MsiName /qn" -Wait -NoNewWindow
} catch {
  $ErrorMsg = $_.Exception.Message
  Write-Error $ErrorMsg
  Exit 1
}
Write-Output "$MsiName was removed successfully."
Exit 0


# WinGet
$AppID = "Package.Name"
try {
  $winget = "$(Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" | Sort-Object -Property Path | Select-Object -Last 1)\winget.exe"
  & $winget uninstall --id "$AppID" --scope machine --source winget --silent --accept-source-agreements --disable-interactivity --purge --force
} catch {
  $ErrorMsg = $_.Exception.Message
  Write-Error $ErrorMsg
  Exit 1
}
Write-Output "$AppID was removed successfully."
Exit 0
