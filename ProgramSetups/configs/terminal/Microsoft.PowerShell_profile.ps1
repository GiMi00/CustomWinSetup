# My Alias
New-Alias -Name img -Value "$HOME\AppData\Local\Programs\nomacs - Image Lounge\bin\nomacs.exe"
New-Alias -Name mkfile -Value "New-Item"

Function allgitpush { 
	git add --all
	git commit --all -m "Update"
	git push
}
New-Alias -Name git-all -Value allgitpush

Function starconf { notepad $HOME\.config\starship.toml }
New-Alias -Name ss-conf -Value starconf

Function ytconf { notepad $HOME\AppData\Roaming\yt-dlp\config.txt }
New-Alias -Name yt-conf -Value ytconf

# Kill process
function pkill($name) {
    Get-Process $name -ErrorAction SilentlyContinue | Stop-Process
}

# Get process name
function pgrep($name) {
    Get-Process $name
}

# Simple function to start a new elevated terminal.
function admin {
	Start-Process "C:\Program Files\WindowsApps\microsoft.windowsterminal_1.17.11461.0_x64__8wekyb3d8bbwe\wt.exe" -Verb runAs
# Start-Process "$psHome\pwsh.exe" -Verb runAs
}

# Start StarShip
Invoke-Expression (&starship init powershell)
