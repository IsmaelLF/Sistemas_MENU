#!/bin/bash

#Limpar a pantalla
clear

#Opcions(1. ver se un ficheiro existe, 2. renomear un arquivo, 3.listar todos os elementos e indicar se son arquivos ou directorios, 4. Mostrar tamanho dun arquivo, 5. Mover un arquivo a outro directorio)

echo -e "Elixe unha opción: \n1. Comprobar se existe un ficheiro.\n 
\n2. Renomear un arquivo. \n  
\n3. Comprobar se os elementos son arquivos ou directorios \n 
\n4. Mostra o tamaño dun arquivo. \n 
\n5. Mover un arquivo a outro directorio \n"

read opcion

if [ $opcion == 1 ]
then 
        read -p "Introduce o nome do ficheiro": nomeficheiro
        if [ -e $nomeficheiro ]
        then
        echo "O ficheiro especificado existe"
        else 
        echo "O ficheiro especificado non existe"
        fi
elif [ $opcion == 2 ]
then
    read -p "Introduce o nome actual do ficheiro" nomeactual
    echo "O nome actual e: $nomeactual"
    read -p "Introduce o novo nome do ficheiro" nomenovo
    echo "O ficheiro renomeouse a : $nomenovo"

fi

