#!/bin/bash 


read -p "Por favor insira a mensagem do commit: " commitMsg


echo "Realizando a operaçoes git" 

git config --global user.email "contato.vitorsantos@hotmail.com"
git config --global user.name "k4im" 
git add .; git commit -m "$commitMsg"; git push 


