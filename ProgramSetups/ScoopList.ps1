# Setup scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
scoop bucket add extras

#Install pkgs
#scoop install 7zip adb chromium dark fastfetch ffmpeg fzf git grep innounp mpv-git scrcpy ani-cli #My pkgs
scoop install 7zip dark ffmpeg fzf git grep innounp mpv-git #General public