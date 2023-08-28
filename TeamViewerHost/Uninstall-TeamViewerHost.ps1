#==================================================
# Script Name : Uninstall-TeamViewer.ps1
# Synopsis    : Remove TeamViewer
# Description : Uninstalls the TeamViewer software
# Last update : 2023.08.24 by Josh Burkholder; script created
#==================================================

try {
  Start-Process -FilePath "msiexec" -ArgumentList "/x TeamViewer_Host.msi /qn"
} catch {
  $ErrorMsg = $_.Exception.Message
  Write-Error $ErrorMsg
  Exit 1
}

Exit 0
