import subprocess

def definir_git_configs(email, user_name):
    try:
        command = f"git config user.email '{email}'"
        user_command = f"git config user.name '{user_name}'"
        sub1 = subprocess.check_call(command, shell=True)
        sub2 = subprocess.check_call(user_command, shell=True)
        print("configurado com sucesso!") if sub1 == 0 and sub2 == 0 else print("algo deu errado!")
    except Exception as e:
        print(e)

email = input("por favor, insira seu email: ")
user_name =input("por favor, insira seu user: ")
definir_git_configs(email, user_name)