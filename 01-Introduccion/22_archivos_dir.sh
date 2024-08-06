#!/usr/bin/env bash
# Programa para ejemplificar la creación de archivos y directorios.
# Autor Ruben Tellez Gerardo - rubentellezgerardo@aol.com

uso="\nUso:\n d) Crea un directorio con permisos 755\n f) Crea un archivo con permisos 755"

echo "Archivos - Directorios"

if [ $# = 0 ]; then
    echo -e "$uso"
elif [ $1 = "d" ]; then
    mkdir -m 755 $2
    echo "Directorio creado correctamente"
    ls -la $2
elif [ $1 = "f" ]; then
    touch $2
    chmod 755 $2
    echo "Archivo creado correctamente"
    ls -la $2
else
    echo "Opción $1 no valida."
    echo -e "$uso"
fi
