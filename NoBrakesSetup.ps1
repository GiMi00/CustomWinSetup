# Get the current script's directory
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Construct paths to scripts
$MSSRemove = Join-Path -Path $scriptDir -ChildPath ".\ProgramSetups\mss_custom_remove.ps1"
$SU10 = Join-Path -Path $scriptDir -ChildPath ".\TweakScripts\ShutUp10.ps1"
$CleanBar = Join-Path -Path $scriptDir -ChildPath ".\TweakScripts\clean_taskbar.bat"
$DSearch = Join-Path -Path $scriptDir -ChildPath ".\TweakScripts\disable_search.bat"
$FSettings = Join-Path -Path $scriptDir -ChildPath ".\TweakScripts\folder_settings.bat"
$OldMenu = Join-Path -Path $scriptDir -ChildPath ".\TweakScripts\OldMenuBack.bat"
$NetFix = Join-Path -Path $scriptDir -ChildPath ".\TweakScripts\Bandwith_fix.bat"
$DTheme = Join-Path -Path $scriptDir -ChildPath ".\TweakScripts\DarkTheme.bat"
$BestJPEG = Join-Path -Path $scriptDir -ChildPath ".\TweakScripts\jpeg_best_quality.bat"

# Run the scripts
Start-Process pwsh.exe -ArgumentList "-File $MSSRemove"
Write-Host -ForegroundColor Green "Microsoft Store Apps removed"
Start-Process pwsh.exe -ArgumentList "-File $SU10"
Write-Host -ForegroundColor Green "Windows set for privacy"
Start-Process cmd.exe -ArgumentList "/c $CleanBar"
Write-Host -ForegroundColor Green "Taskbar cleaned"
Start-Process cmd.exe -ArgumentList "/c $DSearch"
Write-Host -ForegroundColor Green "Bing Search disabled"
Start-Process cmd.exe -ArgumentList "/c $FSettings"
Write-Host -ForegroundColor Green "Hidden Folders enabled"
Start-Process cmd.exe -ArgumentList "/c $OldMenu"
Write-Host -ForegroundColor Green "Old contextmenu back"
Start-Process cmd.exe -ArgumentList "/c $NetFix"
Write-Host -ForegroundColor Green "Bandwidth limit removed"
Start-Process cmd.exe -ArgumentList "/c $DTheme"
Write-Host -ForegroundColor Green "Dark Theme enabled"
Start-Process cmd.exe -ArgumentList "/c $BestJPEG"
Write-Host -ForegroundColor Green "Best quality wallpapper option set"