# Custom Windows 11 Post-installation script
Just testing.
Inspiration: [winutil](https://github.com/ChrisTitusTech/winutil)

Some scripts/commands taken from: [amesome-windows11](https://github.com/awesome-windows11/windows11)

**not working currently**
### Testing

irm https://raw.githubusercontent.com/ChrisTitusTech/winutil/main/edgeremoval.bat | iex

crish titus tool irm https://christitus.com/win | iex

### **terminal install**
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

### **scoop**
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
scoop bucket add extras
scoop install 7zip adb chromium dark fastfetch ffmpeg fzf git grep innounp mpv-git scrcpy ani-cli

create 2 install scirpts (winget, scoop) one more minimal for general public one for me

### **softwares not on winget or scoop**
ps1 script

https://www.python.org/downloads/windows/

driver gpu 
https://www.guru3d.com/files-details/display-driver-uninstaller-download.html
https://www.techpowerup.com/download/techpowerup-nvcleanstall/
https://www.snappy-driver-installer.org/

### Order to do things

.update windows
0. Open terminal as admin. Set-ExecutionPolicy -ExecutionPolicy RemoteSigned (can be included in .bat file)
1. Run cli interface script tat does this (maiby can do python gui)
2. Download install new powershell
2.1 downlaod casckayacove font scoop
2.2. downlaod git
2.3. Set config file C:\Users\%USERPROFILE%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState 
3.1. **Remove ALL Microsoft Store Apps**
4. winget unistall Microsoft.OneDrive
Get-AppXPackage *Notepad* -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register “$($_.InstallLocation)\AppXManifest.xml”}

6. >winget install OO-Software.ShutUp10
6.1. restart and >OOSU10
6.2. import settings or recomended >OOSU10 ooshutup10.cfg
6.3. C:\Users\%USERPROFILE%\AppData\Local\Microsoft\WinGet\Packages\OO-Software.ShutUp10_Microsoft.Winget.Source_8wekyb3d8bbwe\OOSU10.exe ooshutup10.cfg


make system reboot (y, n)
Make no breaks script (no option just does it)

### Working scripts:
- disable_search.bat ("disableStartSearch.reg" included)
- folder_settings.bat
- download_and_run.ps1
- OldMenuBack.bat
- Bandwith_fix.ps1
- mms_custom_remove.ps1
- clean_taskbar.bat
- DarkTheme.bat
- jpeg_best_quality.bat


### ChrisTius tool icludes
- Disable telementry (diffrent from ShutUp10)
- Bunch of things not included in my script
- edge remover
- remove all msstore apps (dosen't do ass much as mine.)
- probably run after my script (choose minimal and more)
