Write-Host "  ___           _              __      __ _        ___       _                 " -foregroundColor blue
Write-Host " / __|_  _  ___| |_  ___  _ __ \ \    / /(_) _ _  / __| ___ | |_  _  _ _ __    " -foregroundColor blue
Write-Host "| (__ | | ||(_-|  _|/ _ \| '  \ \ \/\/ / | || ' \ \__ \/ -_)|  _|| || || '_ \  " -foregroundColor blue
Write-Host " \___|\_,_|/__/ \__|\___/|_|_|_| \_/\_/  |_||_||_||___/\___| \__| \_,_|| .__/  " -foregroundColor blue
Write-Host "                                                                       |_|     " -foregroundColor blue

function Show-Menu {
    Clear-Host
    Write-Host "Welcome to the CLI Menu"
    Write-Host "1. Option 1"
    Write-Host "2. Option 2"
    Write-Host "3. Exit"
}
function Get-Choice {
    $choice = Read-Host "Choose an option (1, 2, or 3)"
    return $choice
}

# Creat popup msg when one process is completed