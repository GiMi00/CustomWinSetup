# Set Windows 11 performance settings to "Best Performance" while preserving specific settings

# Set Visual Effects to "Adjust for best performance"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2

# Disable window animations
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Value ([byte[]](0x90,0x12,0x01,0x80))

# Set appearance settings to improve performance
$CurrentTheme = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme"
$UpdatedTheme = [System.Int32]::MaxValue - $CurrentTheme.AppsUseLightTheme
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value $UpdatedTheme

# Keep "Show thumbnails instead of icons" setting
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "IconsOnly" -Value 0

# Keep "Smooth edges of screen fonts" setting
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "FontSmoothing" -Value 2

# Keep "Smooth-scroll list boxes" setting
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Value ([byte[]](0x90,0x12,0x01,0x80))

# Adjust the desktop composition settings for improved performance
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "Composition" -Value 0

# Restart Explorer to apply changes
Stop-Process -Name "explorer" -Force
Start-Process "explorer"

Write-Host "Windows 11 performance settings have been set to 'Best Performance' while preserving specific settings."
