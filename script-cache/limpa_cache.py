import os 
import time
import subprocess
# Função que estará realizando a operação de limpeza de cache
def limpar_cache():
    try:
        # To Clear PageCache only
        os.system("sudo sh -c 'echo 1 >  /proc/sys/vm/drop_caches'")
        # To Clear dentries and inodes
        os.system("sudo sh -c 'echo 2 >  /proc/sys/vm/drop_caches'")
        # To Clear PageCache, dentries and inodes
        os.system("sudo sh -c 'echo 3 >  /proc/sys/vm/drop_caches'")
        # Clearing Buffer/Cache in Linux
        os.system("sudo sync && echo 1 > /proc/sys/vm/drop_caches")
        return True
    except:
        return False
# irá iniciar o primeiro print para o script de limpar a cache em memoria
print("Script para limpar cache da memoria")

# irá levar 1s para iniciar o processo!
time.sleep(1)
os.system("clear")

# irá de fato iniciar o processo de limpar o cache de memoria
result = limpar_cache()

# verifica se o resultado é True, caso positivo, retorna a mensagem 
if result:
    print("Cache da memoria limpo com sucesso!")
else:
    print("Não foi possivel limpar o cache")

