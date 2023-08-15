@echo off

rem Get the directory of the current batch script
set "scriptDir=%~dp0"

rem Run the PowerShell script
Start powershell.exe -ExecutionPolicy RemoteSigned -File "%scriptDir%\NewPowershell.ps1"