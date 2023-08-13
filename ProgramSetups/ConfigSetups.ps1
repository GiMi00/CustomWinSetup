#Terminal Setup
Write-Host "Starting config Setup"

$Url = "https://raw.githubusercontent.com/GiMi00/my-configs/master/Windows/terminal/settings.json"
$DownloadPath = "$env:USERPROFILE\Downloads\settings.json"
$DestinationFolder = "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\"

# Download the file
Invoke-WebRequest -Uri $Url -OutFile $DownloadPath

# Move the downloaded file to the destination folder, replacing any existing file
Move-Item -Path $DownloadPath -Destination $DestinationFolder -Force

Write-Host "terminal config all setup."

#mpv Setup
$Url = "https://raw.githubusercontent.com/GiMi00/my-configs/master/Windows/mpv.conf"
$DownloadPath = "$env:USERPROFILE\Downloads\mpv.conf"
$DestinationFolder = "$env:USERPROFILE\scoop\apps\mpv-git\current\portable_config\"

# Download the file
Invoke-WebRequest -Uri $Url -OutFile $DownloadPath

# Move the downloaded file to the destination folder, replacing any existing file
Move-Item -Path $DownloadPath -Destination $DestinationFolder -Force

Write-Host "mpv config all setup."

#yt-dlp Setup
$Url = "https://raw.githubusercontent.com/GiMi00/my-configs/master/Windows/yt-dlp/config.txt"
$DownloadPath = "$env:USERPROFILE\Downloads\config.txt"
$DestinationFolder = "$env:USERPROFILE\AppData\Roaming\yt-dlp"

# Download the file
Invoke-WebRequest -Uri $Url -OutFile $DownloadPath

# Move the downloaded file to the destination folder, replacing any existing file
Move-Item -Path $DownloadPath -Destination $DestinationFolder -Force

Write-Host "yt-dlp config all setup."

# Setup Vscode config , Setup startup update ps1 file