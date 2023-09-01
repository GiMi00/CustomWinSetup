# Custom Windows 11 Post-installation script
I created this Windows setup script, mainly for myself to use when fresh installing Windows 11.

The purpose of this setup script is to make it fast and easy to automatically tweak, configure, and install or uninstall softwares after installing Windows 11.

I'm very new when it comes to Windows scripting, so this is basically just a learning project for me.

**Inspiration:** [winutil](https://github.com/ChrisTitusTech/winutil)

**Some commands taken from:** [amesome-windows11](https://github.com/awesome-windows11/windows11)

## Guide
Run **run.bat** as Adminstator.

The Setup will start, choose options you want.

## Summary
### Software Setups
**Removing all Microsoft Store Apps, exept Paint, Terminal and Notepad.**

**Software installed by winget:** *Nomacs, Firefox, Git, yt-dlp, VSCodium, StarShip.*

**Software  installed by scoop:** *7zip, dark, ffmpeg, fzf, git, grep, innounp, mpv-git, CascadiaCode-NF-Mono.*

**Additional software:** *SimpleWall, Python, LosslessCut, Autoruns, ProcessExplorer.*

**Driver setup:** *SDIO, NVCleanstall, Guru3D-DDU.*

**My software configs:** *yt-dlp, Vscodium, MPV, PowerShell/Terminal.*
### Tweaks
- Clean taskbar
- Disable Bing/Internet search on Start menu
- Show hidden folders
- Microsoft bandwith limit fix
- Enable Dark Theme
- Enable best Wallpapper quality
- Run ShutUp10

### To-Be Fixed
- **NoBreaksSetup.ps1 not working**
- **VSCodium extension install not working**
- **Add Firefox [Betterfox](https://github.com/yokoffing/Betterfox) profile**