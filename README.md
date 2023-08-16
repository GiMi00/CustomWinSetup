Replace https://github.com/awesome-windows11/windows11 copied sirpts with chatgpt code

Probably don't include chris titus tool on public version just private alongside my apps






# Custom Windows 11 Post-installation script
Just testing.
Inspiration: [winutil](https://github.com/ChrisTitusTech/winutil)

Some scripts/commands taken from: [amesome-windows11](https://github.com/awesome-windows11/windows11)

**not working currently**
create 2 install scirpts (winget, scoop) one more minimal for general public one for me.

### CLI program
setup custom [terminal](https://learn.microsoft.com/en-us/windows/terminal/tutorials/custom-prompt-setup)

### Order to do things
0. Update Windows
1. Open Terminal/Powershell as admin and type: "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned"
2. Run cli interface script (or "NoBreaks" script) on terminal **cli_interface.ps1**
3. Remove ALL Microsoft Store Apps **mss_custom_remove.ps1**
4. Setup ShutUp10 **ShutUp10.ps1**
5. **clean_taskbar.bat**
6. **disable_search.bat**
7. **folder_settings.bat**
8. **OldMenuBack.bat**
9. **Bandwith_fix.bat**
10. **DarkTheme.bat**
11. **jpeg_best_quality.bat**
12. Winget
13. Scoop
15. download_programs.ps1
16. configSetups
17. Driver Setups (choose option on both scripts)
18. irm https://christitus.com/win | iex
19. make system reboot (y, n)

Make no breaks script (no option just does it)

### Working scripts:
- disable_search.bat ("disableStartSearch.reg" included)
- folder_settings.bat
- download_and_run.ps1 (updating)
- OldMenuBack.bat
- Bandwith_fix.ps1
- mms_custom_remove.ps1
- clean_taskbar.bat
- DarkTheme.bat
- jpeg_best_quality.bat
- ConfigSetups.ps1
- ShutUp10.ps1 (ooshutup10.cfg)
- ScoopList.ps1
- WingetList.ps1

### Not working:
- download_and_run.ps1 (updating)
- cli_interface (1,2) (introduce-poweshell)
- DriverSetup.ps1
