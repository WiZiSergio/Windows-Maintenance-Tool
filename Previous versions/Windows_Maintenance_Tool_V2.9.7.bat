@echo off
chcp 65001 >nul  REM Use UTF-8 encoding for better text display

REM =================== ELEVATE TO ADMIN ==========================
if /i not "%~1"=="am_admin" (
    echo(This script requires administrator privileges.
    echo(Requesting elevation now ...
    powershell start -verb runas '%0' am_admin 
    exit /b
)

REM =================== STRINGS: ENGLISH ONLY ==========================
set TITLE1=WINDOWS MAINTENANCE TOOL V2.9.7 - By Lil_Batti
set HEADER1=WINDOWS UPDATES
set OPT1=Update Windows Apps / Programs (Winget upgrade)
set HEADER2=SYSTEM HEALTH CHECKS
set OPT2=Scan for corrupt files (SFC /scannow) [Admin]
set OPT3=Windows CheckHealth (DISM) [Admin]
set OPT4=Restore Windows Health (DISM /RestoreHealth) [Admin]
set HEADER3=NETWORK TOOLS
set OPT5=DNS Options (Flush/Set/Reset)
set OPT6=Show network information (ipconfig /all)
set OPT7=Restart Network Adapters
set OPT8=Network Repair - Automatic Troubleshooter
set HEADER4=CLEANUP & OPTIMIZATION
set OPT9=Disk Cleanup (cleanmgr)
set OPT10=Run Advanced Error Scan (CHKDSK) [Admin]
set OPT11=Perform System Optimization (Delete Temporary Files)
set OPT12=Advanced Registry Cleanup-Optimization
set HEADER5=SUPPORT
set OPT13=Contact and Support information (Discord)
set HEADER6=UTILITIES & EXTRAS
set OPT20=Show installed drivers
set OPT21=Windows Update Repair Tool
set OPT22=Generate Full System Report
set OPT23=Windows Update Utility & Service Reset
set OPT24=View Network Routing Table [Advanced]
set OPT14=EXIT
set PROMPT1=Enter your choice: 
set INVALID=Invalid choice, please try again.
set EXITMSG=Exiting script...
set PAUSESTR=Press any key to continue...
set SFC_SCAN=Scanning for corrupt files (SFC /scannow)...
set SFC_DONE=Scan completed. Press any key to return to the menu.
set DISM_CHECK=Checking Windows health status (DISM /CheckHealth)...
set DISM_RESTORE=Restoring Windows health status (DISM /RestoreHealth)...
set NETINFO=Displaying Network Information...
set RESTART_ADAPTERS=Restarting network adapters...
set RESTARTED=Network adapters restarted.
set NET_REPAIR_TITLE=Automatic Network Repair
set NET_REPAIR_STEP1=Step 1: Renewing your IP address...
set NET_REPAIR_STEP2=Step 2: Refreshing DNS settings...
set NET_REPAIR_STEP3=Step 3: Resetting network components...
set NET_REPAIR_DONE=Your network settings have been refreshed. A system restart is recommended for full effect.
set RESTART_PROMPT=Would you like to restart now? (Y/N): 
set INVALID_INPUT=Invalid input. Please enter Y or N.
set DISK_CLEANUP=Running Disk Cleanup...
set CHKDSK_SCAN=Running advanced error scan on all drives...
set CHKDSK_DONE=All drives scanned.
set DELETE_TEMP_PROMPT=Do you want to delete temporary files and system cache? (Y/N)
set DELETE_TEMP_CONFIRM=Type Y or N: 
set DELETE_TEMP=Deleting temporary files and system cache...
set DELETE_TEMP_DONE=Temporary files deleted.
set OP_CANCEL=Operation cancelled.
set REG_OPT=Advanced Registry Cleanup & Optimization
set REG_ANALYZING=Analyzing Windows Registry for errors and performance issues...
set REG_NO_ENTRIES=No unnecessary registry entries found.
set REG_FOUND=Found %count% registry issues:
set REG_SAFE_FOUND=Safe to delete (%safe_count% entries detected):
set REG_DEL_SAFE=Delete only safe entries
set REG_REVIEW_SAFE=Review safe entries before deletion
set REG_BACKUP=Create Registry Backup
set REG_RESTORE=Restore Registry Backup
set REG_SCAN=Scan for corrupt registry entries
set REG_CANCEL=Cancel
set REG_DEL_SAFE_DONE=All selected registry entries have been deleted.
set REG_NO_SAFE=No safe entries found for deletion.
set REG_DEL_REVIEW=Do you want to delete them all? (Y/N)
set REG_BACKUP_DONE=Backup successfully created.
set REG_BACKUP_LIST=Available backups:
set REG_BACKUP_PROMPT=Enter the name of the backup to restore:
set REG_BACKUP_RESTORED=Backup successfully restored.
set REG_BACKUP_NOT_FOUND=Backup file not found. Please check the name and try again.
set REG_SCAN_DONE=Registry scan complete. If errors were found, restart your PC.
set CONTACT=Do you have any questions or need help? You are always welcome to contact me.
set DISCORD=Discord-Username: Lil_Batti
set SUPPORT_SERVER=Support-server: https://discord.gg/bCQqKHGxja
set PRESS_ENTER=Press ENTER to return to the main menu.
set DRIVER_SAVING=Saving Installed Driver Report to Desktop
set DRIVER_DONE=Driver report has been saved to:
set WINUP_REPAIR=Windows Update Repair Tool [Admin]
set WINUP_REPAIR_STOP=Stopping update-related services...
set WINUP_REPAIR_RENAME=Renaming update cache folders...
set WINUP_REPAIR_RESTART=Restarting services...
set WINUP_REPAIR_DONE=Windows Update components have been reset.
set WINUP_REPAIR_INFO=You may delete them manually after reboot if all is working.
set SYSREP_GEN=Generating Separated System Reports...
set SYSREP_SAVING=Reports have been saved to Desktop:
set WINUP_UTIL_TITLE=Windows Update Utility & Service Reset
set WINUP_UTIL_MSG=This tool will restart core Windows Update services. Make sure no Windows Updates are installing right now.
set WINUP_UTIL_OPT1=Reset Update Services (wuauserv, cryptsvc, appidsvc, bits)
set WINUP_UTIL_OPT2=Return to Main Menu
set WINUP_UTIL_DONE=Update-related services have been restarted.
set ROUTE_TITLE=View Network Routing Table  [Advanced]
set ROUTE_MSG=This shows how your system handles network traffic.
set ROUTE_OPT1=Display routing table in this window
set ROUTE_OPT2=Save routing table as a text file on Desktop
set ROUTE_OPT3=Return to Main Menu
set ROUTE_SAVING=Saving routing table to:
set ROUTE_DONE=Routing table saved successfully.
set ROUTE_ERR=Failed to save routing table to file.
set ROUTE_INPUT=Please enter 1, 2 or 3.
set WINGET_NOT_INSTALLED=Winget is not installed. Please install it from Microsoft Store.
set WINGET_MENU1=Windows Update (via Winget)
set WINGET_MENU2=Listing available upgrades...
set WINGET_OPTIONS=Options:
set WINGET_UPALL=Upgrade all packages
set WINGET_UPSEL=Upgrade selected packages
set WINGET_CANCEL=Cancel
set WINGET_CHOOSE=Choose an option:
set WINGET_RUNALL=Running full upgrade...
set WINGET_AVAIL=Available Packages [Copy ID to upgrade]
set WINGET_IDS=Enter one or more package IDs to upgrade
set WINGET_EX=Example: Microsoft.Edge,Spotify.Spotify  use exact IDs from the list above
set WINGET_IDS_PROMPT=IDs: 
set WINGET_NOPACK=No package IDs entered.
set WINGET_UPGR=Upgrading
set WINGET_OK=Upgrade finished.
set DNS_CLR=Clearing DNS Cache...
set DNS1=Set DNS to Google (8.8.8.8 / 8.8.4.4)
set DNS2=Set DNS to Cloudflare (1.1.1.1 / 1.0.0.1)
set DNS3=Restore original DNS settings
set DNS4=Use your own DNS
set DNS5=Return to menu
set DNS_CH=Enter your choice: 
set DNS_SAVED=Saving current DNS settings...
set DNS_GOOGLE=Applying Google DNS...
set DNS_GOOD=Google DNS applied successfully.
set DNS_CF=Applying Cloudflare DNS...
set DNS_CF_OK=Cloudflare DNS applied successfully.
set DNS_AUTO=RESTORE ORIGINAL DNS SETTINGS
set DNS_WIFI=Setting Wi-Fi DNS to automatic (DHCP)...
set DNS_WIFI_OK=Wi-Fi DNS successfully restored.
set DNS_WIFI_FAIL=Could not restore Wi-Fi DNS. Please check manually.
set DNS_ETH=Setting Ethernet DNS to automatic (DHCP)...
set DNS_ETH_OK=Ethernet DNS successfully restored.
set DNS_ETH_FAIL=Could not restore Ethernet DNS. Please check manually.
set DNS_DONE=Done restoring DNS settings.
set DNS_CUSTOM=Enter your custom DNS
set DNS_PRIM=Enter primary DNS: 
set DNS_SEC=Enter secondary DNS (optional): 
set DNS_VAL=Validating DNS addresses...
set DNS_ERR1=[!] ERROR: The primary DNS "%customDNS1%" is not reachable.
set DNS_ERR2=Please enter a valid DNS address.
set DNS_ERR3=[!] ERROR: The secondary DNS "%customDNS2%" is not reachable.
set DNS_ERR4=It will be skipped.
set DNS_SET=Setting DNS for Wi-Fi and Ethernet...
set DNS_OK=DNS has been successfully updated:
set DNS_PR=Primary: 
set DNS_SE=Secondary: 

REM =================== MAIN MENU ==========================
:menu
cls
color 07

echo ======================================================
echo         %TITLE1%
echo ======================================================
echo.

echo      === %HEADER1% ===
echo   [1] %OPT1%

echo      === %HEADER2% ===
echo   [2] %OPT2%
echo   [3] %OPT3%
echo   [4] %OPT4%

echo      === %HEADER3% ===
echo   [5] %OPT5%
echo   [6] %OPT6%
echo   [7] %OPT7%
echo   [8] %OPT8%

echo      === %HEADER4% ===
echo   [9] %OPT9%
echo  [10] %OPT10%
echo  [11] %OPT11%
echo  [12] %OPT12%

echo      === %HEADER5% ===
echo  [13] %OPT13%

echo.
echo      === %HEADER6% ===
echo  [20] %OPT20%
echo  [21] %OPT21%
echo  [22] %OPT22%
echo  [23] %OPT23%
echo  [24] %OPT24%

echo  [14] === %OPT14% ===
echo.
echo ------------------------------------------------------
set /p choice=%PROMPT1%
if "%choice%"=="22" goto choice22
if "%choice%"=="23" goto choice23
if "%choice%"=="20" goto choice20
if exist "%~f0" findstr /b /c:":choice%choice%" "%~f0" >nul || (
    echo %INVALID%
    pause
    goto menu
)
goto choice%choice%

REM All actions below use only English variables for messages 
REM (as provided above), so the entire experience is in English.

REM ------ Winget Upgrade ------
:choice1
cls
setlocal EnableDelayedExpansion
where winget >nul 2>nul || (
    echo %WINGET_NOT_INSTALLED%
    pause
    goto menu
)
echo ===============================================
echo     %WINGET_MENU1%
echo ===============================================
echo %WINGET_MENU2%
echo.
cmd /c "winget upgrade --include-unknown"
echo.
pause
echo ===============================================
echo %WINGET_OPTIONS%
echo [1] %WINGET_UPALL%
echo [2] %WINGET_UPSEL%
echo [0] %WINGET_CANCEL%
echo.
set /p upopt=%WINGET_CHOOSE%
if "%upopt%"=="1" (
    echo %WINGET_RUNALL%
    cmd /c "winget upgrade --all --include-unknown"
    pause
    goto menu
)
if "%upopt%"=="2" (
    cls
    echo ===============================================
    echo   %WINGET_AVAIL%
    echo ===============================================
    cmd /c "winget upgrade --include-unknown"
    echo.
    echo %WINGET_IDS%
    echo (%WINGET_EX%)
    echo.
    set /p packlist=%WINGET_IDS_PROMPT%
    set "packlist=!packlist: =!"
    if not defined packlist (
        echo %WINGET_NOPACK%
        pause
        goto menu
    )
    echo.
    for %%G in (!packlist!) do (
        echo %WINGET_UPGR% %%G...
        cmd /c "winget upgrade --id %%G --include-unknown"
        echo.
    )
    echo %WINGET_OK%
    pause
    goto menu
)
goto menu

:choice2
cls
echo %SFC_SCAN%
sfc /scannow
echo %SFC_DONE%
pause
goto menu

:choice3
cls
echo %DISM_CHECK%
dism /online /cleanup-image /checkhealth
pause
goto menu

:choice4
cls
echo %DISM_RESTORE%
dism /online /cleanup-image /restorehealth
pause
goto menu

:choice5
cls
echo ======================================================
echo %DNS_CLR%
ipconfig /flushdns
echo ======================================================
echo [1] %DNS1%
echo [2] %DNS2%
echo [3] %DNS3%
echo [4] %DNS4%
echo [5] %DNS5%
echo ======================================================
set /p dns_choice=%DNS_CH%
if "%dns_choice%"=="1" goto set_google_dns
if "%dns_choice%"=="2" goto set_cloudflare_dns
if "%dns_choice%"=="3" goto restore_dns
if "%dns_choice%"=="4" goto custom_dns
if "%dns_choice%"=="5" goto menu
echo %INVALID%
pause
goto choice5

:set_google_dns
echo %DNS_SAVED%
echo %DNS_GOOGLE%
netsh interface ip set dns name="Wi-Fi" static 8.8.8.8 primary
netsh interface ip add dns name="Wi-Fi" 8.8.4.4 index=2
netsh interface ip set dns name="Ethernet" static 8.8.8.8 primary
netsh interface ip add dns name="Ethernet" 8.8.4.4 index=2
echo %DNS_GOOD%
pause
goto menu

:set_cloudflare_dns
echo %DNS_SAVED%
echo %DNS_CF%
netsh interface ip set dns name="Wi-Fi" static 1.1.1.1 primary
netsh interface ip add dns name="Wi-Fi" 1.0.0.1 index=2
netsh interface ip set dns name="Ethernet" static 1.1.1.1 primary
netsh interface ip add dns name="Ethernet" 1.0.0.1 index=2
echo %DNS_CF_OK%
pause
goto menu

:restore_dns
cls
echo ======================================================
echo        %DNS_AUTO%
echo ======================================================
echo.
echo [Step 1] %DNS_WIFI%
netsh interface ip set dns name="Wi-Fi" source=dhcp >nul 2>&1
if %errorlevel% neq 0 (
    echo [FAIL] %DNS_WIFI_FAIL%
) else (
    echo [OK] %DNS_WIFI_OK%
)
echo.
echo [Step 2] %DNS_ETH%
netsh interface ip set dns name="Ethernet" source=dhcp >nul 2>&1
if %errorlevel% neq 0 (
    echo [FAIL] %DNS_ETH_FAIL%
) else (
    echo [OK] %DNS_ETH_OK%
)
echo.
echo ------------------------------------------------------
echo %DNS_DONE%
echo ------------------------------------------------------
pause
goto menu

:custom_dns
cls
echo ===============================================
echo           %DNS_CUSTOM%
echo ===============================================
:get_dns
echo.
set /p customDNS1=%DNS_PRIM%
set /p customDNS2=%DNS_SEC%
cls
echo ===============================================
echo           %DNS_VAL%
echo ===============================================
ping -n 1 %customDNS1% >nul
if errorlevel 1 (
    echo %DNS_ERR1%
    echo %DNS_ERR2%
    pause
    cls
    goto get_dns
)
if not "%customDNS2%"=="" (
    ping -n 1 %customDNS2% >nul
    if errorlevel 1 (
        echo %DNS_ERR3%
        echo %DNS_ERR4%
        set "customDNS2="
        pause
    )
)
cls
echo ===============================================
echo     %DNS_SET%
echo ===============================================
netsh interface ip set dns name="Wi-Fi" static %customDNS1%
if not "%customDNS2%"=="" netsh interface ip add dns name="Wi-Fi" %customDNS2% index=2
netsh interface ip set dns name="Ethernet" static %customDNS1%
if not "%customDNS2%"=="" netsh interface ip add dns name="Ethernet" %customDNS2% index=2
echo.
echo ===============================================
echo      %DNS_OK%
echo        %DNS_PR%%customDNS1%
if not "%customDNS2%"=="" echo        %DNS_SE%%customDNS2%
echo ===============================================
pause
goto choice5

:choice6
cls
echo %NETINFO%
ipconfig /all
pause
goto menu

:choice7
cls
echo %RESTART_ADAPTERS%
netsh interface set interface "Wi-Fi" admin=disable
netsh interface set interface "Wi-Fi" admin=enable
echo %RESTARTED%
pause
goto menu

:choice8
title %NET_REPAIR_TITLE%
cls
echo.
echo ================================
echo     %NET_REPAIR_TITLE%
echo ================================
echo.
echo %NET_REPAIR_STEP1%
ipconfig /release >nul
ipconfig /renew >nul
echo %NET_REPAIR_STEP2%
ipconfig /flushdns >nul
echo %NET_REPAIR_STEP3%
netsh winsock reset >nul
netsh int ip reset >nul
echo.
echo %NET_REPAIR_DONE%
echo.
:askRestart
set /p restart=%RESTART_PROMPT%
if /I "%restart%"=="Y" (
    shutdown /r /t 5
) else if /I "%restart%"=="N" (
    goto menu
) else (
    echo %INVALID_INPUT%
    goto askRestart
)

:choice9
cls
echo %DISK_CLEANUP%
cleanmgr
pause
goto menu

:choice10
cls
echo ===============================================
echo %CHKDSK_SCAN%
echo ===============================================
for /f "delims=" %%d in ('powershell -NoProfile -Command ^
  "Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Free -ne $null } | ForEach-Object { $_.Name + ':' }"') do (
    echo.
    echo Scanning drive %%d ...
    chkdsk %%d /f /r /x
)
echo.
echo %CHKDSK_DONE%
pause
goto menu

:choice11
cls
:confirm_loop
echo %DELETE_TEMP_PROMPT%
set /p confirm=%DELETE_TEMP_CONFIRM%
if /I "%confirm%"=="Y" goto delete_temp
if /I "%confirm%"=="YES" goto delete_temp
if /I "%confirm%"=="N" (
    echo %OP_CANCEL%
    pause
    goto menu
)
if /I "%confirm%"=="NO" (
    echo %OP_CANCEL%
    pause
    goto menu
)
echo %INVALID_INPUT%
goto confirm_loop

:delete_temp
echo %DELETE_TEMP%
del /s /f /q %temp%\*.*
del /s /f /q C:\Windows\Temp\*.*
del /s /f /q "C:\Users\%USERNAME%\AppData\Local\Temp\*.*"
echo %DELETE_TEMP_DONE%
pause
goto menu

:choice12
cls
echo ======================================================
echo %REG_OPT%
echo ======================================================
setlocal enabledelayedexpansion
set backupFolder=%SystemRoot%\Temp\RegistryBackups
if not exist "%backupFolder%" mkdir "%backupFolder%"
set logFile=%SystemRoot%\Temp\RegistryCleanupLog.txt
echo Registry Cleanup Log - %date% %time% > "%logFile%"
set count=0
set safe_count=0
echo %REG_ANALYZING%
for /f "tokens=*" %%A in ('reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall 2^>nul') do (
    set /a count+=1
    set entries[!count!]=%%A
    echo %%A | findstr /I "IE40 IE4Data DirectDrawEx DXM_Runtime SchedulingAgent" >nul && (
        set /a safe_count+=1
        set safe_entries[!safe_count!]=%%A
    )
)
if %count%==0 (
    echo %REG_NO_ENTRIES%
    pause
    goto menu
)
echo %REG_FOUND%
for /L %%i in (1,1,%count%) do echo [%%i] !entries[%%i]!
echo.
echo %REG_SAFE_FOUND%
for /L %%i in (1,1,%safe_count%) do echo [%%i] !safe_entries[%%i]!
echo.
echo [A] %REG_DEL_SAFE%
if %safe_count% GTR 0 echo [B] %REG_REVIEW_SAFE%
echo [C] %REG_BACKUP%
echo [D] %REG_RESTORE%
echo [E] %REG_SCAN%
echo [0] %REG_CANCEL%
echo.
echo Enter your choice:
set /p user_choice=
for %%A in (%user_choice%) do set user_choice=%%A
if /I "%user_choice%"=="0" goto menu
if /I "%user_choice%"=="A" goto delete_safe_entries
if /I "%user_choice%"=="B" goto review_safe_entries
if /I "%user_choice%"=="C" goto create_backup
if /I "%user_choice%"=="D" goto restore_backup
if /I "%user_choice%"=="E" goto scan_registry
if "%user_choice%"=="" goto menu
echo %INVALID%
pause
goto menu

:delete_safe_entries
if %safe_count%==0 (
    echo %REG_NO_SAFE%
    pause
    goto menu
)
for /L %%i in (1,1,%safe_count%) do (
    echo Deleting !safe_entries[%%i]!...
    reg delete "!safe_entries[%%i]!" /f
    echo Deleted: !safe_entries[%%i]! >> "%logFile%"
)
echo %REG_DEL_SAFE_DONE%
pause
goto menu

:review_safe_entries
cls
echo %REG_SAFE_FOUND%
for /L %%i in (1,1,%safe_count%) do echo [%%i] !safe_entries[%%i]!
echo.
echo %REG_DEL_REVIEW%
set /p confirm=
for %%A in (%confirm%) do set confirm=%%A
if /I "%confirm%"=="Y" goto delete_safe_entries
echo %OP_CANCEL%
pause
goto menu

:create_backup
set backupName=RegistryBackup_%date:~-4,4%-%date:~-7,2%-%date:~-10,2%_%time:~0,2%-%time:~3,2%.reg
echo Creating registry backup: %backupFolder%\%backupName%...
reg export HKLM "%backupFolder%\%backupName%" /y
echo %REG_BACKUP_DONE%
pause
goto menu

:restore_backup
echo %REG_BACKUP_LIST%
dir /b "%backupFolder%\*.reg"
echo %REG_BACKUP_PROMPT%
set /p backupFile=
if exist "%backupFolder%\%backupFile%" (
    echo Restoring backup...
    reg import "%backupFolder%\%backupFile%"
    echo %REG_BACKUP_RESTORED%
) else (
    echo %REG_BACKUP_NOT_FOUND%
)
pause
goto menu

:scan_registry
cls
echo Scanning for corrupt registry entries...
sfc /scannow
dism /online /cleanup-image /checkhealth
echo %REG_SCAN_DONE%
pause
goto menu

:choice13
cls
echo.
echo ==================================================
echo                CONTACT AND SUPPORT
echo ==================================================
echo %CONTACT%
echo.
echo %DISCORD%
echo %SUPPORT_SERVER%
echo.
echo %PRESS_ENTER%
pause >nul
goto menu

:choice14
cls
echo %EXITMSG%
exit

:choice20
cls
echo ===============================================
echo     %DRIVER_SAVING%
echo ===============================================
driverquery /v > "%USERPROFILE%\Desktop\Installed_Drivers.txt"
echo.
echo %DRIVER_DONE%
echo %USERPROFILE%\Desktop\Installed_Drivers.txt
pause
goto menu

:choice21
cls
echo ===============================================
echo      %WINUP_REPAIR%
echo ===============================================
echo.
echo [1/4] %WINUP_REPAIR_STOP%
call :stopIfExists wuauserv
call :stopIfExists bits
call :stopIfExists cryptsvc
call :stopIfExists msiserver
call :stopIfExists usosvc
call :stopIfExists trustedinstaller
timeout /t 2 >nul
echo [2/4] %WINUP_REPAIR_RENAME%
set "SUFFIX=.bak_%RANDOM%"
set "SD=%windir%\SoftwareDistribution"
set "CR=%windir%\System32\catroot2"
if exist "%SD%" (
    ren "%SD%" "SoftwareDistribution%SUFFIX%" 2>nul
    if exist "%windir%\SoftwareDistribution%SUFFIX%" (
        echo Renamed: %windir%\SoftwareDistribution%SUFFIX%
    ) else (
        echo Warning: Could not rename SoftwareDistribution.
    )
) else (
    echo Info: SoftwareDistribution not found.
)
if exist "%CR%" (
    ren "%CR%" "catroot2%SUFFIX%" 2>nul
    if exist "%windir%\System32\catroot2%SUFFIX%" (
        echo Renamed: %windir%\System32\catroot2%SUFFIX%
    ) else (
        echo Warning: Could not rename catroot2.
    )
) else (
    echo Info: catroot2 not found.
)
echo.
echo [3/4] %WINUP_REPAIR_RESTART%
call :startIfExists wuauserv
call :startIfExists bits
call :startIfExists cryptsvc
call :startIfExists msiserver
call :startIfExists usosvc
call :startIfExists trustedinstaller
echo.
echo [4/4] %WINUP_REPAIR_DONE%
echo.
echo Renamed folders:
echo   - %windir%\SoftwareDistribution%SUFFIX%
echo   - %windir%\System32\catroot2%SUFFIX%
echo %WINUP_REPAIR_INFO%
echo.
pause
goto menu

:stopIfExists
sc query "%~1" | findstr /i "STATE" >nul
if not errorlevel 1 (
    echo Stopping %~1
    net stop "%~1" >nul 2>&1
)
goto :eof

:startIfExists
sc query "%~1" | findstr /i "STATE" >nul
if not errorlevel 1 (
    echo Starting %~1
    net start "%~1" >nul 2>&1
)
goto :eof

:choice22
cls
echo ===============================================
echo     %SYSREP_GEN%
echo ===============================================
echo.
for /f "usebackq delims=" %%d in (`powershell -NoProfile -Command "$env:USERPROFILE + '\Desktop'"`) do (
    set "DESKTOP=%%d"
)
for /f "usebackq delims=" %%t in (`powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"`) do (
    set "DATESTR=%%t"
)
set "SYS=%DESKTOP%\System_Info_%DATESTR%.txt"
set "NET=%DESKTOP%\Network_Info_%DATESTR%.txt"
set "DRV=%DESKTOP%\Driver_List_%DATESTR%.txt"
echo Writing system info to %SYS% ...
systeminfo > "%SYS%" 2>nul
echo Writing network info to %NET% ...
ipconfig /all > "%NET%" 2>nul
echo Writing driver list to %DRV% ...
driverquery > "%DRV%" 2>nul
echo.
echo %SYSREP_SAVING%
echo  - %SYS%
echo  - %NET%
echo  - %DRV%
echo.
pause
goto menu

:choice23
cls
echo ======================================================
echo            %WINUP_UTIL_TITLE%
echo ======================================================
echo %WINUP_UTIL_MSG%
pause
echo.
echo [1] %WINUP_UTIL_OPT1%
echo [2] %WINUP_UTIL_OPT2%
echo.
set /p fixchoice=Select an option: 
if "%fixchoice%"=="1" goto reset_windows_update
if "%fixchoice%"=="2" goto menu
echo %INVALID%
pause
goto choice23

:reset_windows_update
cls
echo ======================================================
echo     %WINUP_UTIL_TITLE%
echo ======================================================
echo Stopping Windows Update service...
net stop wuauserv >nul
echo Stopping Cryptographic service...
net stop cryptsvc >nul
echo Starting Application Identity service...
net start appidsvc >nul
echo Starting Windows Update service...
net start wuauserv >nul
echo Starting Background Intelligent Transfer Service...
net start bits >nul
echo.
echo [OK] %WINUP_UTIL_DONE%
pause
goto menu

:choice24
setlocal EnableDelayedExpansion
cls
echo ===============================================
echo      %ROUTE_TITLE%
echo ===============================================
echo %ROUTE_MSG%
echo.
echo [1] %ROUTE_OPT1%
echo [2] %ROUTE_OPT2%
echo [3] %ROUTE_OPT3%
echo.
set /p routeopt=Choose an option: 
if "%routeopt%"=="1" (
    cls
    route print
    echo.
    pause
    goto menu
)
if "%routeopt%"=="2" (
    set "DESKTOP=%USERPROFILE%\Desktop"
    if not exist "!DESKTOP!" (
        echo Desktop folder not found.
        pause
        goto menu
    )
    for /f "usebackq delims=" %%i in (`powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HH-mm-ss"`) do (
        set "dt=%%i"
    )
    if not defined dt (
        echo Failed to generate timestamp. Using fallback...
        set "dt=manual_timestamp"
    )
    set "FILE=!DESKTOP!\routing_table_!dt!.txt"
    cls
    echo %ROUTE_SAVING% "!FILE!"
    echo.
    route print > "!FILE!"
    if exist "!FILE!" (
        echo [OK] %ROUTE_DONE%
    ) else (
        echo [ERROR] %ROUTE_ERR%
    )
    echo.
    pause
    goto menu
)
if "%routeopt%"=="3" (
    goto menu
)
echo %ROUTE_INPUT%
pause
goto choice24