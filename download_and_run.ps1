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
