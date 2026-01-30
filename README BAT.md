README - Script de Limpeza de Arquivos Temporários

Descrição:
------------
Este script em batch realiza a limpeza de arquivos temporários do Windows. 
Ele remove arquivos e pastas das seguintes localizações:
- Pastas do usuário: %TEMP% e %TMP%
- Pasta do sistema: C:\Windows\Temp
- Prefetch: C:\Windows\Prefetch (requer permissões de administrador)
Além disso, executa a limpeza do Disk Cleanup com uma configuração predefinida.

Como usar:
------------
1. Salve o arquivo com extensão .bat.
2. Clique duas vezes no arquivo ou execute pelo Prompt de Comando.
3. O script fará a limpeza automática das pastas mencionadas.
4. Ao final, será exibida a mensagem "Limpeza concluida!!!" e o script pausará para você ver o resultado.

Observações:
------------
- Recomenda-se executar como administrador para garantir a limpeza completa.
- A limpeza de Prefetch pode afetar temporariamente a inicialização de aplicativos.
- O script exclui arquivos permanentemente das pastas temporárias e do Prefetch.
