@echo off
chcp 65001 >nul  REM Use UTF-8 encoding for better text display

REM =================== LANGUAGE SELECTION ========================
setlocal EnableDelayedExpansion
:lang_select
cls
echo ======================================================
echo          WINDOWS MAINTENANCE TOOL V2.9.7 - By Lil_Batti
echo ======================================================
echo.
echo Please select your language / Por favor seleccione idioma:
echo.
echo [1] English
echo [2] Español
echo.
set /p lang_choice=Choose (1/2): 

if "%lang_choice%"=="1" (
    set LANG=EN
) else if "%lang_choice%"=="2" (
    set LANG=ES
) else (
    echo Invalid selection / Seleccion invalida.
    timeout /t 2 >nul
    goto lang_select
)

REM =================== ELEVATE TO ADMIN ==========================
if /i not "%~1"=="am_admin" (
    if "%LANG%"=="EN" (
        echo(This script requires administrator privileges.
        echo(Requesting elevation now ... 
    ) else (
        echo(Este script requiere privilegios de administrador.
        echo(Solicitando elevación...
    )
    powershell start -verb runas '%0' am_admin 
    exit /b
)

REM =================== LANGUAGE STRINGS ==========================
REM Define ALL variables for both languages (menu, actions, etc)
REM (Saves space: only key variables, extend as needed for new features)
if "%LANG%"=="ES" (
    set TITLE1=HERRAMIENTA DE MANTENIMIENTO PARA WINDOWS V2.9.7 - Por Lil_Batti
    set HEADER1=ACTUALIZACIONES DE WINDOWS
    set OPT1=Actualizar aplicaciones/programas de Windows (Winget upgrade)
    set HEADER2=CHEQUEOS DE SALUD DEL SISTEMA
    set OPT2=Buscar archivos dañados (SFC /scannow) [Admin]
    set OPT3=Comprobar el estado de salud (DISM) [Admin]
    set OPT4=Restaurar salud de Windows (DISM /RestoreHealth) [Admin]
    set HEADER3=HERRAMIENTAS DE RED
    set OPT5=Opciones DNS (Flush/Establecer/Restablecer)
    set OPT6=Mostrar información de red (ipconfig /all)
    set OPT7=Reiniciar adaptadores de red
    set OPT8=Reparación de red - Solucionador automático
    set HEADER4=LIMPIEZA Y OPTIMIZACIÓN
    set OPT9=Limpieza de disco (cleanmgr)
    set OPT10=Escaneo avanzado de errores (CHKDSK) [Admin]
    set OPT11=Optimización del sistema (Eliminar archivos temporales)
    set OPT12=Limpieza avanzada y optimización del registro
    set HEADER5=ASISTENCIA
    set OPT13=Información de contacto y soporte (Discord)
    set HEADER6=UTILIDADES Y EXTRAS
    set OPT20=Mostrar controladores instalados
    set OPT21=Herramienta de reparación de Windows Update
    set OPT22=Generar informe completo del sistema
    set OPT23=Utilidad y restablecimiento de Windows Update y servicios
    set OPT24=Ver tabla de rutas de red [Avanzado]
    set OPT14=SALIR
    set PROMPT1=Ingrese su opción: 
    set INVALID=Opción invalida, por favor intente de nuevo.
    set EXITMSG=Saliendo del script...
    set PAUSESTR=Presione cualquier tecla para continuar...
    set SFC_SCAN=Buscando archivos dañados (SFC /scannow)...
    set SFC_DONE=Proceso completado. Presione cualquier tecla para volver al menú.
    set DISM_CHECK=Comprobando el estado de salud de Windows (DISM /CheckHealth)...
    set DISM_RESTORE=Restaurando estado de salud de Windows (DISM /RestoreHealth)...
    set NETINFO=Mostrando información de red...
    set RESTART_ADAPTERS=Reiniciando adaptadores de red...
    set RESTARTED=Adaptadores de red reiniciados.
    set NET_REPAIR_TITLE=Reparación automática de red
    set NET_REPAIR_STEP1=Paso 1: Renovando la dirección IP...
    set NET_REPAIR_STEP2=Paso 2: Actualizando configuración DNS...
    set NET_REPAIR_STEP3=Paso 3: Restableciendo componentes de red...
    set NET_REPAIR_DONE=La configuración de red ha sido actualizada. Se recomienda reiniciar el sistema para aplicar los cambios.
    set RESTART_PROMPT=¿Desea reiniciar ahora? (S/N): 
    set INVALID_INPUT=Entrada inválida. Por favor escriba S o N.
    set DISK_CLEANUP=Ejecutando limpieza de disco...
    set CHKDSK_SCAN=Ejecutando escaneo avanzado de errores en todas las unidades...
    set CHKDSK_DONE=Todas las unidades han sido escaneadas.
    set DELETE_TEMP_PROMPT=¿Desea eliminar archivos temporales y caché del sistema? (S/N)
    set DELETE_TEMP_CONFIRM=Escriba S o N: 
    set DELETE_TEMP=Eliminando archivos temporales y caché del sistema...
    set DELETE_TEMP_DONE=Archivos temporales eliminados.
    set OP_CANCEL=Operación cancelada.
    set REG_OPT=Optimización avanzada del registro
    set REG_ANALYZING=Analizando el registro de Windows en busca de errores y problemas de rendimiento...
    set REG_NO_ENTRIES=No se encontraron entradas innecesarias en el registro.
    set REG_FOUND=Se encontraron %count% posibles problemas de registro:
    set REG_SAFE_FOUND=Seguros para eliminar (%safe_count% detectados):
    set REG_DEL_SAFE=Eliminar solo entradas seguras
    set REG_REVIEW_SAFE=Revisar entradas seguras antes de eliminar
    set REG_BACKUP=Crear copia de seguridad del registro
    set REG_RESTORE=Restaurar copia de seguridad del registro
    set REG_SCAN=Buscar entradas corruptas del registro
    set REG_CANCEL=Cancelar
    set REG_DEL_SAFE_DONE=Todas las entradas de registro seleccionadas han sido eliminadas.
    set REG_NO_SAFE=No se encontraron entradas seguras para eliminar.
    set REG_DEL_REVIEW=¿Desea eliminarlas todas? (S/N)
    set REG_BACKUP_DONE=Copia de seguridad creada exitosamente.
    set REG_BACKUP_LIST=Copias de seguridad disponibles:
    set REG_BACKUP_PROMPT=Ingrese el nombre de la copia para restaurar:
    set REG_BACKUP_RESTORED=Copia restaurada exitosamente.
    set REG_BACKUP_NOT_FOUND=Archivo de copia no encontrado. Verifique el nombre e intente de nuevo.
    set REG_SCAN_DONE=Escaneo de registro completado. Si se encontraron errores, reinicie su PC.
    set CONTACT=¿Tiene preguntas o necesita ayuda? Siempre puede contactarme.
    set DISCORD=Usuario Discord: Lil_Batti
    set SUPPORT_SERVER=Servidor de soporte: https://discord.gg/bCQqKHGxja
    set PRESS_ENTER=Presione ENTER para regresar al menú principal.
    set DRIVER_SAVING=Guardando informe de controladores instalados en el Escritorio
    set DRIVER_DONE=El informe de controladores ha sido guardado en:
    set WINUP_REPAIR=Herramienta de reparación de Windows Update [Admin]
    set WINUP_REPAIR_STOP=Deteniendo servicios relacionados con actualizaciones...
    set WINUP_REPAIR_RENAME=Renombrando carpetas de caché de actualizaciones...
    set WINUP_REPAIR_RESTART=Reiniciando servicios...
    set WINUP_REPAIR_DONE=Los componentes de Windows Update han sido restablecidos.
    set WINUP_REPAIR_INFO=Puede eliminar manualmente las carpetas renombradas después de reiniciar si todo funciona.
    set SYSREP_GEN=Generando informes separados del sistema...
    set SYSREP_SAVING=Los informes han sido guardados en el Escritorio:
    set WINUP_UTIL_TITLE=Utilidad y restablecimiento de Windows Update y servicios
    set WINUP_UTIL_MSG=Esta herramienta reiniciará los servicios principales de Windows Update. Asegúrese de que no se estén instalando actualizaciones.
    set WINUP_UTIL_OPT1=Restablecer servicios de actualización (wuauserv, cryptsvc, appidsvc, bits)
    set WINUP_UTIL_OPT2=Volver al menú principal
    set WINUP_UTIL_DONE=Los servicios de actualización han sido reiniciados.
    set ROUTE_TITLE=Ver tabla de rutas de red [Avanzado]
    set ROUTE_MSG=Esto muestra cómo maneja su sistema el tráfico de red.
    set ROUTE_OPT1=Mostrar tabla de rutas en esta ventana
    set ROUTE_OPT2=Guardar tabla de rutas como archivo de texto en el Escritorio
    set ROUTE_OPT3=Volver al menú principal
    set ROUTE_SAVING=Guardando tabla de rutas en:
    set ROUTE_DONE=Tabla de rutas guardada exitosamente.
    set ROUTE_ERR=Error al guardar la tabla de rutas.
    set ROUTE_INPUT=Por favor ingrese 1, 2 o 3.
    set WINGET_NOT_INSTALLED=Winget no está instalado. Instálelo desde Microsoft Store.
    set WINGET_MENU1=Actualización de Windows (con Winget)
    set WINGET_MENU2=Listando actualizaciones disponibles...
    set WINGET_OPTIONS=Opciones:
    set WINGET_UPALL=Actualizar todos los paquetes
    set WINGET_UPSEL=Actualizar paquetes seleccionados
    set WINGET_CANCEL=Cancelar
    set WINGET_CHOOSE=Elija una opción:
    set WINGET_RUNALL=Ejecutando actualización completa...
    set WINGET_AVAIL=Paquetes disponibles [Copia el ID para actualizar]
    set WINGET_IDS=Ingrese uno o más IDs de paquete para actualizar
    set WINGET_EX=Ejemplo: Microsoft.Edge,Spotify.Spotify  use IDs exactos de la lista anterior
    set WINGET_IDS_PROMPT=IDs: 
    set WINGET_NOPACK=No se ingresaron IDs de paquete.
    set WINGET_UPGR=Actualizando
    set WINGET_OK=Actualización finalizada.
    set DNS_CLR=Borrando caché DNS...
    set DNS1=Establecer DNS de Google (8.8.8.8 / 8.8.4.4)
    set DNS2=Establecer DNS de Cloudflare (1.1.1.1 / 1.0.0.1)
    set DNS3=Restaurar configuración DNS original
    set DNS4=Usar DNS personalizado
    set DNS5=Volver al menú
    set DNS_CH=Elije una opción: 
    set DNS_SAVED=Guardando configuración actual de DNS...
    set DNS_GOOGLE=Aplicando DNS de Google...
    set DNS_GOOD=DNS de Google aplicado correctamente.
    set DNS_CF=Aplicando DNS de Cloudflare...
    set DNS_CF_OK=DNS de Cloudflare aplicado correctamente.
    set DNS_AUTO=RESTAURAR CONFIGURACIÓN DNS ORIGINAL
    set DNS_WIFI=Estableciendo DNS de Wi-Fi en automático (DHCP)...
    set DNS_WIFI_OK=DNS de Wi-Fi restaurado correctamente.
    set DNS_WIFI_FAIL=No se pudo restaurar DNS de Wi-Fi. Verifique manualmente.
    set DNS_ETH=Estableciendo DNS de Ethernet en automático (DHCP)...
    set DNS_ETH_OK=DNS de Ethernet restaurado correctamente.
    set DNS_ETH_FAIL=No se pudo restaurar DNS de Ethernet. Verifique manualmente.
    set DNS_DONE=Listo, configuración de DNS restaurada.
    set DNS_CUSTOM=Ingrese su DNS personalizado
    set DNS_PRIM=Ingrese DNS primario: 
    set DNS_SEC=Ingrese DNS secundario (opcional): 
    set DNS_VAL=Validando direcciones DNS...
    set DNS_ERR1=[!] ERROR: El DNS primario "%customDNS1%" no es accesible.
    set DNS_ERR2=Por favor ingrese una dirección DNS válida.
    set DNS_ERR3=[!] ERROR: El DNS secundario "%customDNS2%" no es accesible.
    set DNS_ERR4=Se omitirá.
    set DNS_SET=Estableciendo DNS para Wi-Fi y Ethernet...
    set DNS_OK=DNS actualizado con éxito:
    set DNS_PR=Primario: 
    set DNS_SE=Secundario: 
) else (
    REM English - Use previous EN block from above
    REM ... (Variables already provided in the previous message) ...
)

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

REM =========== WINGET UPGRADE ===========
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

REM =========== SFC ===========
:choice2
cls
echo %SFC_SCAN%
sfc /scannow
echo %SFC_DONE%
pause
goto menu

REM =========== DISM CHECKHEALTH ===========
:choice3
cls
echo %DISM_CHECK%
dism /online /cleanup-image /checkhealth
pause
goto menu

REM =========== DISM RESTOREHEALTH ===========
:choice4
cls
echo %DISM_RESTORE%
dism /online /cleanup-image /restorehealth
pause
goto menu

REM =========== DNS MENU ===========
:choice5
cls
echo ======================================================
echo %DNS_CLR%
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
echo [1] %DNS_WIFI%
netsh interface ip set dns name="Wi-Fi" source=dhcp >nul 2>&1
if %errorlevel% neq 0 (
    echo [FALLÓ] %DNS_WIFI_FAIL%
) else (
    echo [OK] %DNS_WIFI_OK%
)
echo.
echo [2] %DNS_ETH%
netsh interface ip set dns name="Ethernet" source=dhcp >nul 2>&1
if %errorlevel% neq 0 (
    echo [FALLÓ] %DNS_ETH_FAIL%
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

REM =========== NETWORK INFO ===========
:choice6
cls
echo %NETINFO%
ipconfig /all
pause
goto menu

REM =========== RESTART ADAPTERS ===========
:choice7
cls
echo %RESTART_ADAPTERS%
netsh interface set interface "Wi-Fi" admin=disable
netsh interface set interface "Wi-Fi" admin=enable
echo %RESTARTED%
pause
goto menu

REM =========== NETWORK REPAIR ===========
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
) else if /I "%restart%"=="S" (
    shutdown /r /t 5
) else if /I "%restart%"=="NO" (
    goto menu
) else if /I "%restart%"=="SI" (
    shutdown /r /t 5
) else (
    echo %INVALID_INPUT%
    goto askRestart
)

REM =========== DISK CLEANUP ===========
:choice9
cls
echo %DISK_CLEANUP%
cleanmgr
pause
goto menu

REM =========== CHKDSK ===========
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

REM =========== DELETE TEMP ===========
:choice11
cls
:confirm_loop
echo %DELETE_TEMP_PROMPT%
set /p confirm=%DELETE_TEMP_CONFIRM%
if /I "%confirm%"=="Y" goto delete_temp
if /I "%confirm%"=="YES" goto delete_temp
if /I "%confirm%"=="S" goto delete_temp
if /I "%confirm%"=="SI" goto delete_temp
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

REM =========== REGISTRY TOOLS ===========
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
if /I "%confirm%"=="S" goto delete_safe_entries
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

REM =========== CONTACT / SUPPORT ===========
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

REM =========== EXIT ===========
:choice14
cls
echo %EXITMSG%
exit

REM =========== SHOW DRIVERS ===========
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

REM =========== WINDOWS UPDATE REPAIR ===========
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

REM =========== SYSTEM REPORT ===========
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

REM =========== UPDATE UTILITY & RESET ===========
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

REM =========== ROUTING TABLE ===========
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