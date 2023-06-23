#!/bin/bash

#-----------------------
# Script : update.sh
# Date : Fri Jun 23 11:53:18 -03 2023
# Author : k4im
# Version: 0.1
# License: GNU/GLP
#----------------------


# Funcao atualizar ubunutu(debian) 

atualizar_debian()
{
	sudo apt-get update -y && sudo apt-get upgrade -y && echo "[$(date)] Atualizado com sucesso" >> /var/log/update.log || echo "[$(date)] Nao foi possivel atualizar o sistema" >> /var/log/update.log
	
}

# Funcao para atualizar sistemas baseados em arch
atualizar_arch()
{
	sudo pacman -Syu -y && echo "[$(date)] Atualizado com sucesso" >> /var/log/update.log || echo "[$(date)] Nao foi possivel atualizar o sistema" >> /var/log/update.log

}

# Estará realizando a opecao de update e upgrade na maquina.
echo "Estamos realizando o update em sua maquina....."

sistema=$(cat /etc/os-release | grep -o UBUNTU)

if [ $sistema = "UBUNTU" ]; then 
	atualizar_debian && exit 0
	exit 1
else 
	atualizar_arch && exit 0
	exit 1 
fi 
