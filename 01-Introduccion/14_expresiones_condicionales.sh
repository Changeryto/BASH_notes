#!/usr/bin/env bash
# Programa para ejemplificar el uso de expresiones condicionales.
# Autor: Ruben Tellez Gerardo - rubentellezgerardo@aol.com

edad=0
pais=""
pathArchivo=""

read -p "Ingresa la edad: " edad
read -p "Ingrese tu país: " pais
read -p "Ingresa el path de tu archivo: " pathArchivo
echo -e "\nExpresiones Condicionales con no."

if [ $edad -lt 10 ]; then
    echo "La persona es un infante"
elif [ $edad -ge 10 ] && [ $edad -le 17 ]; then
    echo "La persona es un adolescente"
else
    echo "La persona es mayor de edad"
fi


echo -e "\nExpresiones Condicionales con strings"

if [ "$pais" = "EEUU" ] || [ "$pais" = Mexico ]; then
    echo "La persona norteamericana."
elif [ "$pais" = "Ecuador" ] || [ $pais = "Colombia" ]; then
    echo "La persona es sudamericana."
else
    echo "El país no está cargado en el sistema."
fi


echo -e "\nExpresiones Condicionales con archivos"

# Verificar si un path existe
if [ -d $pathArchivo ]; then
    echo "El directorio $pathArchivo existe"
else
    echo "El directorio no existe"
fi
