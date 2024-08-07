#!/usr/bin/env bash
# Programa para ejemplificar la transferencia por red usando el comando rsync con las opciones de empaquetamiento para optimizar velocidad de transferencia.
# Ruben Tellez Gerardo

echo "Empaquetar scripts .sh y transferirlos por red a otro equipo con rsync"

host=""
usuario=""
read -p "Ingresar host: " host
read -p "Ingresa usuario: " usuario

echo -e "\nEn este momento se procede a empaquetar la carpeta y transferir segun datos ingresados."

# Opciones para crear, empaquetar y transferir.
rsync -avz $(pwd) $usuario@$host:/home/changery/bashexamples
