#!/usr/bin/env bash
# Programa que permite ejemplificar el menu de utilidades Postgres
# Autor Rubén Tellez Gerardo - rubentellezgerardo@aol.com


# Colores
ENDCOLOR="\e[0m"
RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"

opcion=5

while : #while infinito
do
    #Limpiar la pantalla
    clear
    #Desplegar el menu de opciones
    echo "_________________________________________"
    echo -e "${CYAN}PGUTIL - Programa de Utilidad de Postgres${ENDCOLOR}"
    echo "_________________________________________"
    echo -e "${GREEN}               MENU PRINCIPAL            ${ENDCOLOR}"
    echo "_________________________________________"
    echo "1. Instalar Postgres"
    echo "2. Desinstalar Postgres"
    echo "3. Sacar respaldo de una base de datos"
    echo "4. Restaurar respaldo"
    echo "5. Salir"
    
    #Leer datos del usuario
    read -n1 -p "Seleccione opcion: " opcion
    echo -e "\n"
    #Validacion de la opcion ingresada
    case $opcion in
        1)
            echo "Instalando Postgres..."
            sleep 3
            ;;
        2)
            echo "Desinstalando Postgres..."
            sleep 3
            ;;
        3)
            echo "Obteniendo respaldo..."
            sleep 3
            ;;
        4)
            echo "Restaurando respaldo..."
            sleep 3
            ;;
        5)
            echo "Adios..."
            exit 0
            ;;
    esac
done
