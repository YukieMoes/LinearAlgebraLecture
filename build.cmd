@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0build.ps1" %*
set "buildResult=%errorlevel%"
if not "%buildResult%"=="0" pause
exit /b %buildResult%
