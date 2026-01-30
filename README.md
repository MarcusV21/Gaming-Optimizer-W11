WINDOWS 11 – GAMING OPTIMIZER (SAFE VERSION)
=========================================

Script em PowerShell para otimização segura de desempenho no Windows 11,
focado em jogos, reduzindo latência e priorizando desempenho máximo,
sem utilizar tweaks perigosos.

--------------------------------------------------
OBJETIVO
--------------------------------------------------
Este script aplica ajustes automáticos no sistema para:
- Melhorar FPS e estabilidade em jogos
- Reduzir latência (input lag e rede)
- Ativar configurações de alto desempenho
- Manter segurança e possibilidade de reversão

Indicado para usuários iniciantes e avançados.

--------------------------------------------------
REQUISITOS
--------------------------------------------------
- Windows 11
- PowerShell
- Execução como Administrador
- Permissões para alterar configurações do sistema

--------------------------------------------------
SEGURANÇA
--------------------------------------------------
- Cria ponto de restauração do sistema automaticamente
- Solicita confirmação do usuário antes das alterações
- Não remove arquivos do sistema
- Não instala programas externos
- Ajustes considerados seguros e reversíveis

--------------------------------------------------
O QUE O SCRIPT FAZ
--------------------------------------------------

1) VERIFICAÇÃO DE ADMINISTRADOR
   Garante que o script esteja sendo executado como Administrador.

2) PONTO DE RESTAURAÇÃO
   Cria um ponto chamado:
   "Antes do Gaming Optimizer"

3) PLANO DE ENERGIA
   Ativa o plano de energia de Desempenho Máximo,
   evitando limitação de CPU e GPU.

4) GAME MODE E HAGS
   - Ativa o Modo Jogo do Windows
   - Ativa Hardware Accelerated GPU Scheduling (HAGS)

5) OTIMIZAÇÕES DE LATÊNCIA (OPCIONAL)
   Ajustes avançados via bcdedit:
   - Desativa Dynamic Tick
   - Ajusta clock do sistema
   - Melhora consistência de frame time

6) OTIMIZAÇÕES DE REDE
   - Reduz latência TCP
   - Melhora resposta em jogos online
   - Aplica em todas as interfaces de rede

7) SERVIÇOS NÃO ESSENCIAIS
   Desativa serviços que consomem recursos em segundo plano:
   - SysMain
   - Telemetria
   - Serviços Xbox não essenciais

8) EFEITOS VISUAIS
   Reduz animações e efeitos para priorizar desempenho.

9) APLICATIVOS EM SEGUNDO PLANO
   Bloqueia execução de apps UWP em background.

10) LIMPEZA TEMPORÁRIA
    Remove arquivos temporários do usuário.

--------------------------------------------------
COMO USAR
--------------------------------------------------
1) Salve o script como:
   gaming-optimizer.ps1

2) Abra o PowerShell como Administrador

3) Execute:
   .\gaming-optimizer.ps1

4) Confirme as opções quando solicitado

5) Reinicie o computador após a conclusão

--------------------------------------------------
REVERSÃO
--------------------------------------------------
Caso necessário:
- Abra o Painel de Controle
- Vá em Recuperação
- Use o ponto de restauração criado pelo script

--------------------------------------------------
OBSERVAÇÕES
--------------------------------------------------
- Resultados variam conforme o hardware
- Ideal para PCs gamers
- Não recomendado para ambientes corporativos
--------------------------------------------------
Script de Limpeza de Arquivos Temporários

Descrição:
Este script em batch realiza a limpeza de arquivos
temporários do Windows. Ele remove arquivos e 
pastas das seguintes localizações:

Pastas do usuário: %TEMP% e %TMP%
Pasta do sistema: C:\Windows\Temp
Prefetch: C:\Windows\Prefetch (requer permissões 
de administrador) Além disso, executa a limpeza do 
Disk Cleanup com uma configuração predefinida.
Como usar:
Salve o arquivo com extensão .bat.
Clique duas vezes no arquivo ou execute pelo 
Prompt de Comando.
O script fará a limpeza automática das pastas 
mencionadas.
Ao final, será exibida a mensagem "Limpeza 
concluida!!!" e o script pausará para você ver o 
resultado.
Observações:
Recomenda-se executar como administrador para 
garantir a limpeza completa.
A limpeza de Prefetch pode afetar temporariamente
a inicialização de aplicativos.
O script exclui arquivos permanentemente das 
pastas temporárias e do Prefetch.

--------------------------------------------------
LICENÇA
--------------------------------------------------
Uso livre para fins pessoais e educacionais.
Modifique por sua conta e risco.
