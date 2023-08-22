# Custom Windows 11 Post-installation script
I created this Windows setup script, mainly for myself to use when fresh installing Windows 11.

The purpose of this setup script is to make it fast and easy to automatically tweak, configure, and install or uninstall programs after installing Windows 11.

I'm very new when it comes to Windows scripting, so this is basically just a learning project for me.

**Inspiration:** [winutil](https://github.com/ChrisTitusTech/winutil)

**Some scripts/commands taken from:** [amesome-windows11](https://github.com/awesome-windows11/windows11)

## Guide
Run **run.bat** as Adminstator.

The Setup will start, choose options you want.

## Summary
### Program Setups
**Removing all Microsoft Store Apps, exept Paint, Terminal and Notepad.**

**Programs installed by winget:** *Nomacs, Firefox, Git, yt-dlp, VSCodium.*

**Programs installed by scoop:** *7zip, dark, ffmpeg, fzf, git, grep, innounp, mpv-git, CascadiaCode-NF-Mono.*

**Additional programs:** *SimpleWall, Python, LosslessCut, Autoruns, ProcessExplorer.*

**Driver setup:** *SDIO, NVCleanstall, Guru3D-DDU.*

**My program configs:** *yt-dlp, Vscodium, MPV, PowerShell.*
### Tweaks
- Clean taskbar
- Disable Bing/Internet search on Start menu
- Show hidden folders
- Microsoft bandwith limit fix
- Enable Dark Theme
- Enable best Wallpapper quality
- Run ShutUp10

**NoBreaksSetup.ps1 not working.**