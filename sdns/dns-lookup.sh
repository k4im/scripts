#!/bin/bash 

# Define funcao para realizar operacao
# de buscar de dados MX, DNS, TXT, CNAME
# NS, A. 

sdns()
{
	echo "MX: "
	host -t MX $1
	echo "---------------------"
	echo  "servidores DNS: "
	host -t NS $1
	echo "---------------------"
	echo  "Endereço IP: "
	host -t A $1
	echo "---------------------"
	echo  "TXT: "
	host -t TXT $1
	echo "--------------------"
	echo  "CNAME: "
	host -t CNAME $1
	echo "---------------------"
	echo "Ping: "
	ping_result=$(ping -c 1 $1 | grep -i from)
	echo $ping_result
}

# Verifica se o endereço é valido
# & se foi adicionado algum argumento 
# apos a execucacao do script.
msg="Por favor adicione um endereço valido"
if [ $# -ne 1 ]; 
then
	echo $msg 
	exit 1
else
	# Chama a função e realiza a operação de sdns 
	sdns $1 && exit 0
fi 
