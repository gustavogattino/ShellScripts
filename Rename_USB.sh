#!/bin/bash
# 
# Renomeia um dispositivo USB usando o mrename.


if [[ -z "$1" ]];then
    echo "ERRO: ./Rename_USB /dev/USB/PATH NOME"
    echo "EXMP: ./Rename_USB /dev/sdc1 BARAD-DUN"
    exit 1
fi

if [ `whoami` != root ]; then
    echo "Precisa ser sudo!"
    echo "Abortando..."
    exit 1
fi

hash mlabel 2>/dev/null || { echo >&2 "Precisa instalar o mtools.
Abortando..."; exit 1; }

mlabel -i $1 ::$2