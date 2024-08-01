#!/usr/bin/env bash
# Programa para mostrar cómo capturar la información del usuario usando el comando echo, read y $REPLY.
# Autor: Rubén Téllez Gerardo

option=0
backupName=""

echo "Programa de Utilidades Postgres"
echo -n "Ingresa una opción: "
read
option=$REPLY

echo -n "Ingresar el nombre del archivo del backup: "
read
backupName=$REPLY

echo "Opción: $option , $backupName"
