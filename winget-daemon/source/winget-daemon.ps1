[CmdletBinding()]
Param();

Set-StrictMode -Version Latest

try {
  $winget = (Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe\winget.exe" | Sort-Object -Property Path | Select-Object -Last 1)
  Start-Process -FilePath "$winget" -Wait -NoNewWindow `
    -ArgumentList "upgrade --all --silent --disable-interactivity --accept-package-agreements --accept-source-agreements --force --scope machine"
} catch {
  $ErrorMsg = $_.Exception.Message
  Write-Error $ErrorMsg
  Exit 1
}
