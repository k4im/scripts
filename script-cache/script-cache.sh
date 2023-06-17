#!/bin/bash

#Irá realizar a operação de limpar o cache em Buffer/Cache, dentries inodes

sudo sh -c 'echo 3 >  /proc/sys/vm/drop_caches'

sudo sync && echo 1 > /proc/sys/vm/drop_caches


echo "Script acabou de limpar o cache" 

exit 0
