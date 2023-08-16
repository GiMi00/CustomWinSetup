@echo off

:: Enable display full path in the title bar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v "FullPath" /t REG_DWORD /d 1 /f

:: Show hidden files, folders, and drives
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f

:: Uncheck "Hide empty drives"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideDrivesWithNoMedia" /t REG_DWORD /d 0 /f

:: Uncheck "Hide extensions for known file types"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f

:: Uncheck "Hide folder merge conflicts"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideMergeConflicts" /t REG_DWORD /d 0 /f

:: Enable "Use check boxes to select items"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AutoCheckSelect" /t REG_DWORD /d 1 /f

:: Enable "Show all folders"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllFolders" /t REG_DWORD /d 1 /f

echo Hidden folder settings enabled, restarting explorer.