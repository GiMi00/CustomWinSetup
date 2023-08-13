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
yt-dlp

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

### CLI program

setup custom [terminal](https://learn.microsoft.com/en-us/windows/terminal/tutorials/custom-prompt-setup)

### Order to do things

2. Download install new powershell
2.1 downlaod font: >scoop install CascadiaCode-NF-Mono
2.2. downlaod git

$TerminalPath = "C:\Users\Lenovo\Documents\texts\PowershellProjects\CustomWinSetup\cli_interfacev2.ps1"
Start-Process -FilePath $TerminalPath) (or maiby not and just use 6.3)


0. Update Windows
1. Open Terminal/Powershell as admin and type: "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned"
2. Run cli interface script (or "NoBreaks" script) on terminal **cli_interface.ps1**
3. Remove ALL Microsoft Store Apps **mss_custom_remove.ps1**
4. **clean_taskbar.bat**
5. Setup ShutUp10 **ShutUp10.ps1**
6. **disable_search.bat**
7. **folder_settings.bat**
8. **OldMenuBack.bat**
9. **Bandwith_fix.ps1**
10. **DarkTheme.bat**
11. **jpeg_best_quality.bat**
12. 


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
- ConfigSetups.ps1


### ChrisTius tool icludes
irm https://christitus.com/win | iex
- Disable telementry (diffrent from ShutUp10) (don't run)
- Bunch of things not included in my script
- edge remover
- remove all msstore apps (dosen't do ass much as mine.) (test this, on processes)
- probably run after my script ( and more)
