@echo off

:: Set the script name
set "ScriptName=WinSetup.ps1"

:: Get the current directory
for %%A in ("%~dp0") do set "ScriptDir=%%~fA"

:: Generate the PowerShell script
echo Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy RemoteSigned -File ""%ScriptDir%\%ScriptName%""" > "%Temp%\RunScriptAsAdmin.ps1"

:: Create a shortcut
powershell.exe -ExecutionPolicy Bypass -File "%Temp%\RunScriptAsAdmin.ps1"

:: Clean up
del "%Temp%\RunScriptAsAdmin.ps1"
