#!/usr/bin/env bash
# Programa para mostrar cómo capturar la información del usuario usando el comando read.
# Autor: Rubén Téllez Gerardo

option=0
backupName=""

echo "Programa de Utilidades Postgres"
read -p "Ingresa una opción: " option
read -p "Ingresar el nombre del archivo del backup: " backupName

echo "Opción: $option , $backupName"
