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
    echo -e "Verificando instalación de Postgres ..."
    verifyInstall=$(which psql)
    if [ $? -eq 0 ]; then
        echo "${RED}Postgres ya se encuentra instalado en el equipo${ENDCOLOR}"
    else
        read -s -p "Contraseña para $USER: " passwd
        read -s -p "Nueva contraseña para Postgres: " postgresPasswd
        echo "$passwd" | sudo -S dnf install postgresql postgresql-contrib
        sudo -u postgres psql -c "ALTER TABLE postgres WITH PASSWORD '{$postgresPasswd};'"
        read -p "¿Habilitar servicio? (alternativamente sólo se iniciará) [y/(n)]" activarPostgres
        if [ $activarPostgres = "y" ] || [ $activarPostgres = "Y" ]; then
            echo "$passwd" | sudo -S systemctl enable postgresql.service
        else
            echo "$passwd" | sudo -S systemctl start postgresql.service
        fi
    fi
    read -n1 -s -r -p "PRESIONA CUALQUIER TECLA PARA CONTINUAR"
}

# Funcion para desinstalar postgres
desinstalar_postgres () {
    read -s -p "Contraseña para $USER: " passwd
    echo -e "\n"
    echo "$passwd" | sudo -S systemctl stop postgresql.service
    echo "$passwd" | sudo -S dnf remove postgresql postgresql-contrib
    echo "$passwd" | sudo -S rm -r /etc/postgresql
    echo "$passwd" | sudo -S rm -r /etc/postgresql-common
    echo "$passwd" | sudo -S rm -r /var/lib/postgresql
    echo "$passwd" | sudo -S userdel -r postgresql
    echo "$passwd" | sudo -S grupodel rm -r postgresql
    read -n1 -s -r -p "PRESIONA CUALQUIER TECLA PARA CONTINUAR"
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
