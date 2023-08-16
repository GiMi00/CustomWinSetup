Write-Host "  ___           _              __      __ _        ___       _                 " -foregroundColor blue
Write-Host " / __|_  _  ___| |_  ___  _ __ \ \    / /(_) _ _  / __| ___ | |_  _  _ _ __    " -foregroundColor blue
Write-Host "| (__ | | ||(_-|  _|/ _ \| '  \ \ \/\/ / | || ' \ \__ \/ -_)|  _|| || || '_ \  " -foregroundColor blue
Write-Host " \___|\_,_|/__/ \__|\___/|_|_|_| \_/\_/  |_||_||_||___/\___| \__| \_,_|| .__/  " -foregroundColor blue
Write-Host "                                                                       |_|     " -foregroundColor blue

# Get the current script's directory
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
# Scripts
$MSremove = Join-Path -Path $scriptDir -ChildPath ".\ProgramSetups\mss_custom_remove.ps1"

# Remove option
function Show-Menu {
    Write-Host "Do you want to Remove ALL Microsoft Store Apps [Y/n]?"
}

function OptionA {
    Write-Host "Removing Store Apps"
    Start-Process pwsh.exe -ArgumentList "-File", $MSremove -Wait
    Write-Host -ForegroundColor Green "MS Store Apps Removed"
}

function OptionB {
    Write-Host -ForegroundColor Red "Not Removing Apps"
}

Show-Menu

$choice = Read-Host "Enter your choice [Y/n]:"

switch ($choice) {
    "Y" { OptionA }
    "n" { OptionB }
    Default { Write-Host "Invalid choice" }
}

Read-Host