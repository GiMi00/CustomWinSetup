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

Write-Host -ForegroundColor Green "Remember to Add python.exe to Path and Disable path length limit"

# Update Python
winget update Python.Python.3.11

# Delete the downloaded file
Remove-Item -Path $InstallerPath -Force

Write-Host -ForegroundColor Green "Latest version of Python downloaded to $TargetDir2 and installer started."


# Download Losslesscut
# Define the GitHub repository and API URLs
$Owner = "mifi"
$Repo = "lossless-cut"
$ReleaseUrl = "https://api.github.com/repos/$Owner/$Repo/releases/latest"

# Get the latest release information
$ReleaseInfo = Invoke-RestMethod -Uri $ReleaseUrl

# Find the x64.7z asset
$Asset = $ReleaseInfo.assets | Where-Object { $_.name -match "x64.7z" }

if ($Asset) {
    # Define the download URL
    $DownloadUrl = $Asset.browser_download_url

    # Specify the target directory for download
    $TargetDir = [System.Environment]::GetFolderPath("UserProfile") + "\Downloads"

    # Define the full path for the downloaded 7z file
    $DownloadFilePath = Join-Path -Path $TargetDir -ChildPath "LosslessCut.x64.7z"

    # Make folder
    mkdir $env:USERPROFILE\Documents\Apps\Losslesscut

    # Where to move losslesscut
    $MovedFiles = [System.Environment]::GetFolderPath("UserProfile") + "\Documents\Apps\Losslesscut"

    # Download the 7z file
    Invoke-WebRequest -Uri $DownloadUrl -OutFile $DownloadFilePath

    # Extract the contents of the 7z file using 7z command
    Start-Process -FilePath "7z" -ArgumentList "x", "$DownloadFilePath", "-o$MovedFiles", "-r" -Wait

    Write-Host -ForegroundColor Green "LosslessCut x64 has been downloaded and unzipped."
} else {
    Write-Host -ForegroundColor Green "No x64.7z asset found in the latest release of LosslessCut."
}

# Remove item LosslessCut.x64.7z
Remove-Item -Path $DownloadFilePath -Force


#### **softwares not on winget or scoop** 
# Davinci Resolver
# Windows subsystem for Android
# Whisper
# Autoruns
# ProcessExplorer
# Cheat Engine