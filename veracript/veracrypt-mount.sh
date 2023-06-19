#!/bin/bash 

echo "Executando script veracrypt-script.sh...."
read -p "Insira o caminho absoluto para a keyfile: " KEYFILE
read -p "Insira o caminho absoluto para o veracrypt.vc: " VERADRIVE

DIR=/media/vc1

if [ -d "$DIR" ]; 
then
	veracrypt --text --mount $VERADRIVE $DIR --keyfiles "$KEYFILE" --pim 0 --protect-hidden no 
	echo "O script acabou de finalizar"
	sleep 5
	clear
else
	if [ -d /media ]; 
	then
		mkdir /media/vc1
	else
		mkdir /media
		mkdir /media/vc1
	fi

	veracrypt --text --mount $VERADRIVE $DIR --keyfiles "$KEYFILE" --pim 0 --protect-hidden no 
	echo "O script acabou de finalizar."
	echo "Como não foi possivel encontar $DIR, a pasta 'vc1' foi criada em /media" 
	sleep 5
	clear
fi
