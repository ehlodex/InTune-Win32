#==================================================
# Software : WinGet Upgrade Daemon
# Action   : Uninstall
# Method   : File + Task
#==================================================

$TaskName = "WinGet Upgrade Daemon"
$TaskPath = "CompanyName"
$DaemonPath = "C:\ProgramData\$TaskPath\winget-daemon.ps1"
$DaemonDirectory = Split-Path -parent "$DaemonPath"

If (Test-Path -Path "$DaemonPath") {
  Remove-Item -Path "$DaemonPath" -Force -Confirm:$False
}

If (! (Get-ChildItem -Path "$DaemonDirectory")) {
  Remove-Item $DaemonDirectory -Force -Confirm:$False
}

try {
  Unregister-ScheduledTask -TaskName "$TaskName" -TaskPath "\$TaskPath\" -Confirm:$False -ErrorAction SilentlyContinue
} catch { }

Write-Output "Just smile and wave, boys. Smile and wave."
Exit 0
