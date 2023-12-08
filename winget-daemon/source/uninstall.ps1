#==================================================
# Software : WinGet Upgrade Daemon
# Action   : Uninstall
# Method   : File + Task
#==================================================

$TaskName = "WinGet Upgrade Daemon"
$TaskPath = "CompanyName"
$DAemonPath = "C:\ProgramData\$TaskPath\winget-daemon.ps1"


If (Test-Path -Path "$DaemonPath") {
  Remove-Item -Path "$DaemonPath" -Force
}

try {
  Unregister-ScheduledTask -TaskName "$TaskName" -TaskPath "\$TaskPath\" -Confirm:$False -ErrorAction SilentlyContinue
} catch { }
