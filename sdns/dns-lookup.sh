#!/bin/bash 


if [ -z $1 ];
then 
	echo "O valor não pode ser nulo"
else 
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
fi
