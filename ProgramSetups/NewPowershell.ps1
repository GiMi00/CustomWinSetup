Write-Host -ForegroundColor Yellow "Downloading the latest PowerShell, please wait..."

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

Write-Host -ForegroundColor Yellow "Installing latest PowerShell..."
# Install the downloaded x64.msi
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$DownloadPath`" /quiet" -Wait

# Delete the downloaded x64.msi file
Remove-Item -Path $DownloadPath -Force

Write-Host -ForegroundColor Green "Latest PowerShell installed."