@echo off

set WinAppUtil=C:\Path\To\IntuneWinAppUtil.exe

%WinAppUtil% -c %~dp0\source -s install.ps1 -o %~dp0

for %%a in ("%~dp0\.") do set "Package=%%~nxa"
ren %~dp0\install.intunewin %Package%.intunewin
