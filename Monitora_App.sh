#!/bin/bash
# 
# Monitora a aplicação passada como parâmetro.
# Se esta morrer, o script a re-executará.

if [[ -z "$1" ]];then
    echo "ERRO: ./Monitora_App PROGRAMA"
    exit 1
fi

while (( 0 == 0 ));do
    $@ &
    pid=`jobs -l | awk '{print $2}'`
    wait $pid
done