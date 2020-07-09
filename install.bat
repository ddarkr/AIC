@echo off
(
  :: Check Admin rights and create VBS Script to elevate
  >nul fsutil dirty query %SYSTEMDRIVE% 2>&1 || (
    :: Very little red console
    mode con cols=80 lines=3 
    color cf
    :: Message
    title Please wait...
    echo.
    echo                         Requesting elevated shell...
    :: Create VBS script
    echo Set UAC = CreateObject^("Shell.Application"^)>"%TEMP%\elevate.vbs"
    echo UAC.ShellExecute "%~f0", "%TEMP%\elevate.vbs", "", "runas", 1 >>"%TEMP%\elevate.vbs"
    if exist "%TEMP%\elevate.vbs" start /b /wait >nul cscript /nologo "%TEMP%\elevate.vbs" 2>&1
    :: Delete elevation script if exist
    if exist "%TEMP%\elevate.vbs" >nul del /f "%TEMP%\elevate.vbs" 2>&1
    exit /b
  )    
)
pushd "%~dp0"
cls
Powershell.exe -noprofile -executionpolicy bypass -file "./script.ps1"
pause
