#!/bin/bash

#Limpar a pantalla
clear
sair=0
seguir=true
#Opcions(1. ver se un ficheiro existe, 2. renomear un arquivo, 3.listar todos os elementos e indicar se son arquivos ou directorios, 4. Mostrar tamanho dun arquivo, 5. Mover un arquivo a outro directorio)
while [ $sair -eq 0 ]
do
echo -e "Elixe unha opción: \n1. Comprobar se existe un arquivo.
\n2. Renomear un arquivo. 
\n3. Mostrar as especificacions do sistema(Windows)
\n4. Mostrar as especificacions do sistema(Linux)
\n5. Mostrar o tamaño dun arquivo
\n6. Crear un directorio
\n7. Sair do programa"
read opcion
function comprobararchivo(){
    while $seguir
    do
        read -p "Introduce o nome do arquivo: " nomearquivo
        archivo=$(find ~ -name "$nomearquivo.*" 2>/dev/null)
        if [ -n "$archivo" ]
        then
            echo "O arquivo especificado atopase en:  $archivo"
        else 
            echo "O arquivo especificado non existe"
        fi
        echo -e "\n
Pulsa 1 para buscar outro arquivo
Pulsa 2 para volver ao menu principal"
        read volver
        if [ $volver -ne 1 ]
        then
            break
        fi
    done

function renomear(){
    read -p "Introduce o nome actual do arquivo(con extension) " nomeactual
    echo "O nome actual e: $nomeactual"
    read -p "Introduce o novo nome do arquivo(con extension) " nomenovo
    if [ $nomenovo == $nomeactual ]
    then
        echo "Non podes nomear o arquivo co mesmo nome que xa tiña"
    else 
        mv "$nomeactual" "$nomenovo" 2>/dev/null
        echo "O ficheiro renomeouse a : $nomenovo"
    fi
}
}

function specsW(){
    echo "As especificacions do sistema son:"
    echo "CPU:"
    wmic cpu get name
    echo "GPU:"
    wmic path win32_VideoController get name
    echo "RAM:"
    wmic memorychip get capacity | awk '{ total += $1 } END { print total/1024/1024 "GB" }'
}

function specsL(){
    echo "As especificacions do sistema son:"

    echo "CPU:"

    lscpu | grep "Model name:"

    echo "GPU:"

    lspci | grep -i '3d'

    echo "RAM:"

    free -h | grep Mem | awk '{print $2 " total" }'
}

function tamanhoarq(){
    read -p "Introduce o nome do arquivo " arquivo

    echo "O arquivo pesa:" du -h $arquivo
}

function creardirectorio(){
    read -p "Introduce o nome do directorio " directorio
    if [ -e "$directorio" ]
    then
        echo "O directorio xa existe"
    else
        mkdir $directorio
        echo "O directorio foi creado con exito"
    fi

    while $seguir
    do
    echo -e "\nQuere crear algun arquivo no directorio?
1 para crear un arquivo
2 para volver ao menu"
        read crear
        if [ $crear -eq 1 ]
        then
            read -p "Como queres nomear o arquivo?" arquivo
            touch $directorio/$arquivo
        else
            break
        fi
    done
}

if [ $opcion == 1 ]
then
    comprobararchivo


elif [ $opcion == 2 ]
then
    renomear
elif [ $opcion == 3 ]
then
    specsW

elif [ $opcion == 4 ]

then
    specsL

elif [ $opcion == 5 ]
then
    tamanhoarq


elif [ $opcion == 6 ] 
then
    creardirectorio

else 
    sair=1
fi
done
