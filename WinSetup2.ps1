Set-ExecutionPolicy -ExecutionPolicy Bypass

Write-Host "  ___           _              __      __ _        ___       _                 " -foregroundColor blue
Write-Host " / __|_  _  ___| |_  ___  _ __ \ \    / /(_) _ _  / __| ___ | |_  _  _ _ __    " -foregroundColor blue
Write-Host "| (__ | | ||(_-|  _|/ _ \| '  \ \ \/\/ / | || ' \ \__ \/ -_)|  _|| || || '_ \  " -foregroundColor blue
Write-Host " \___|\_,_|/__/ \__|\___/|_|_|_| \_/\_/  |_||_||_||___/\___| \__| \_,_|| .__/  " -foregroundColor blue
Write-Host "                                                                       |_|     " -foregroundColor blue

# Get the current script's directory
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
# Scripts
$MSremove = Join-Path -Path $scriptDir -ChildPath ".\ProgramSetups\mss_custom_remove.ps1"
$ShutUp10 = Join-Path -Path $scriptDir -ChildPath ".\TweakScripts\ShutUp10.ps1"
$CleanTask = Join-Path -Path $scriptDir -ChildPath ".\TweakScripts\clean_taskbar.bat"
$DSearch = Join-Path -Path $scriptDir -ChildPath ".\TweakScripts\disable_search.bat"
$FolderS= Join-Path -Path $scriptDir -ChildPath ".\TweakScripts\folder_settings.bat"
$OldMenu = Join-Path -Path $scriptDir -ChildPath ".\TweakScripts\OldMenuBack.bat"
$NetFix = Join-Path -Path $scriptDir -ChildPath ".\TweakScripts\Bandwith_fix.bat"
$DarkTheme = Join-Path -Path $scriptDir -ChildPath ".\TweakScripts\DarkTheme.bat"
$BestQuality = Join-Path -Path $scriptDir -ChildPath ".\TweakScripts\jpeg_best_quality.bat"
$ScoopList = Join-Path -Path $scriptDir -ChildPath ".\ProgramSetups\ScoopList.ps1"
$WingetList = Join-Path -Path $scriptDir -ChildPath ".\ProgramSetups\WingetList.ps1"
$DPorgrams= Join-Path -Path $scriptDir -ChildPath ".\ProgramSetups\download_programs.ps1"
$ConfigS= Join-Path -Path $scriptDir -ChildPath ".\ProgramSetups\ConfigSetups.ps1"
$DriverS= Join-Path -Path $scriptDir -ChildPath ".\ProgramSetups\DriverSetup.ps1"

# Script setups
function Show-Menu {
    param (
        [string]$Prompt,
        [scriptblock]$OptionA,
        [scriptblock]$OptionB
    )

    Write-Host $Prompt
    $choice = Read-Host "Enter your choice"

    switch ($choice) {
        "Y" { & $OptionA }
        "n" { & $OptionB }
        Default { Write-Host "Invalid choice" }
    }
}

# MSS Remove Options
Show-Menu -Prompt "Do you want to Remove ALL Microsoft Store Apps [Y/n]?" -OptionA {
    Write-Host -ForegroundColor Yellow "Removing store apps.."
    Start-Process pwsh.exe -ArgumentList "-File", $MSremove -Wait
    Write-Host -ForegroundColor Green "MS Store Apps Removed!"
} -OptionB {
    Write-Host -ForegroundColor Red "Removal canceled!"
}

# ShutUp10 Fix
Show-Menu -Prompt "Do you want to remove Microsoft telemetry (ShutUp10) [Y/n]?" -OptionA {
    Write-Host -ForegroundColor Yellow "Running ShutUp10.."
    Start-Process pwsh.exe -ArgumentList "-File", $ShutUp10 -Wait
    Write-Host -ForegroundColor Green "ShutUp10 Fixes applied!"
} -OptionB {
    Write-Host -ForegroundColor Red "Running Fixes Canceled!"
}

# Tweak setup options
function Show-TweakMenu {
    Clear-Host
    Write-Host -ForegroundColor Cyan "Windows Tweaks Setup"
    Write-Host -ForegroundColor Green "1. Run All Tweaks"
    Write-Host "2. Clean Taskbar"
    Write-Host "3. Disable Bing Search"
    Write-Host "4. Show hidden folders"
    Write-Host "5. Bring back old Context menu"
    Write-Host "6. Remove Windows bandwidth limit"
    Write-Host "7. Set Dark Theme"
    Write-Host "8. Set best JPEG wallpaper quality"
    Write-Host -ForegroundColor Green "9. Continue, when ready!"
}

function Get-Choice {
    $choice = Read-Host "Choose a Number"
    return $choice
}

$finished = $false

