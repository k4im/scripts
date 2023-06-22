#!/bin/bash 

echo "Executando script veracrypt-script.sh...."
read -p "Insira o caminho absoluto para a keyfile: " KEYFILE
read -p "Insira o caminho absoluto para o veracrypt.vc: " VERADRIVE

readonly DIR="/media/vc1"


# verifica se o endereço existe, caso exista ele executa o comando 
# para montar disco veracrypt utilizando o arquivo de chave.
if [ -d "$DIR" ]; 
then
	if veracrypt --text --mount $VERADRIVE $DIR --keyfiles "$KEYFILE" --pim 0 --protect-hidden no; 
	then	
		echo "O script acabou de finalizar"
		sleep 2
		clear
		exit 0
	else
		clear
		echo "Não foi possivel realizar a montagem do driver"
		exit 1
	fi
else

	# Verifica se o diretório /media existe, caso o mesmo não existe, irá criar o /media e posteriormente /media/vc1.
	# Geralmente este /media não existe em distro Arch.
	if [ -d /media ]; 
	then
		mkdir /media/vc1
	else
		mkdir /media
		mkdir /media/vc1
	fi

	# Executa o comando para montagem do disco.
	if veracrypt --text --mount $VERADRIVE $DIR --keyfiles "$KEYFILE" --pim 0 --protect-hidden no; 
	then	
		echo "O script acabou de finalizar"
		sleep 2
		clear
		exit 0
	else
		clear
		echo "Não foi possivel realizar a montagem do driver"
		exit 1
	fi
fi
