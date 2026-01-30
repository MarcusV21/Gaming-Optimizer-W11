@echo off
setlocal enabledelayedexpansion

REM --- FUNCAO LIMPEZA ---
call :limpar_temp

REM --- PERGUNTA PARA AGENDAR ---
echo.
set /p resposta=Voce deseja configurar este script para rodar automaticamente uma vez a cada boot? (S/N): 
set resposta=!resposta:~0,1!
if /i "!resposta!"=="S" (
    call :criar_tarefa
) else (
    echo Tarefa nao sera criada. Fim do script.
    pause
    exit /b
)

pause
exit /b

:limpar_temp
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
exit /b

:criar_tarefa
echo Criando tarefa agendada para executar no boot...

REM Define o caminho completo do script atual
set SCRIPT_PATH=%~f0

REM Nome da tarefa
set TASK_NAME=LimpezaTemporariosBoot

REM Cria a tarefa agendada para executar no boot com privilégios elevados
schtasks /Create /TN "%TASK_NAME%" /TR "\"%SCRIPT_PATH%\" /runonce" /SC ONSTART /RL HIGHEST /F >nul 2>&1

if %errorlevel% equ 0 (
    echo Tarefa agendada criada com sucesso.
) else (
    echo Falha ao criar tarefa agendada. Execute este script como administrador.
    exit /b 1
)

REM Agora a tarefa criada vai rodar no boot
REM Precisamos garantir que ela rode somente uma vez por boot.

REM Para isso, usamos o parâmetro /runonce na tarefa, mas o schtasks nao tem /runonce para ONSTART.
REM Alternativa: criar tarefa que roda no boot e após rodar, se auto-remove

REM Ajustar para criar tarefa que se auto-remove após executar:

schtasks /Delete /TN "%TASK_NAME%" /F >nul 2>&1
schtasks /Create /TN "%TASK_NAME%" /TR "\"%SCRIPT_PATH%\" /remover" /SC ONSTART /RL HIGHEST /F >nul 2>&1

echo Tarefa configurada para rodar automaticamente uma vez a cada boot.

exit /b

:remover
REM Limpa e depois remove a tarefa para evitar execucoes repetidas no mesmo boot

call :limpar_temp

echo Removendo tarefa agendada apos execucao...
schtasks /Delete /TN "LimpezaTemporariosBoot" /F >nul 2>&1

exit /b
