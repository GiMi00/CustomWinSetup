Write-Host -ForegroundColor Cyan "Starting custom windows setup"

# Get the current script's directory
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Construct paths to scripts
$ScriptPaths = @(
    ".\ProgramSetups\mss_custom_remove.ps1",
    ".\TweakScripts\ShutUp10.ps1",
    ".\TweakScripts\clean_taskbar.bat",
    ".\TweakScripts\disable_search.bat",
    ".\TweakScripts\folder_settings.bat",
    ".\TweakScripts\OldMenuBack.bat",
    ".\TweakScripts\Bandwith_fix.bat",
    ".\TweakScripts\DarkTheme.bat",
    ".\TweakScripts\jpeg_best_quality.bat",
    ".\ProgramSetups\ScoopList.ps1",
    ".\ProgramSetups\WingetList.ps1",
    ".\ProgramSetups\download_programs.ps1",
    ".\ProgramSetups\ConfigSetups.ps1"
    # ".\ProgramSetups\DriverSetup.ps1"
)

# Loop through the script paths and run them
foreach ($scriptPath in $ScriptPaths) {
    $fullPath = Join-Path -Path $scriptDir -ChildPath $scriptPath
    if ($scriptPath -like "*.ps1") {
        Start-Process pwsh.exe -ArgumentList "-File", $fullPath -Wait
    } elseif ($scriptPath -like "*.bat") {
        Start-Process cmd.exe -ArgumentList "/c", $fullPath -Wait
    }
    Write-Host -ForegroundColor Green "$fullPath executed"
}


# Prob don't include this in public script
# Ask if you want to run winutil (run tweaks in winutil, exept ShutUp10)
$confimrun = Read-Host "Do you want to run WinUtil? (Type 'Y' to confirm)"

# Check if the user's input is 'Y' or 'y'
if ($confimrun -eq "Y" -or $confimrun -eq "y") {
    # run winutil
    Invoke-RestMethod https://christitus.com/win | Invoke-Expression
    Write-Host "Running WinUtil."
} else {
    Write-Host "Canceled."
}

# Restart windwos
# Ask the user for confirmation
$confirmation = Read-Host "Do you want to restart the computer? (Type 'Y' to confirm)"

# Check if the user's input is 'Y' or 'y'
if ($confirmation -eq "Y" -or $confirmation -eq "y") {
    # Reboot the system
    Restart-Computer -Force
    Write-Host "System will be rebooted."
} else {
    Write-Host "Restart canceled."
}
