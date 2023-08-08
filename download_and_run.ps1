# Specify the GitHub repository owner and name
$Owner = "Klocman"
$Repo = "Bulk-Crap-Uninstaller"

# Get the latest release tag from GitHub API
$ReleaseTag = (Invoke-RestMethod -Uri "https://api.github.com/repos/$Owner/$Repo/releases/latest").tag_name

# Get the asset name of the latest .exe file
$AssetName = (Invoke-RestMethod -Uri "https://api.github.com/repos/$Owner/$Repo/releases/latest").assets | Where-Object { $_.name -like "*.exe" } | Select-Object -ExpandProperty name

# Create a download URL for the latest .exe asset
$Url = "https://github.com/$Owner/$Repo/releases/latest/download/$AssetName"

# Specify the target directory for download
$TargetDir = [System.Environment]::GetFolderPath("UserProfile") + "\Downloads"

# Download the latest .exe asset
Invoke-WebRequest -Uri $Url -OutFile "$TargetDir\$AssetName"

# Execute the downloaded .exe file
Start-Process -FilePath "$TargetDir\$AssetName"

Write-Host "Latest $AssetName downloaded to $TargetDir and executed"