while (-not $finished) {
    Show-TweakMenu
    $menuChoice = Get-Choice

    switch ($menuChoice) {
        "1" {
            Write-Host "You chose Option 1 - Run All Tweaks"
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c $CleanTask" -Wait
            Write-Host -ForegroundColor Green "Taskbar cleaned!"
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c $DSearch" -Wait
            Write-Host -ForegroundColor Green "Bing Search disabled!"
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c $FolderS" -Wait
            Write-Host -ForegroundColor Green "Hidden folders visible!"
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c $OldMenu" -Wait
            Write-Host -ForegroundColor Green "Old context menu back!"
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c $NetFix" -Wait
            Write-Host -ForegroundColor Green "Bandwidth limit removed!"
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c $DarkTheme" -Wait
            Write-Host -ForegroundColor Green "Dark Theme enabled!"
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c $BestQuality" -Wait
            Write-Host -ForegroundColor Green "Best quality wallppaper option set!"
            Write-Host -ForegroundColor Green "All Tweaks applied!"
        }

        "2" {
            Write-Host "You chose Option 2 - Clean Taskbar"
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c $CleanTask" -Wait
            Write-Host -ForegroundColor Green "Taskbar cleaned!"
        }

        "3" {
            Write-Host "You chose Option 3 - Disable Bing Search"
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c $DSearch" -Wait
            Write-Host -ForegroundColor Green "Bing Search disabled!"
        }

        "4" {
            Write-Host "You chose Option 4 - Show hidden folders"
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c $FolderS" -Wait
            Write-Host -ForegroundColor Green "Hidden folders visible!"       
        }

        "5" {
            Write-Host "You chose Option 5 - Bring back old Context menu"
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c $OldMenu" -Wait
            Write-Host -ForegroundColor Green "Old context menu back!"
        }

        "6" {
            Write-Host "You chose Option 6 - Remove Windows bandwidth limit"
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c $NetFix" -Wait
            Write-Host -ForegroundColor Green "Bandwidth limit removed!"
        }

        "7" {
            Write-Host "You chose Option 7 - Set Dark Theme"
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c $DarkTheme" -Wait
            Write-Host -ForegroundColor Green "Dark Theme enabled!"
        }

        "8" {
            Write-Host "You chose Option 8 - Set best JPEG wallpaper quality"
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c $BestQuality" -Wait
            Write-Host -ForegroundColor Green "Best quality wallppaper option set!"
        }

        "9" {
            $finished = $true
        }

        default {
            Write-Host "Invalid choice."
        }
    }
}

# Scoop App Install
Show-Menu -Prompt "Install scoop apps [Y/n]?" -OptionA {
    Write-Host -ForegroundColor Yellow "Installing scoop Apps.."
    Start-Process pwsh.exe -ArgumentList "-File", $ScoopList -Wait
    Write-Host -ForegroundColor Green "Scoop apps installed!"
} -OptionB {
    Write-Host -ForegroundColor Red "Install canceled!"
}

# Winget App Install
Show-Menu -Prompt "Install winget apps [Y/n]?" -OptionA {
    Write-Host -ForegroundColor Yellow "Installing winget Apps.."
    Start-Process pwsh.exe -ArgumentList "-File", $WingetList -Wait
    Write-Host -ForegroundColor Green "Winget apps installed!"
} -OptionB {
    Write-Host -ForegroundColor Red "Install canceled!"
}

Show-Menu -Prompt "Install additional programs [Y/n]?" -OptionA {
    Write-Host -ForegroundColor Yellow "Installing programs.."
    Start-Process pwsh.exe -ArgumentList "-File", $DPorgrams -Wait
    Write-Host -ForegroundColor Green "Additional programs installed!"
} -OptionB {
    Write-Host -ForegroundColor Red "Install canceled!"
}

Show-Menu -Prompt "Setup config files [Y/n]?" -OptionA {
    Write-Host -ForegroundColor Yellow "Setting up configs.."
    Start-Process pwsh.exe -ArgumentList "-File", $ConfigS -Wait
    Write-Host -ForegroundColor Green "Configs all setup!"
} -OptionB {
    Write-Host -ForegroundColor Red "Setup canceled!"
}

Show-Menu -Prompt "Setup Drivers [Y/n]?" -OptionA {
    Write-Host -ForegroundColor Yellow "Setting up drivers.."
    Start-Process pwsh.exe -ArgumentList "-File", $DriverS -Wait
    Write-Host -ForegroundColor Green "Drivers all setup!"
} -OptionB {
    Write-Host -ForegroundColor Red "Setup canceled!"
}


# Recomend running winutil (run tweaks in winutil, exept ShutUp10)
# $confimrun = Read-Host "Do you want to run WinUtil [Y/n]?"
# 
# # Check if the user's input is 'Y' or 'y'
# if ($confimrun -eq "Y" -or $confimrun -eq "y") {
#     # run winutil
#     Write-Host "Running WinUtil."
#     Invoke-RestMethod https://christitus.com/win | Invoke-Expression
# } else {
#     Write-Host "Canceled."
# }

# Restart windwos
# Ask the user for confirmation
Write-Host -ForegroundColor Cyan "Remeber to update Windows"
$confirmation = Read-Host "Do you want to restart the computer [Y/n]?"

# Check if the user's input is 'Y' or 'y'
if ($confirmation -eq "Y" -or $confirmation -eq "y") {
    # Reboot the system
    Restart-Computer -Force
    Write-Host "System will be rebooted."
} else {
    Write-Host "Restart canceled."
}