#!/usr/bin/env bash
# Programa que permite ejemplificar el menu de utilidades Postgres
# Autor Rubén Tellez Gerardo - rubentellezgerardo@aol.com

opcion=5

# Colores
ENDCOLOR="\e[0m"
RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"

# Funciones (siempre antes del resto del programa)

# Funcion para instalar postgres
instalar_postgres () {
    echo "Instalando Postgres ..."
}

# Funcion para desinstalar postgres
desinstalar_postgres () {
    echo "Desinstalando Postgres ..."
}

# Funcion para sacar respaldo
sacar_respaldo () {
    echo "Generando respaldo ..."
    echo "Directorio respaldado: $1"
}

# Funcion para restaurar respaldo
restaurar_respaldo () {
    echo "Restaurando respaldo ..."
    echo "Directorio respaldado: $1"
}



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
            instalar_postgres
            sleep 3
            ;;
        2)
            desinstalar_postgres
            sleep 3
            ;;
        3)
            read -p "Directorio de Backup: " directorioBackup
            sacar_respaldo $directorioBackup
            sleep 3
            ;;
        4)
            read -p "Directorio de Backup: " directorioBackup
            restaurar_respaldo $directorioBackup
            sleep 3
            ;;
        5)
            echo "Adios..."
            exit 0
            ;;
    esac
done
