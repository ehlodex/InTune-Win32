#==================================================
# Software : WinGet Upgrade Daemon
# Action   : Detect
# Method   : File + Task
#==================================================

$TaskName = "WinGet Upgrade Daemon"
$TaskPath = "CompanyName"  # no spaces is best
$DaemonPath = "C:\ProgramData\$TaskPath\winget-daemon.ps1"


If (! (Test-Path -Path "$DaemonPath" -PathType Leaf)) {
  Write-Host "The winget daemon is not installed!"
  Exit 1
}

If (! (Get-ScheduledTask -TaskName "$TaskName" -TaskPath "\$TaskPath\")) {
  Write-Host "The winget deamon is not scheduled!"
  Exit 1
}

Write-Host "The wiget daemon is installed and scheduled."
Exit 0
