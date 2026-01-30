@echo off
echo Iniciando limpeza de arquivos temporarios...

REM Limpar %TEMP% e %TMP%
if exist "%TEMP%" (
    echo Limpando %TEMP%...
    del /q /f /s "%TEMP%\*.*" >nul 2>&1
    for /d %%p in ("%TEMP%\*") do rmdir /s /q "%%p" >nul 2>&1
)

if exist "%TMP%" (
    echo Limpando %TMP%...
    del /q /f /s "%TMP%\*.*" >nul 2>&1
    for /d %%p in ("%TMP%\*") do rmdir /s /q "%%p" >nul 2>&1
)

REM Limpar C:\Windows\Temp
set WIN_TEMP=C:\Windows\Temp
if exist "%WIN_TEMP%" (
    echo Limpando %WIN_TEMP%...
    del /q /f /s "%WIN_TEMP%\*.*" >nul 2>&1
    for /d %%p in ("%WIN_TEMP%\*") do rmdir /s /q "%%p" >nul 2>&1
)

REM Limpar C:\Windows\Prefetch (requer admin)
set PREFETCH=C:\Windows\Prefetch
if exist "%PREFETCH%" (
    echo Limpando %PREFETCH%...
    del /q /f /s "%PREFETCH%\*.*" >nul 2>&1
    for /d %%p in ("%PREFETCH%\*") do rmdir /s /q "%%p" >nul 2>&1
)

REM Rodar limpeza do Disk Cleanup com configuracao predefinida
echo Executando limpeza do Disk Cleanup...
cleanmgr /sagerun:1

echo Limpeza concluida!!!
pause
exit
