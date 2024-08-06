#!/usr/bin/env bash
# Programa que ejemplifica la lectura de un archivo
# Ruben Tellez Gerardo rubentellezgerardo@aol.com

if [ $# = 0 ]; then
    exit 1
fi

echo "Leer en un archivo"
cat $1

echo -e "\nAlmacenar los valores en una variable"
valorCat=$(cat $1)
echo "$valorCat"

# Se usa la variable IFS (Internal File Separator)
# Para evitar que los espacios en blancos se recorten
# Al inicio o al final.
echo -e "\nLeer archivos línea a línea"

while IFS= read linea
do
    echo "Línea leída: $linea"
done < $1
