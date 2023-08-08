# Set the registry key path
$RegistryPath = "HKCU:\Control Panel\Desktop"

# Create and set the registry DWORD value
$Name = "JPEGImportQuality"
$Value = 100
Set-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -Type DWORD

# Restart Windows Explorer
Stop-Process -Name "explorer" -Force
Start-Process "explorer"

Write-Host "Registry value $Name set to $Value and Windows Explorer has been restarted."