@echo off

:: Set the registry key path
set RegistryPath=HKCU\Control Panel\Desktop

:: Create and set the registry DWORD value
set Name=JPEGImportQuality
set Value=100
reg add "%RegistryPath%" /v "%Name%" /t REG_DWORD /d %Value% /f > nul

echo Best quality JPEG setting enabled, restarting explorer.