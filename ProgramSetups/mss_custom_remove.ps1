# Remove Windows Apps (Can be bad idea)
Get-AppxPackage | Where-Object {
    $_.Name -notin (
        "Microsoft.WindowsCalculator",
        "Microsoft.WindowsStore",
        "Microsoft.WindowsCamera",
        "Microsoft.Paint",
        "Microsoft.WindowsNotepad",
        "Microsoft.WindowsTerminal"
    )
} | Remove-AppxPackage

#Unistall widgets
Get-AppxPackage -AllUsers | Where-Object {$_.Name -like "*WebExperience*"} | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue

Clear-Host

#Unistall OneDrive
winget uninstall Microsoft.OneDrive

Write-Host -ForegroundColor Green "Windows Apps Removed."