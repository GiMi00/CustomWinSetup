# Setup scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
scoop install git
scoop bucket add extras
scoop bucket add nerd-fonts

# Install pkgs
# scoop install 7zip adb chromium dark fastfetch ffmpeg fzf git grep innounp mpv-git scrcpy ani-cli #My pkgs
scoop install 7zip dark ffmpeg fzf git grep innounp mpv-git # General public
scoop install CascadiaCode-NF-Mono
scoop uninstall git

write-Host -ForegroundColor Green "Scoop apps installed!"