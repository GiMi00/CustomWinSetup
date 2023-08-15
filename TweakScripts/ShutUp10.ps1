# Get the current script's directory
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Construct paths to other scripts
$ShutUP10 = Join-Path -Path $scriptDir -ChildPath ".\ooshutup10.cfg"

# ShutUP10 URL Download
$Url = "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe"

# Directory where to download
$TargetDir = [System.Environment]::GetFolderPath("UserProfile") + "\Downloads"

# Full path for the downloaded File
$ExePath = Join-Path -Path $TargetDir -ChildPath "OOSU10.exe"

# Download ShutUP10
Invoke-WebRequest -Uri $Url -OutFile $ExePath

# Start SU10
Start-Process -FilePath $ExePath $ShutUP10