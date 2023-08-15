Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

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

Write-Host -ForegroundColor Green "Latest PowerShell downloaded, installed."


# Get the current script's directory
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Construct paths to other scripts
$WinSetup = Join-Path -Path $scriptDir -ChildPath ".\WinSetup.ps1"
$NoBrakes = Join-Path -Path $scriptDir -ChildPath ".\NoBrakesSetup.ps1"

Write-Host -foregroundcolor Green "Starting Setup"

function Show-Menu {
    Write-Host -ForegroundColor Cyan "Choose an option:"
    Write-Host -ForegroundColor Cyan "1. Normal Install"
    Write-Host -ForegroundColor Cyan "2. No Brakes Install"
}

function OptionA {
    Write-Host -ForegroundColor Green "You chose Normal Install"
    Start-Process pwsh.exe -ArgumentList "-File $WinSetup"
}

function OptionB {
    Write-Host -ForegroundColor Green "You chose No Brakes Install"
    Start-Process pwsh.exe -ArgumentList "-File $NoBrakes"
}

Show-Menu

$choice = Read-Host "Enter your choice (1 or 2)"

switch ($choice) {
    "1" { OptionA }
    "2" { OptionB }
    Default { Write-Host "Invalid choice" }
}
