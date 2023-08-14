@echo off

:: Set the registry key paths
set BasePath=HKLM\SOFTWARE\Policies\Microsoft
set SubKey=Psched

:: Create the Psched key
reg add "%BasePath%" /v "%SubKey%" /t REG_SZ /d "DummyValue" /f > nul

:: Set the path to the Psched key
set PschedPath="%BasePath%\%SubKey%"

:: Create and set the registry DWORD value
set ValueName=NonBestEffortLimit
set Value=0
reg add "%PschedPath%" /v "%ValueName%" /t REG_DWORD /d %Value% /f > nul

echo Windows bandwidth limit removed