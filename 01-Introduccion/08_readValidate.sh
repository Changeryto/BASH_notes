#!/usr/bin/env bash
# Programa que ejemplifica la captura y validación de información obtenida del usuario.
# Autor: Rubén Téllez Gerardo

option=0
backupName=""
clave=""

optionRegex='^(1|2|3)$'
yesRegex='^(y|Y)$'

echo "Programa Utilidades Postgres"
# Acepta el ingreso de información de sólo un caracter. A reconocerlo, pasa a la siguiente linea

while ! [[ $option =~ $optionRegex ]]
do
read -n1 -p "Ingresa una opción (1|2|3): " option

    if [[ $option =~ $optionRegex ]]; then
        echo " valida"
    else
        echo " invalida"
    fi
done
echo -e "\n"

# Requiere un nombre de 10 caracteres

while [[ true ]]
do
    echo -e "\n"
    read -n10 -p "Ingresa el nombre del Backup: " backupName
    echo -e "\n"
    read -p  "Nombre \"$backupName\". Correcto? (y|n): " acceptName

    if ! [[ $acceptName =~ $yesRegex ]]; then
        continue
    else
        break
    fi

done

echo "Opción $option. Nombre: $backupName"
# -s o silence, oculta la información ingresada
read -s -p "Clave: " clave
echo -e "\nClave: $clave"


