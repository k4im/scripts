#!/bin/bash 

read -p "Favor insira o endereço para pesquisa: " URL

if [ -z $URL ];
then 
	echo "O valor não pode ser nulo"
else 
	host -t MX $URL
	host -t NS $URL
	host -t A $URL
fi
