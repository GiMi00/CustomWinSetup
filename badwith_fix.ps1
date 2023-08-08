# Set the registry key paths
$BasePath = "HKLM:\SOFTWARE\Policies\Microsoft"
$SubKey = "Psched"

# Create the Psched key
New-Item -Path $BasePath -Name $SubKey -Force

# Set the path to the Psched key
$PschedPath = Join-Path -Path $BasePath -ChildPath $SubKey

# Create and set the registry DWORD value
$ValueName = "NonBestEffortLimit"
$Value = 0
Set-ItemProperty -Path $PschedPath -Name $ValueName -Value $Value -Type DWORD

Write-Host "Registry key $PschedPath created and value $ValueName set to $Value."