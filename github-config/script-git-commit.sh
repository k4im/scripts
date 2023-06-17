#!/bin/bash 


read -p "Por favor insira a mensagem do commit: " commitMsg


echo "Realizando a operaçoes git" 

git add .; git commit -m "$commitMsg"; git push 


