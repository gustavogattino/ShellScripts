#!/bin/bash
# 
# Este script mostra o $PWD de usuario de acordo com o 
# tamanho do terminal que o mesmo usa. Se o tamanho do
# terminal for menor que o comprimento do $PWD, o mesmo
# é truncado com "../" para caber na tela.

    # Quantos caracteres o $NOVO_PWD deve mostrar:
    TAM=$(tput cols)
    (( maxtam = ${TAM} - 22 ))
    
    # var do comeco do NOVO_PWD se ele foi truncado
    trunc=".."
    
    dir=${PWD##*/}
    
    maxtam=$(( ( maxtam < ${#dir} ) ? ${#dir} : maxtam ))
    
    # Tira o /home/user do PWD (substitui por "~")
    NOVO_PWD=${PWD/#$HOME/\~}

    # Verifica se o NOVO_PWD e maior que o tamanho 
    # do terminal
    pwdoffset=$(( ${#NOVO_PWD} - maxtam ))
    
    if [ ${pwdoffset} -gt "0" ]
    then
        NOVO_PWD=${NOVO_PWD:$pwdoffset:$maxtam}
        NOVO_PWD=${trunc}/${NOVO_PWD#*/}
    fi

    echo $NOVO_PWD
