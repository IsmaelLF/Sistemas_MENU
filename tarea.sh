#!/bin/bash

#Limpar a pantalla
clear
sair=0
#Opcions(1. ver se un ficheiro existe, 2. renomear un arquivo, 3.listar todos os elementos e indicar se son arquivos ou directorios, 4. Mostrar tamanho dun arquivo, 5. Mover un arquivo a outro directorio)
while [ $sair -eq 0 ]
do
echo -e "Elixe unha opción: \n1. Comprobar se existe un arquivo.
\n2. Renomear un arquivo. 
\n3. Mostrar as especificacions do sistema
\n4. Mostra o tamaño dun arquivo.
\n5. Mover un arquivo a outro directorio
\n6. Sair do programa"

read opcion

if [ $opcion == 1 ]
then 
        for file in $HOME/*
        do
        read -p "Introduce o nome do arquivo: " nomeficheiro
        
        if [ -e $nomeficheiro.* ]
        then
        echo "O arquivo especificado existe"
        else 
        echo "O arquivo especificado non existe"
        
        fi
        done
        
elif [ $opcion == 2 ]
then
    read -p "Introduce o nome actual do arquivo " nomeactual
    echo "O nome actual e: $nomeactual"
    read -p "Introduce o novo nome do arquivo " nomenovo
    if [ $nomenovo == $nomeactual ]
    then
        echo "Non podes nomear o arquivo co mesmo nome que xa tiña"
    else 
        echo "O ficheiro renomeouse a : $nomenovo"
    fi
elif [ $opcion == 3 ]
then
    echo "As especificacions do sistema son:
    CPU: 
    GPU:
    RAM: "

elif [ $opcion == 4 ]
then
    read -p "Introduce o nome do arquivo " arquivo

    echo "O arquivo pesa: () KB"

elif [ $opcion == 5 ] 
then
    read -p "Introduce o nome do arquivo a mover " arquivo
    echo "A onde queres mover $arquivo?" ficheiro



else 
    sair=1
fi
done
