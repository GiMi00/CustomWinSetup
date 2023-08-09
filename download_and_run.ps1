# Specify the GitHub repository owner and name
$Owner = "PowerShell"
$Repo = "PowerShell"

# Get the latest release tag from GitHub API
$ReleaseTag = (Invoke-RestMethod -Uri "https://api.github.com/repos/$Owner/$Repo/releases/latest").tag_name

# Get the asset name of the latest x64.msi file
$AssetName = (Invoke-RestMethod -Uri "https://api.github.com/repos/$Owner/$Repo/releases/latest").assets | Where-Object { $_.name -like "*x64.msi" } | Select-Object -ExpandProperty name

# Create a download URL for the latest x64.msi asset
$Url = "https://github.com/$Owner/$Repo/releases/latest/download/$AssetName"

# Specify the target directory for download
$TargetDir = [System.Environment]::GetFolderPath("UserProfile") + "\Downloads"

# Download the latest x64.msi asset
Invoke-WebRequest -Uri $Url -OutFile "$TargetDir\$AssetName"

# Install the downloaded x64.msi using msiexec
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$TargetDir\$AssetName`" /quiet"

Write-Host "Latest x64.msi downloaded to $TargetDir and installed."
