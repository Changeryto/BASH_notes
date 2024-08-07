#!/usr/bin/env bash
# WIP!!!!!
# Programa que permite ejemplificar el menu de utilidades Postgres
# Autor Rubén Tellez Gerardo - rubentellezgerardo@aol.com

echo "WIP!!!"
opcion=5
passwd=""
fechaActual=$(date +%Y%m%d)

# Colores
ENDCOLOR="\e[0m"
RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"

# Funciones (siempre antes del resto del programa)

# Funcion para esperar una tecla
wait_press() {
    echo -e "${GREEN}PRESIONA CUALQUIER TECLA PARA CONTINUAR${ENDCOLOR}"
    #read -n1 -s -r -p 
    read -n1
}

# Funcion para crear el demonio de postgres
crear_deamon () {
echo "[Unit]
Description=PostgreSQL database server
After=network.target

[Service]
Type=forking

User=postgres
Group=postgres

# Where to send early-startup messages from the server (before the logging
# options of postgresql.conf take effect)
# This is normally controlled by the global default set by systemd
# StandardOutput=syslog

# Disable OOM kill on the postmaster
OOMScoreAdjust=-1000
# ... but allow it still to be effective for child processes
# (note that these settings are ignored by Postgres releases before 9.5)
Environment=PG_OOM_ADJUST_FILE=/proc/self/oom_score_adj
Environment=PG_OOM_ADJUST_VALUE=0

# Maximum number of seconds pg_ctl will wait for postgres to start.  Note that
# PGSTARTTIMEOUT should be less than TimeoutSec value.
Environment=PGSTARTTIMEOUT=270

Environment=PGDATA=/usr/local/pgsql/data


ExecStart=/usr/local/pgsql/bin/pg_ctl start -D ${PGDATA} -s -w -t ${PGSTARTTIMEOUT}
ExecStop=/usr/local/pgsql/bin/pg_ctl stop -D ${PGDATA} -s -m fast
ExecReload=/usr/local/pgsql/bin/pg_ctl reload -D ${PGDATA} -s

# Give a reasonable amount of time for the server to start up/shut down.
# Ideally, the timeout for starting PostgreSQL server should be handled more
# nicely by pg_ctl in ExecStart, so keep its timeout smaller than this value.
TimeoutSec=300

[Install]
WantedBy=multi-user.target" > /usr/lib/systemd/system/postgresql.service || echo -e "${RED}NO SE PUDO CREAR EL DAEMON${ENDCOLOR}"
echo "$passwd" | sudo -S systemctl daemon-reload
echo "$passwd" | sudo -S systemctl enable postgresql
}

# Funcion para instalar postgres
instalar_postgres () {
    echo -e "Verificando instalación de Postgres ..."
    verifyInstall=$(which psql)
    if [ $? -eq 0 ]; then
        echo -e "${RED}Postgres ya se encuentra instalado en el equipo${ENDCOLOR}"
    else
        read -e -s -p "\nContraseña para $USER: " passwd
        read -e -s -p "\nNueva contraseña para Postgres: " postgresPasswd
        echo "$passwd" | sudo -S dnf install -y postgresql postgresql-contrib
        crear_deamon
        sudo -u postgres psql -c "ALTER TABLE postgres WITH PASSWORD '{$postgresPasswd};'"
        read -p "¿Habilitar servicio? (alternativamente sólo se iniciará) [y/(n)]: " activarPostgres
        if [ $activarPostgres = "y" ] || [ $activarPostgres = "Y" ]; then
            echo "$passwd" | sudo -S systemctl enable postgresql.service
        else
            echo "$passwd" | sudo -S systemctl start postgresql.service
        fi
    fi
    wait_press
}

# Funcion para desinstalar postgres
desinstalar_postgres () {
    read -s -p "Contraseña para $USER: " passwd
    echo -e "\n"
    echo "$passwd" | sudo -S rm /usr/lib/systemd/system/postgresql.service

    echo "$passwd" | sudo -S systemctl stop postgresql.service
    echo "$passwd" | sudo -S dnf remove -y postgresql postgresql-contrib
    echo "$passwd" | sudo -S rm -r /etc/postgresql
    echo "$passwd" | sudo -S rm -r /etc/postgresql-common
    echo "$passwd" | sudo -S rm -r /var/lib/postgresql
    echo "$passwd" | sudo -S userdel -r postgresql
    echo "$passwd" | sudo -S grupodel rm -r postgresql
    wait_press
}

# Funcion para sacar respaldo
sacar_respaldo () {
    echo -e "${GREEN}Listando bases de datos${ENDCOLOR}"
    sudo -u postgres psql -c "\l"
    read -p "Elegir la base de datos a respaldar" bddRespaldo
    echo -e "\n"
    echo "Directorio backup: $1"
    if [ -d "$1" ]; then
        echo "Establecer permisos al directorio"
        echo "$passwd" | sudo -S chmod 755 $1
        echo "Realizando respaldo ..."
        sudo -u postgres pg_dump -Fc $bddRespaldo > "$1/bddRespaldo$fechaActual.bak"
        echo "Respaldo realizado en $1/bddRespaldo$fechaActual.bak"
    wait_press
    else
        echo "El directorio $1 no existe"
    fi
}

# Funcion para restaurar respaldo
restaurar_respaldo () {
    echo "Listar los respaldos"
    read -p "Ingresa directorio del respaldo" directorioBackup
    ls -la $directorioBackup
    read -p "Elegir el respaldo a restaurar: " respaldo
    read -p "Ingrese nombre de la BDD destino: " bddDestino
    # Verificar si la BDD existe
    verifyBdd=$(sudo -u postgres psql -lqt | cut-d \| -f 1 | grep -wq $bddDestino)
    if [ $? -eq 0 ]; then
        echo "Restaurando en: $bddDestino"
    else
        sudo -u postgres psql -c "Creando BDD $bddDestino"
    fi


    # Verificando directorio
    if [ -f "$1/$respaldo" ]; then
        echo "Restaurando respaldo ..."
        sudo -u postgres pg_restore -Fc -d $bddDestino "$directorioBackup/$respaldo" && echo "Respaldo exitoso" || echo "Fallo al respaldar"
    else
        echo "El respaldo $respaldo no existe"
    fi


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
            ;;
        2)
            desinstalar_postgres
            ;;
        3)
            read -p "Directorio de Backup: " directorioBackup
            sacar_respaldo $directorioBackup
            ;;
        4)
            read -p "Directorio de Backup: " directorioBackup
            restaurar_respaldo $directorioBackup
            ;;
        5)
            echo "Adios..."
            exit 0
            ;;
    esac
done
