#Lastes powershell Download
# Specify the GitHub repository owner and name
$Owner = "PowerShell"
$Repo = "PowerShell"

# Get the name of the latest x64.msi file
$AssetName = (Invoke-RestMethod -Uri "https://api.github.com/repos/$Owner/$Repo/releases/latest").assets | Where-Object { $_.name -like "*x64.msi" } | Select-Object -ExpandProperty name

# URL for the latest x64.msi
$Url = "https://github.com/$Owner/$Repo/releases/latest/download/$AssetName"

# Directory where to download
$TargetDir = [System.Environment]::GetFolderPath("UserProfile") + "\Downloads"

# Download the latest x64.msi
$DownloadPath = Join-Path $TargetDir $AssetName
Invoke-WebRequest -Uri $Url -OutFile $DownloadPath

# Install the downloaded x64.msi
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$DownloadPath`" /quiet"

# Wait for a moment to allow the installation to complete
Start-Sleep -Seconds 10

# Delete the downloaded x64.msi file
Remove-Item -Path $DownloadPath -Force

Write-Host -ForegroundColor Green "Latest PowerShell downloaded, installed, and deleted from $TargetDir."


# Lastes python 3.11 Download
# URL where the latest Python installer is
$Url2 = "https://www.python.org/ftp/python/3.11.4/python-3.11.4-amd64.exe "

# Directory where to download
$TargetDir2 = [System.Environment]::GetFolderPath("UserProfile") + "\Downloads"

# Full path for the downloaded installer
$InstallerPath = Join-Path -Path $TargetDir2 -ChildPath "python-installer.exe"

# Download the latest Python installer
Invoke-WebRequest -Uri $Url2 -OutFile $InstallerPath

# Start the Python installer
Start-Process -FilePath $InstallerPath

# Update Python
winget Python.Python.3.11

# Delete the downloaded file
Remove-Item -Path $InstallerPath -Force

Write-Host -ForegroundColor Green "Latest version of Python downloaded to $TargetDir2 and installer started."

#### **softwares not on winget or scoop** 
# Davinci Resolver
# https://github.com/mifi/lossless-cut/releases
# Windows subsystem for Android
# Whisper
# Autoruns
# ProcessExplorer
# Cheat Engine