# SDIO Download

# Url where file is hosted
$Url = "https://www.glenn.delahoy.com/downloads/sdio/SDIO_1.12.15.756.zip"

# Where to download
$TargetDir = [System.Environment]::GetFolderPath("UserProfile") + "\Documents\Apps\SDIO"

# Make folder
mkdir $TargetDir

# Define the full path for the downloaded ZIP file
$ZipFilePath = Join-Path -Path $TargetDir -ChildPath "SDIO_1.12.15.756.zip"

# Download the ZIP file
Invoke-WebRequest -Uri $Url -OutFile $ZipFilePath

#Unzip SDIO
7z x $ZipFilePath -o"$TargetDir"

# Delete the downloaded file
Remove-Item -Path $ZipFilePath -Force

Write-Host -ForegroundColor Green "ZIP file downloaded and unzipped, Starting SDIO."

# Start SDIO
Start-Process $env:USERPROFILE\Documents\Apps\SDIO\SDIO_x64_R756.exe

#Removing Items
#Remove-Item "$env:USERPROFILE\Downloads\logs" -Recurse -Force
#Remove-Item "$env:USERPROFILE\Downloads\drivers" -Recurse -Force
#Remove-Item "$env:USERPROFILE\Downloads\indexes" -Recurse -Force
#Remove-Item "$env:USERPROFILE\Downloads\sdio.cfg" -Force
#Remove-Item "$env:USERPROFILE\Downloads\Update" -Force

# Clean GPU Install
# URL for the ZIP file
$Url = "https://ftp.nluug.nl/pub/games/PC/guru3d/ddu/[Guru3D.com]-DDU.zip"

# Target directory for download
$TargetDir = [System.Environment]::GetFolderPath("UserProfile") + "\Downloads"

# Full path for the downloaded ZIP file
$ZipFilePath = Join-Path -Path $TargetDir -ChildPath "[Guru3D.com]-DDU.zip"

# Download the ZIP file
Invoke-WebRequest -Uri $Url -OutFile $ZipFilePath

# Unzip ZIP
7z x "[Guru3D.com]-DDU.zip"

# Remove Download files
Remove-Item "**-DDU.zip" -Force
Remove-Item Guru3D.com -Recurse -Force

# Unzip Setup folder
7z x "DDU v**.exe"

# Remove Setup folder
Remove-Item "DDU v**.exe" -Force

# Start DDU
Start-Process "$env:USERPROFILE\Downloads\DDU v**\Display Driver Uninstaller.exe"

Write-Host -ForegroundColor Green "DisplayDriverUninstaller Downloaded and Started, Remember to restart"

# GPU
# AMD https://www.amd.com/en/support
# winget install TechPowerUp.NVCleanstall
# winget uninstall TechPowerUp.NVCleanstall

# Restart