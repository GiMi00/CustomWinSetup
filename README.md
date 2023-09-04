# Custom Windows 11 Post-installation script
I created this Windows setup script, mainly for myself to use when fresh installing Windows 11.

The purpose of this setup script is to make it fast and easy to automatically tweak, configure, and install or uninstall softwares after installing Windows 11.

I'm very new when it comes to Windows scripting, so this is basically just a learning project for me.

**Inspiration:** [winutil](https://github.com/ChrisTitusTech/winutil)

**Some commands taken from:** [amesome-windows11](https://github.com/awesome-windows11/windows11)

## Guide
Run **run.bat** as Adminstator.

The Setup will start, choose options you want.

**Fix Powershell:** Run *"Set-ExecutionPolicy -ExecutionPolicy ByPass -Scope CurrentUser"* as Adminstator in terminal.

**Recomended:** Set safer execution policy after script for security, more information [here](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.3)

## Summary
### Software Setups
**Removing all Microsoft Store Apps, exept: Paint, Terminal and Notepad.**

**Software installed by winget:** *.NET Frameworks, Nomacs, Firefox, Git, yt-dlp, VSCodium, StarShip.*

**Software installed by scoop:** *7zip, dark, ffmpeg, git, grep, innounp, mpv-git, CascadiaCode-NF-Mono.*

**Additional software:** *SimpleWall, Python, LosslessCut, Autoruns, ProcessExplorer*

**Driver setup:** *SDIO, NVCleanstall, Guru3D-DDU.*

**My software configs:** *yt-dlp, Vscodium (+ [extensions](#extentions)), MPV, Terminal, Powershell ($PROFILE + [StarShip](https://starship.rs/)), Firefox ([Betterfox](https://github.com/yokoffing/Betterfox)).*

<a id= "extentions"></a> **VScodium extensions:** *code-runner, catppuccin-vsc, vscode-icons, powershell, python, python-extension-pack*
### Tweaks
- Clean taskbar
- Disable Bing/Internet search on Start menu
- Show hidden folders
- Microsoft bandwith limit fix
- Enable Dark Theme
- Enable best Wallpapper quality
- Run [ShutUp10++](https://www.oo-software.com/en/shutup10)

### Needs fixing
- **NoBreaksSetup.ps1 not working**
- **$PROFILE not signed**