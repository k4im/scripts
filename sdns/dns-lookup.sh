#!/bin/bash 

# define função de sdns.

sdns()
{
	echo "---------------------"
	echo -n "MX: "
	host -t MX $1
	echo -n "server DNS: "
	host -t NS $1
	echo -n "Endereço IP: "
	host -t A $1
	echo -n "TXT: "
	host -t TXT $1
	echo -n "CNAME: "
	host -t CNAME $1
	echo "--------------------"

}

#Verifica se o endereço é valido
msg="Por favor adicione um endereço valido"
if [ $# -ne 1 ]; 
then
	echo $msg 
	exit 1
else
	# Chama a função e realiza a operação de sdns 
	sdns $1 && exit 0
fi 
