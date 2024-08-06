#!/usr/bin/env bash
# Programa que ejemplifica las operaciones de un archivo
# Ruben Tellez Gerardo rubentellezgerardo@aol.com

if [ $# = 0 ]; then
    exit 1
fi

echo "Operaciones de un archivo"
mkdir -m 755 backupScripts

echo -e "\nCopiar los scripts del directorio actual al nuevo."
cp *.sh backupScripts/
ls -la backupScripts/

echo -e "\nMover archivos a otra ubicación: $HOME"
mv backupScripts $HOME

echo "Eliminar archivos .txt"
rm *.txt

