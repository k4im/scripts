#!/bin/bash 


if [ -z $1];
then 
	echo "O valor não pode ser nulo"
else 
	host -t MX $1
	host -t NS $1
	host -t A $1
fi
