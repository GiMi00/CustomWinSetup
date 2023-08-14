#Lastes powershell Download
# Specify the GitHub repository owner and name
$Owner = "PowerShell"
$Repo = "PowerShell"

# Get the asset name of the latest x64.msi file
$AssetName = (Invoke-RestMethod -Uri "https://api.github.com/repos/$Owner/$Repo/releases/latest").assets | Where-Object { $_.name -like "*x64.msi" } | Select-Object -ExpandProperty name

# Create a download URL for the latest x64.msi asset
$Url = "https://github.com/$Owner/$Repo/releases/latest/download/$AssetName"

# Specify the target directory for download
$TargetDir = [System.Environment]::GetFolderPath("UserProfile") + "\Downloads"

# Download the latest x64.msi asset
$DownloadPath = Join-Path $TargetDir $AssetName
Invoke-WebRequest -Uri $Url -OutFile $DownloadPath

# Install the downloaded x64.msi using msiexec
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$DownloadPath`" /quiet"

# Wait for a moment to allow the installation to complete
Start-Sleep -Seconds 10

# Delete the downloaded x64.msi file
Remove-Item -Path $DownloadPath -Force

Write-Host "Latest PowerShell downloaded, installed, and deleted from $TargetDir."


# Lastes python 3.11 Download
# Define the URL for the latest Python installer
$Url2 = "https://www.python.org/ftp/python/3.11.4/python-3.11.4-amd64.exe "

# Specify the target directory for download
$TargetDir2 = [System.Environment]::GetFolderPath("UserProfile") + "\Downloads"

# Define the full path for the downloaded installer
$InstallerPath = Join-Path -Path $TargetDir2 -ChildPath "python-installer.exe"

# Download the latest Python installer
Invoke-WebRequest -Uri $Url2 -OutFile $InstallerPath

# Start the Python installer
Start-Process -FilePath $InstallerPath

# Update Python
winget Python.Python.3.11

# Delete the downloaded file
Remove-Item -Path $InstallerPath -Force

Write-Host "Latest version of Python downloaded to $TargetDir2 and installer started."


# SDIO Download

# Define the URL for the ZIP file
$Url3 = "https://www.glenn.delahoy.com/downloads/sdio/SDIO_1.12.15.756.zip"

# Specify the target directory for download
$TargetDir3 = [System.Environment]::GetFolderPath("UserProfile") + "\Documents\Apps\SDIO"

# Make folder
mkdir $TargetDir3

# Define the full path for the downloaded ZIP file
$ZipFilePath = Join-Path -Path $TargetDir3 -ChildPath "SDIO_1.12.15.756.zip"

# Download the ZIP file
Invoke-WebRequest -Uri $Url3 -OutFile $ZipFilePath

#Unzip SDIO
7z x $ZipFilePath -o"$TargetDir3"

# Delete the downloaded file
Remove-Item -Path $ZipFilePath -Force

Write-Host "ZIP file downloaded and unzipped."

# start SDIO_x64_R756.exe

# https://ftp.nluug.nl/pub/games/PC/guru3d/ddu/[Guru3D.com]-DDU.zip
# [Guru3D.com]-DDU.zip
# Restart
# https://de1-dl.techpowerup.com/files/7QjroJPzyebQgX959f11fQ/1692013260/NVCleanstall_1.16.0.exe
# Restart

#### **softwares not on winget or scoop**
# driver gpu 
# Davinci Resolver
# https://github.com/mifi/lossless-cut/releases
# Calqulate (old winget versio)
# Windows subsystem for Android
# Whisper
# Autoruns
# ProcessExplorer
# Cheat Engine