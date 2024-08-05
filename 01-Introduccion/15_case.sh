#!/usr/bin/env bash
# Programa para ejemplificar el uso de la sentencia case.
# Autor Rubén Téllez Gerardo - rubentellezgerardo@aol.com

opcion=""

echo "Ejemplo sentencia Case"
read -n1 -p "Ingresa una opción de A - E: " opcion
echo -e "\n"

case $opcion in 
    "A") echo -e "\nOperación Guardar Archivo";;
    "B") echo -e "\nOperación Eliminar Archivo";;
    [C-E]) echo "No está implementada la operación";;
    "*") echo -e "\nIncorrecto";;
esac
