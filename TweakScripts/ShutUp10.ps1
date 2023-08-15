# Get the current script's directory
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Construct paths to other scripts
$ShutUP10 = Join-Path -Path $scriptDir -ChildPath ".\ooshutup10.cfg"


https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe


winget install OO-Software.ShutUp10
.\ShutUp10 $ShutUP10

#OOSU10 ooshutup10.cfg

Write-Host -ForegroundColor Green "Windows set for privacy, restarting explorer"

Stop-Process -Name "explorer" -Force
Start-Process -FilePath "explorer.exe"