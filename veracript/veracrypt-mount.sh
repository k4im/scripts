#!/bin/bash 

echo "Executando script veracrypt-script.sh...."
read -p "Insira o caminho absoluto para a keyfile: " KEYFILE
read -p "Insira o caminho absoluto para o veracrypt.vc: " VERADRIVE

DIR=/media/vc1

if [ -d "$DIR" ]; 
then
	sudo veracrypt --text --mount $VERADRIVE $DIR --keyfiles "$KEYFILE" --pim 0 --protect-hidden no 
else
	mkdir /media/vc1
	sudo veracrypt --text --mount $VERADRIVE $DIR --keyfiles "$KEYFILE" --pim 0 --protect-hidden no 
fi
