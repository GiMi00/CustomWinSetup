Write-Host "Install Windows Runtimes"
# Install runtimes
winget install Microsoft.VCRedist.2010.x86 Microsoft.VCRedist.2010.x64 Microsoft.VCRedist.2013.x86 Microsoft.VCRedist.2013.x64 Microsoft.VCRedist.2015+.x86 --silent

Write-Host -ForegroundColor Green "Windows Runtimes installed"

Write-Host "Install winget softwares"
# Install Programs
# winget install Klocman.BulkCrapUninstaller Microsoft.PowerToys TheDocumentFoundation.LibreOffice nomacs.nomacs VSCodium.VSCodium Obsidian.Obsidian Valve.Steam OBSProject.OBSStudio Mozilla.Firefox Git.Git GIMP.GIMP Audacity.Audacity yt-dlp qalculate Neovim.Neovim Starship.Starship# More Programs
winget install nomacs.nomacs Mozilla.Firefox Git.Git yt-dlp VSCodium.VSCodium Starship.Starship # Less programs

winget upgrade --all --silent

# Start and stop Codium to generate user directory
Start-Process -file "$env:USERPROFILE\AppData\Local\Programs\VSCodium\VSCodium.exe"
Write-Host -ForegroundColor Yellow "Wait, Generating VSCodium User folder.."
Start-Sleep -Seconds 10
Stop-Process -process VSCodium -force -wait

# Start and stop Firefox to generate user directory
Start-Process -FilePath "C:\Program Files\Mozilla Firefox\firefox.exe"
Write-Host -ForegroundColor Yellow "Wait, Generating Firefox User folder.."
Start-Sleep -Seconds 10
Stop-Process -process firefox -force -wait

Write-Host -ForegroundColor Green "Winget Apps installed"