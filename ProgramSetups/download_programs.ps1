function Install-Python {
    # URL where the latest Python installer is
    $Url = "https://www.python.org/ftp/python/3.11.4/python-3.11.4-amd64.exe"

    # Directory where to download
    $TargetDir = [System.Environment]::GetFolderPath("UserProfile") + "\Downloads"

    # Full path for the downloaded installer
    $InstallerPath = Join-Path -Path $TargetDir -ChildPath "python-installer.exe"

    # Download the latest Python installer
    Invoke-WebRequest -Uri $Url -OutFile $InstallerPath

    # Start the Python installer
    Start-Process -FilePath $InstallerPath

    Write-Host -ForegroundColor Green "Remember to Add python.exe to Path and Disable path length limit"

    # Update Python
    winget update Python.Python.3.11

    # Delete the downloaded file
    Remove-Item -Path $InstallerPath -Force

    Write-Host -ForegroundColor Green "Latest version of Python downloaded and installed."
}

function Install-LosslessCut {
    # Define the GitHub repository and API URLs
    $Owner = "mifi"
    $Repo = "lossless-cut"
    $ReleaseUrl = "https://api.github.com/repos/$Owner/$Repo/releases/latest"

    # Get the latest release information
    $ReleaseInfo = Invoke-RestMethod -Uri $ReleaseUrl

    # Find the x64.7z asset
    $Asset = $ReleaseInfo.assets | Where-Object { $_.name -match "x64.7z" }

    if ($Asset) {
        # Define the download URL
        $DownloadUrl = $Asset.browser_download_url

        # Specify the target directory for download
        $TargetDir = [System.Environment]::GetFolderPath("UserProfile") + "\Downloads"

        # Define the full path for the downloaded 7z file
        $DownloadFilePath = Join-Path -Path $TargetDir -ChildPath "LosslessCut.x64.7z"

        # Make folder
        mkdir $env:USERPROFILE\Documents\Apps\Losslesscut

        # Where to move losslesscut
        $MovedFiles = [System.Environment]::GetFolderPath("UserProfile") + "\Documents\Apps\Losslesscut"

        # Download the 7z file
        Invoke-WebRequest -Uri $DownloadUrl -OutFile $DownloadFilePath

        # Extract the contents of the 7z file using 7z command
        Start-Process -FilePath "7z" -ArgumentList "x", "$DownloadFilePath", "-o$MovedFiles", "-r" -Wait

        Write-Host -ForegroundColor Green "LosslessCut x64 has been downloaded and unzipped."
    } else {
        Write-Host -ForegroundColor Red "No x64.7z asset found in the latest release of LosslessCut."
    }

    # Remove item LosslessCut.x64.7z
    Remove-Item -Path $DownloadFilePath -Force
}

function Install-Autoruns {
    # URL where the latest Autoruns is located
    $Url = "https://download.sysinternals.com/files/Autoruns.zip"

    # Directory where to download
    $TargetDir = [System.Environment]::GetFolderPath("UserProfile") + "\Downloads"

    # Full path for the downloaded zip
    $ZipPath = Join-Path -Path $TargetDir -ChildPath "Autoruns.zip"

    # Make folder
    mkdir $env:USERPROFILE\Documents\Apps\Autoruns

    # Where to move Autoruns
    $MoveFiles = [System.Environment]::GetFolderPath("UserProfile") + "\Documents\Apps\Autoruns"

    # Download the latest Autoruns
    Invoke-WebRequest -Uri $Url -OutFile $ZipPath

    # Extract the contents of the zip file using 7z command
    Start-Process -FilePath "7z" -ArgumentList "x", "$ZipPath", "-o$MoveFiles", "-r" -Wait

    Write-Host -ForegroundColor Green "Latest version of Autoruns downloaded."
    
    # Delete the downloaded file
    Remove-Item -Path $ZipPath -Force
}

function Install-ProcessExplorer {
    # URL where the latest Autoruns is located
    $Url = "https://download.sysinternals.com/files/ProcessExplorer.zip"

    # Directory where to download
    $TargetDir = [System.Environment]::GetFolderPath("UserProfile") + "\Downloads"

    # Full path for the downloaded zip
    $ZipPath2 = Join-Path -Path $TargetDir -ChildPath "ProcessExplorer.zip"

    # Make folder
    mkdir $env:USERPROFILE\Documents\Apps\ProcessExplorer

    # Where to move Autoruns
    $MoveFiles = [System.Environment]::GetFolderPath("UserProfile") + "\Documents\Apps\ProcessExplorer"

    # Download the latest Autoruns
    Invoke-WebRequest -Uri $Url -OutFile $ZipPath2

    # Extract the contents of the zip file using 7z command
    Start-Process -FilePath "7z" -ArgumentList "x", "$ZipPath2", "-o$MoveFiles", "-r" -Wait

    Write-Host -ForegroundColor Green "Latest version of ProcessExplorer downloaded."
    
    # Delete the downloaded file
    Remove-Item -Path $ZipPath2 -Force
}

Install-Python
Install-LosslessCut
Install-Autoruns
Install-ProcessExplorer