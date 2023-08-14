winget install OO-Software.ShutUp10
C:\Users\%USERPROFILE%\AppData\Local\Microsoft\WinGet\Packages\OO-Software.ShutUp10_Microsoft.Winget.Source_8wekyb3d8bbwe\OOSU10.exe ooshutup10.cfg
#OOSU10 ooshutup10.cfg

Write-Host -ForegroundColor Green "Windows set for privacy, restarting explorer"

Stop-Process -Name "explorer" -Force
Start-Process -FilePath "explorer.exe"