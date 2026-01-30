# ==========================================================
# WINDOWS 11 – GAMING OPTIMIZER (SAFE VERSION)
# Criado para qualquer usuário
# ==========================================================

Clear-Host
Write-Host "WINDOWS 11 – GAMING OPTIMIZER" -ForegroundColor Cyan
Write-Host "Recomendado para PCs de jogos" -ForegroundColor DarkGray
Write-Host ""

# -----------------------------
# Verificar administrador
# -----------------------------
if (-not ([Security.Principal.WindowsPrincipal] `
[Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
[Security.Principal.WindowsBuiltInRole]::Administrator)) {

    Write-Host "ERRO: Execute o PowerShell como Administrador!" -ForegroundColor Red
    Pause
    Exit
}

# -----------------------------
# Criar ponto de restauração
# -----------------------------
Write-Host "Criando ponto de restauração..."
Enable-ComputerRestore -Drive "C:\" -ErrorAction SilentlyContinue
Checkpoint-Computer -Description "Antes do Gaming Optimizer" -RestorePointType MODIFY_SETTINGS

# -----------------------------
# Confirmação do usuário
# -----------------------------
$confirm = Read-Host "Deseja aplicar as otimizações de desempenho? (S/N)"
if ($confirm -ne "S" -and $confirm -ne "s") {
    Write-Host "Cancelado pelo usuário."
    Exit
}

# -----------------------------
# 1. Plano de energia máximo
# -----------------------------
Write-Host "Ativando plano de energia máximo..."
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 | Out-Null
powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61

# -----------------------------
# 2. Game Mode + HAGS
# -----------------------------
Write-Host "Ativando Game Mode e HAGS..."
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f

# -----------------------------
# 3. Otimizações de latência
# -----------------------------
$latency = Read-Host "Aplicar otimizações avançadas de latência (bcdedit)? (S/N)"
if ($latency -eq "S" -or $latency -eq "s") {
    bcdedit /set disabledynamictick yes
    bcdedit /set useplatformclock no
    bcdedit /set tscsyncpolicy Enhanced
}

# -----------------------------
# 4. Rede
# -----------------------------
Write-Host "Otimizando rede..."
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpAckFrequency /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPNoDelay /t REG_DWORD /d 1 /f

$interfaces = Get-ChildItem "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces"
foreach ($iface in $interfaces) {
    reg add "$($iface.PSPath)" /v TcpAckFrequency /t REG_DWORD /d 1 /f | Out-Null
    reg add "$($iface.PSPath)" /v TCPNoDelay /t REG_DWORD /d 1 /f | Out-Null
}

# -----------------------------
# 5. Serviços
# -----------------------------
Write-Host "Desativando serviços não essenciais..."
$services = @("SysMain","DiagTrack","MapsBroker","XboxGipSvc","XboxNetApiSvc")
foreach ($svc in $services) {
    Stop-Service $svc -Force -ErrorAction SilentlyContinue
    Set-Service $svc -StartupType Disabled -ErrorAction SilentlyContinue
}

# -----------------------------
# 6. Efeitos visuais
# -----------------------------
Write-Host "Ajustando efeitos visuais..."
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d "9012038010000000" /f

# -----------------------------
# 7. Apps em segundo plano
# -----------------------------
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" `
/v GlobalUserDisabled /t REG_DWORD /d 1 /f

# -----------------------------
# 8. Limpeza temporária
# -----------------------------
Write-Host "Limpando arquivos temporários..."
Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "OTIMIZAÇÃO CONCLUÍDA!" -ForegroundColor Green
Write-Host "Reinicie o PC para melhor desempenho."
Pause
