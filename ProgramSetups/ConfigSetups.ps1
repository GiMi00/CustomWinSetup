# Get the current script's directory
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

function SetupTerminalConfig {
    Write-Host "Setting up Terminal config..."

    $terminalconf = "$scriptDir\configs\terminal\settings.json"
    $DestinationFolder = "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\"

    # Move the terminal config to the destination folder
    Move-Item -Path $terminalconf -Destination $DestinationFolder -Force

    Write-Host -ForegroundColor Green "Terminal config all set up."
}

function SetupStarShipConfig {
    Write-Host "Setting up StarShip config..."

    mkdir $env:USERPROFILE\.config

    $SSConfig = "$scriptDir\configs\terminal\starship.toml"
    $DestinationFolder = "$env:USERPROFILE\.config\starship.toml"

    # Move the SSConfig to the destination folder
    Move-Item -Path $SSConfig -Destination $DestinationFolder -Force

    Write-Host -ForegroundColor Green "StarShip config all set up."
}

function SetupPwshProfile {
    Write-Host "Setting up PowerShell Profile..."

    mkdir $env:USERPROFILE\Documents\PowerShell
    New-Item -Path $Profile -Type File -Force
    
    # Read the content of the source file
    $sourceContent = Get-Content -Path "$scriptDir\configs\terminal\Microsoft.PowerShell_profile.ps1"
    # Write the content to the destination file
    $sourceContent | Set-Content -Path "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

    Write-Host -ForegroundColor Green "Pwsh Profile all set up."
}

function SetupMPVConfig {
    Write-Host "Setting up MPV config..."

    $mpvconfPath = "$scriptDir\configs\mpv.conf"
    $DestinationFolder = "$env:USERPROFILE\scoop\apps\mpv-git\current\portable_config\"

    # Move the mpv.conf to the destination folder
    Move-Item -Path $mpvconfPath -Destination $DestinationFolder -Force

    Write-Host -ForegroundColor Green "MPV config all set up."
}

function SetupYTDLPConfig {
    Write-Host "Setting up yt-dlp config..."

    $ytdlpConf = "$scriptDir\configs\yt-dlp\config.txt"
    mkdir "$env:USERPROFILE\AppData\Roaming\yt-dlp"
    $DestinationFolder = "$env:USERPROFILE\AppData\Roaming\yt-dlp"

    # Move the yt-dlp config to the destination folder
    Move-Item -Path $ytdlpConf -Destination $DestinationFolder -Force

    Write-Host -ForegroundColor Green "yt-dlp config all set up."
}

function SetupVSCodiumConfig {
    Write-Host -ForegroundColor Yellow "Setting up VSCodium config..."

    $CodiumConf = "$scriptDir\configs\VSCodium\settings.json"
    $DestinationFolder = "$env:USERPROFILE\AppData\Roaming\VSCodium\User"

    # Move the Codium config to the destination folder
    Move-Item -Path $CodiumConf -Destination $DestinationFolder -Force

    # Install VSCodium extensions
    $CodTer = "$env:USERPROFILE\AppData\Local\Programs\VSCodium\bin\codium.cmd"
    Start-Process -FilePath $CodTer -ArgumentList "--install-extension formulahendry.code-runner" -Wait
    Start-Process -FilePath $CodTer -ArgumentList "--install-extension Catppuccin.catppuccin-vsc" -Wait
    Start-Process -FilePath $CodTer -ArgumentList "--install-extension vscode-icons-team.vscode-icons" -Wait
    Start-Process -FilePath $CodTer -ArgumentList "--install-extension ms-vscode.powershell" -Wait
    Start-Process -FilePath $CodTer -ArgumentList "--install-extension ms-python.python" -Wait
    Start-Process -FilePath $CodTer -ArgumentList "--install-extension donjayamanne.python-extension-pack" -Wait
    
    Write-Host -ForegroundColor Green "VSCodium config all set up."
}

function SetupBetterfox {

    Write-Host "Setting up Betterfox..."

    $Url = "https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js"
    $DownloadPath = "$env:USERPROFILE\Downloads\user.js"
    $firefoxProfilePath = "$env:USERPROFILE\AppData\Roaming\Mozilla\Firefox\Profiles"

    # Get the path of the default Firefox release folder
    $defaultProfile = Get-ChildItem $firefoxProfilePath | Where-Object { $_.Name -like '*.default-release' }

    # Download the file
    Invoke-WebRequest -Uri $Url -OutFile $DownloadPath

    # Move the downloaded file to the destination folder
    Move-Item -Path $DownloadPath -Destination $defaultProfile -Force

    Write-Host -ForegroundColor Green "Betterfox all set up."
}

# Run the setup functions
SetupTerminalConfig
SetupStarShipConfig
SetupPwshProfile
SetupMPVConfig
SetupYTDLPConfig
SetupVSCodiumConfig
SetupBetterfox
