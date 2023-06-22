#!/bin/bash

# Variaveis
HEADER="#!/bin/bash"
DATE_NOW=$(date)
DESC="

#---------------------
# Script    : $1
# Author    : $2
# Date      : $DATE_NOW 
# License   : GNU/GLP
# Version   : 0.1
#---------------------
"


# Verifica se o script já existe
[[ -f $1 ]] && echo "Ja existe um script com este nome" &&exit 0
[[ $# -ne 1 ]] && echo "Precisa conter pelo menos um nome para o script" && exit 0

# Definindo funções para execucao do script 
criar_script()
{
    touch $1
    
    echo $HEADER > $1
    
    echo $DESC > $1
    
    chmod +x $1
    
    echo "Criado o script com sucesso!" 
    
    exit 0
}

display_helper()
{
    echo "Rapido manual de ajudo para o script Make-script"

    echo " -h  --help      estara disponibilizando o manual de helper para o usuario"
    echo " -a  --author    estara setando o autor do script"
    echo " -s  --script    estara setando apenas o nome so script"

    echo "Exemplos"
    echo " make-script nome_script autor_nome"
    echo " make-script nome_script"
}

case $1 in
    
    "-h")
    display_helper
    exit 0;;
    
    "--help")
    display_helper
    exit 0;;
    
    *)
    criar_script $1 
    exit 0
    
esac