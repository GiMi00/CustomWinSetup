reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve

echo Old Windows context menu set

echo Restarting Explorer
taskkill /F /IM explorer.exe
start explorer.exe