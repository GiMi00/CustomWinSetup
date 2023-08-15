

# Get the current script's directory
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Construct paths to other scripts
$MSSRemove = Join-Path -Path $scriptDir -ChildPath ".\ProgramSetups\mss_custom_remove.ps1"

# Run the other scripts
Start-Process pwsh.exe -ArgumentList "-File $MSSRemove"