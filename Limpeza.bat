@echo off
echo Limpando Arquivos Temporários . . .
del /q /f /s %TEMP%\*
del /q /f /s C:\Windows\temp\*
del /q /f /s C:\Windows\Prefetch\*
cleanmgr /sagerun:1
echo Limpeza Concluída!!!
pause