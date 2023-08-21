function Install-GPUClean {
# URL for the ZIP file
$Url = "https://ftp.nluug.nl/pub/games/PC/guru3d/ddu/[Guru3D.com]-DDU.zip"

# Target directory for download
$TargetDir = [System.Environment]::GetFolderPath("UserProfile") + "\Downloads"

# Full path for the downloaded ZIP file
$ZipFilePath = Join-Path -Path $TargetDir -ChildPath "[Guru3D.com]-DDU.zip"

# Download the ZIP file
Invoke-WebRequest -Uri $Url -OutFile $ZipFilePath

# Unzip ZIP
7z x "[Guru3D.com]-DDU.zip"

# Remove Download files
Remove-Item "**-DDU.zip" -Force
Remove-Item Guru3D.com -Recurse -Force

# Unzip Setup folder
7z x "DDU v**.exe"

# Remove Setup folder
Remove-Item "DDU v**.exe" -Force

# Start DDU
Start-Process "$env:USERPROFILE\Downloads\DDU v**\Display Driver Uninstaller.exe"

Write-Host -ForegroundColor Green "DisplayDriverUninstaller Downloaded and Started"
}

function Install-SDIO {
    # Url where file is hosted
    $Url = "https://www.glenn.delahoy.com/downloads/sdio/SDIO_1.12.15.756.zip"
    
    # Where to download
    $TargetDir = [System.Environment]::GetFolderPath("UserProfile") + "\Documents\Apps\SDIO"
    
    # Make folder
    mkdir $TargetDir
    
    # Define the full path for the downloaded ZIP file
    $ZipFilePath = Join-Path -Path $TargetDir -ChildPath "SDIO_1.12.15.756.zip"
    
    # Download the ZIP file
    Invoke-WebRequest -Uri $Url -OutFile $ZipFilePath
    
    #Unzip SDIO
    7z x $ZipFilePath -o"$TargetDir"
    
    # Delete the downloaded file
    Remove-Item -Path $ZipFilePath -Force
    
    Write-Host -ForegroundColor Green "ZIP file downloaded and unzipped, Starting SDIO."
    
    # Start SDIO
    Start-Process $env:USERPROFILE\Documents\Apps\SDIO\SDIO_x64_R756.exe
}


$confirmatio = Read-Host "Do You want to clean uninstall DisplayDrivers (required for clean driver install) [Y/n]? "

# Check if the user's input is 'Y' or 'y'
if ($confirmatio -eq "Y" -or $confirmatio -eq "y") {
    # Reboot the system
    Write-Host "Setup GPUClean started." 
    Install-GPUClean -Wait
} else {
    Write-Host -foregroundColor Red "Setup canceled."
}


$GPUInstall = Read-Host "Do You want to install GPU drivers [Y/n]? "

if ($GPUInstall -eq "Y" -or $GPUInstall -eq "y") {
    $ChooseDrivers = Read-Host "Do you have 'NVIDIA' or 'AMD' GPU? (If neither, type 'X' and choose to setup SDIO)"
    if ($ChooseDrivers -eq "NVIDIA" -or $ChooseDrivers -eq "Nvidia" -or $ChooseDrivers -eq "'NVIDIA'" -or $ChooseDrivers -eq "nvidia" -or $ChooseDrivers -eq "'nvidia'"){
        # Install Nvididia Clean Install
        winget install TechPowerUp.NVCleanstall
        Start-Process "C:\Program Files\NVCleanstall\NVCleanstall.exe" -Wait
        # winget uninstall TechPowerUp.NVCleanstall
    }
    elseif ($ChooseDrivers -eq "AMD" -or $ChooseDrivers -eq "amd" -or $ChooseDrivers -eq "'AMD'" -or $ChooseDrivers -eq "'amd'" -or $ChooseDrivers -eq "Amd") {
        Write-Host "Choose you AMD Driver or Download Auto-Detect installation "
        Start-Process "https://www.amd.com/en/support"
    }
    elseif($ChooseDrivers -eq "X" -or $ChooseDrivers -eq "x" -or $ChooseDrivers -eq "'X'"){
        Write-Host "Setup canceled"
    }

} else {
    Write-Host -foregroundColor Red "Setup canceled."
}


$confirmation = Read-Host "Do You want to setup snappy driver installer (SDIO) [Y/n]? "

if ($confirmation -eq "Y" -or $confirmation -eq "y") {
    # Reboot the system
    Install-SDIO
    Write-Host "SDIO setup started."
} else {
    Write-Host -ForegroundColor Red "Setup canceled."
}