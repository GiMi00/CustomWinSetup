# Install runtimes
winget install Microsoft.VCRedist.2010.x86 Microsoft.VCRedist.2010.x64 Microsoft.VCRedist.2013.x86 Microsoft.VCRedist.2013.x64 Microsoft.VCRedist.2015+.x86 --silent

Write-Host "Windows Runtimes installed"

# Install Programs
# winget install Klocman.BulkCrapUninstaller Microsoft.PowerToys TheDocumentFoundation.LibreOffice nomacs.nomacs VSCodium.VSCodium Henry++.simplewall Obsidian.Obsidian Valve.Steam OBSProject.OBSStudio Mozilla.Firefox Git.Git GIMP.GIMP Audacity.Audacity yt-dlp winget install qalculate # My Programs
winget install nomacs.nomacs Henry++.simplewall Mozilla.Firefox Git.Git yt-dlp # General public

winget upgrade --all --silent

Write-Host -ForegroundColor Green "Winget Apps installed"