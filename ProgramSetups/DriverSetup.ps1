function Install-GPUClean {
    # URL where the latest DDU is located
    $Url = "https://ftp.nluug.nl/pub/games/PC/guru3d/ddu/[Guru3D.com]-DDU.zip"

    # Directory where to download
    $TargetDir = [System.Environment]::GetFolderPath("UserProfile") + "\Downloads"

    # Full path for the downloaded zip
    $ZipPath = Join-Path -Path $TargetDir -ChildPath "[Guru3D.com]-DDU.zip"

    Write-Host -ForegroundColor Yellow "Downloading DDU..."

    # Download the latest Autoruns
    Invoke-WebRequest -Uri $Url -OutFile $ZipPath
    
    # 7z location
    $7zip = [System.Environment]::GetFolderPath("UserProfile") + "\scoop\apps\7zip\current\7zG.exe"

    # Extract the contents of the zip file using 7z command
    Start-Process -FilePath $7zip -ArgumentList "x", "$ZipPath", "-o$TargetDir", "-r" -Wait

    Remove-Item -Path "$TargetDir\**DDU.zip" -Force -Recurse
    Remove-Item -Path "$TargetDir\Guru3D.com" -Force -Recurse

    Write-Host -ForegroundColor Yellow "Extract file!"

    Start-Process "$TargetDir\DDU v**" -Wait

    Start-Process "$env:USERPROFILE\Downloads\DDU v**\Display Driver Uninstaller.exe"

    Write-Host -ForegroundColor Green "Latest version of DDU downloaded and started!"

    # Delete the downloaded file
    Remove-Item -Path "$TargetDir\DDU v**.exe" -Force
}

function Install-SDIO {
    # Url where file is hosted
    $Url = "https://www.glenn.delahoy.com/downloads/sdio/SDIO_1.12.15.756.zip"

    # Directory where to download
    $TargetDir = [System.Environment]::GetFolderPath("UserProfile") + "\Downloads"

    # Full path for the downloaded zip
    $ZipPath = Join-Path -Path $TargetDir -ChildPath "SDIO_1.12.15.756.zip"

    # Make folder
    mkdir $env:USERPROFILE\Documents\Apps\SDIO

    # Where to move SDIO
    $MoveFiles = [System.Environment]::GetFolderPath("UserProfile") + "\Documents\Apps\SDIO"

    Write-Host -ForegroundColor Yellow "Downloading SDIO..."

    # Download the latest SDIO
    Invoke-WebRequest -Uri $Url -OutFile $ZipPath
    
    # 7z location
    $7zip = [System.Environment]::GetFolderPath("UserProfile") + "\scoop\apps\7zip\current\7zG.exe"

    # Extract the contents of the zip file using 7z command
    Start-Process -FilePath $7zip -ArgumentList "x", "$ZipPath", "-o$MoveFiles", "-r" -Wait

    Write-Host -ForegroundColor Green "Latest version of SDIO downloaded and started!"

    # Start SDIO
    Start-Process $env:USERPROFILE\Documents\Apps\SDIO\SDIO_x64_R756.exe
    
    # Delete the downloaded file
    Remove-Item -Path $ZipPath -Force
}


$confirmatio = Read-Host "Do You want to clean uninstall DisplayDrivers (required for clean driver install) [Y/n]? "

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
        Write-Host -foregroundColor Red "Setup canceled"
    }

} else {
    Write-Host -foregroundColor Red "Setup canceled."
}


$DriverInstall = Read-Host "Do You want to setup snappy driver installer (SDIO) [Y/n]? "

if ($DriverInstall -eq "Y" -or $DriverInstall -eq "y") {
    # Reboot the system
    Install-SDIO
    Write-Host "SDIO setup started."
} else {
    Write-Host -ForegroundColor Red "Setup canceled."
}