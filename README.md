# Custom Windows 11 Post-installation script
Just testing.
Inspiration: [winutil](https://github.com/ChrisTitusTech/winutil)

**not working currently**
### Testing

**Remove and Disable Windows PC Health Check**
>reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHC" /v PreviousUninstall /t REG_DWORD /d 1 /f
>reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealthCheck" /v installed /t REG_DWORD /d 1 /f

irm https://raw.githubusercontent.com/ChrisTitusTech/winutil/main/edgeremoval.bat | iex

crish titus tool irm https://christitus.com/win | iex

terminal admin
- install 
- install latest powershell
- remove widgets
>Get-AppxPackage -AllUsers | Where-Object {$_.Name -like "*WebExperience*"} | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue



**terminal install**
winget
winget install OO-Software.ShutUp10   

Microsoft.VCRedist.2010.x86 Microsoft.VCRedist.2010.x64 Microsoft.VCRedist.2013.x86 Microsoft.VCRedist.2013.x64 Microsoft.VCRedist.2015+.x86

Klocman.BulkCrapUninstaller
Microsoft.PowerToys
TheDocumentFoundation.LibreOffice
nomacs.nomacs
Microsoft.PowerShell (new powershell 7 ?)
VSCodium.VSCodium
Henry++.simplewall
Obsidian.Obsidian (not nececery)
Valve.Steam (not nececery)
OBSProject.OBSStudio
Mozilla.Firefox
Microsoft.WindowsTerminal
Git.Git
GIMP.GIMP
Audacity.Audacity

**scoop**
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
scoop bucket add extras
scoop install 7zip adb chromium dark fastfetch ffmpeg fzf git grep innounp mpv-git scrcpy ani-cli

create 2 install scirpt (winget, scoop) one more minimal for general public one for me

softwares not on winget or scoop
ps1 script

https://www.python.org/downloads/windows/

driver gpu 
https://www.guru3d.com/files-details/display-driver-uninstaller-download.html
https://www.techpowerup.com/download/techpowerup-nvcleanstall/
https://www.snappy-driver-installer.org/

##### Clean taskbar
>%UserProfile%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar

>echo "Disable Meet Now"
>reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow /t REG_DWORD /d 1 /f
>reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow /t REG_DWORD /d 1 /f

>echo "Disable People"
>reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v HidePeopleBar /t REG_DWORD /d 1 /f
>reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v HidePeopleBar /t REG_DWORD /d 1 /f
>echo "Hide People"

>reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand /t REG_DWORD /d 0 /f

>echo "Disable Weather, News and Interests on taskbar"
>reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d 0 /f
>echo "Hide Weather, News and Interests on taskbar"

>reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" /v ShellFeedsTaskbarViewMode /t REG_DWORD /d 2 /f
>pause

##### Old context menu
>reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
>
>taskkill /F /IM explorer.exe
>start explorer.exe


##### Microsoft store
**Remove ALL Microsoft Store Apps (NOT Microsoft Store)**
>Get-AppxPackage -AllUsers | where-object {$_.name –notlike "*store*"} | Remove-AppxPackage

**Remove ALL Microsoft Store Apps**
>Get-AppxPackage | Remove-AppxPackage

**Restore MS Store**
>Get-AppXPackage *WindowsStore* -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register “$($_.InstallLocation)\AppXManifest.xml”}

OR

>wsreset.exe -i

**RESTORE:**
**Restore AppInstaller (winget)**
>Get-AppXPackage *AppInstaller* -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register “$($_.InstallLocation)\AppXManifest.xml”}

**Restore WindowsTerminal**
>Get-AppXPackage *WindowsTerminal* -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register “$($_.InstallLocation)\AppXManifest.xml”}

**Restore Notepad**
>Get-AppXPackage *Notepad* -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register “$($_.InstallLocation)\AppXManifest.xml”}