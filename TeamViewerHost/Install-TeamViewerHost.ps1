#==================================================
# Script Name : Install-TeamViewerHost.ps1
# Synopsis    : Install TeamViewer Host
# Description : TeamViewer Mass Deployment
# Reference   : https://community.teamviewer.com/English/kb/articles/106041-mass-deployment-overview
# Last update : 2023.08.24 by Josh Burkholder; script created
#==================================================

# Get your assignment ID from https://login.teamviewer.com/nav/deploy/assignments
$TeamViewerAssignmentID = ''  # REQUIRED!

try {
  # Install TeamViewer
  Write-Output "Installing TeamViewer Host. This may take several minutes."
  Start-Process -FilePath "msiexec" -ArgumentList "/i TeamViewer_Host.msi DESKTOPSHORTCUTS=0 /qn" -Wait -NoNewWindow
} catch {
  # Installation fails if any version of TeamViewer is already installed.
  $ErrorMsg = $_.Exception.Message
  Write-Error $ErrorMsg
}

# Sometimes the assignment doesn't work right away, so let's wait
Write-Output "Waiting 15 seconds..."
Start-Sleep -Seconds 15

try {
  # Assign TeamViewer Host (x86)
  Write-Output "Attempting to assign TeamViewer from Program Files (x86)"
  Start-Process -FilePath "C:\Program Files (x86)\TeamViewer\TeamViewer.exe" -ArgumentList "assignment --id $TeamViewerAssignmentID" -Wait -NoNewWindow
  Exit 0
} catch {
  # Unable to find a 32-bit TeamViewer on a 64-bit system...
  $ErrorMsg = $_.Exception.Message
  Write-Error $ErrorMsg
}

try {
  # ...so let's look for an install that matches the OS
  Write-Output "Attempting to assign TeamViewer from Program Files"
  Start-Process -FilePath "C:\Program Files\TeamViewer\TeamViewer.exe" -ArgumentList "assignment --id $TeamViewerAssignmentID" -Wait -NoNewWindow
  Exit 0
} catch {
  # Unable to find a 32-on-32 or 64-on-64 version of TeamViewer
  $ErrorMsg = $_.Exception.Message
  Write-Error $ErrorMsg
}

# You have no chance to survive. Make your time.
Exit 1
