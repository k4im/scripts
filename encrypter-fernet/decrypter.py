from cryptography.fernet import Fernet
import os


# Ira realizar a operação para buscar os bytes do arquivo
def buscar_bytes(arquivo):
    try:
        with open(arquivo, "rb") as f:
            bytes_file = f.read()
        return bytes_file
    except IOError as e:
        print(f"Não foi possivel realizar a opoeração")

# Ira realizar a lógica para dcryptar um arquivo 
def decryptar(arquivo):
    try:
        with open("key.key", "rb") as f:
            key_pass = f.read()      

        fernet =  Fernet(key_pass)
        arquivo_bytes = buscar_bytes(arquivo)
        enc_arquivo = fernet.decrypt(arquivo_bytes)

        with open(arquivo, "wb") as f:
            f.write(enc_arquivo)
    except Exception as e:
        print(f"Não foi possivel realizar a operação: {e}")

for file in os.listdir():
    if file == "encrypter.py" or file == "decrypter.py":
        continue
    
    if file.endswith("jpeg") or file.endswith("png"):
        decryptar(file)