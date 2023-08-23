function SetupTerminalConfig {
    Write-Host "Setting up Terminal config..."

    $Url = "https://raw.githubusercontent.com/GiMi00/my-configs/master/Windows/terminal/settings.json"
    $DownloadPath = "$env:USERPROFILE\Downloads\settings.json"
    $DestinationFolder = "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\"

    # Download the file
    Invoke-WebRequest -Uri $Url -OutFile $DownloadPath

    # Move the downloaded file to the destination folder, replacing any existing file
    Move-Item -Path $DownloadPath -Destination $DestinationFolder -Force

    Write-Host -ForegroundColor Green "Terminal config all set up."
}

function SetupMPVConfig {
    Write-Host "Setting up MPV config..."

    $Url = "https://raw.githubusercontent.com/GiMi00/my-configs/master/Windows/mpv.conf"
    $DownloadPath = "$env:USERPROFILE\Downloads\mpv.conf"
    $DestinationFolder = "$env:USERPROFILE\scoop\apps\mpv-git\current\portable_config\"

    # Download the file
    Invoke-WebRequest -Uri $Url -OutFile $DownloadPath

    # Move the downloaded file to the destination folder, replacing any existing file
    Move-Item -Path $DownloadPath -Destination $DestinationFolder -Force

    Write-Host -ForegroundColor Green "MPV config all set up."
}

function SetupYTDLPConfig {
    Write-Host "Setting up yt-dlp config..."

    $Url = "https://raw.githubusercontent.com/GiMi00/my-configs/master/Windows/yt-dlp/config.txt"
    $DownloadPath = "$env:USERPROFILE\Downloads\config.txt"
    mkdir "$env:USERPROFILE\AppData\Roaming\yt-dlp"
    $DestinationFolder = "$env:USERPROFILE\AppData\Roaming\yt-dlp"

    # Download the file
    Invoke-WebRequest -Uri $Url -OutFile $DownloadPath

    # Move the downloaded file to the destination folder, replacing any existing file
    Move-Item -Path $DownloadPath -Destination $DestinationFolder -Force

    Write-Host -ForegroundColor Green "yt-dlp config all set up."
}

function SetupVSCodiumConfig {
    Write-Host -ForegroundColor Yellow "Setting up VSCodium config..."

    $Url = "https://raw.githubusercontent.com/GiMi00/my-configs/master/Windows/VSCodium/settings.json"
    $DownloadPath = "$env:USERPROFILE\Downloads\settings.json"
    $DestinationFolder = "$env:USERPROFILE\AppData\Roaming\VSCodium\User\settings.json"

    # Download the file
    Invoke-WebRequest -Uri $Url -OutFile $DownloadPath

    # Move the downloaded file to the destination folder, replacing any existing file
    Move-Item -Path $DownloadPath -Destination $DestinationFolder -Force

    # Install VSCodium extensions
    # codium --install-extension formulahendry.code-runner 
    # codium --install-extension Catppuccin.catppuccin-vsc
    # codium --install-extension vscode-icons-team.vscode-icons
    # codium --install-extension ms-vscode.powershell
    # codium --install-extension ms-python.python
    # codium --install-extension donjayamanne.python-extension-pack
# 
    Write-Host -ForegroundColor Green "VSCodium config all set up."
}

# Run the setup functions
SetupTerminalConfig
SetupMPVConfig
SetupYTDLPConfig
SetupVSCodiumConfig
