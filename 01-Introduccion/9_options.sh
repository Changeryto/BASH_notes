#!/usr/bin/env bash
# Programa para ejemplificar el paso de opciones con o sin parámetros.
# Autor: Rubén Téllez Gerardo -rubentellezgerardo@aol.com

echo "Programa opciones"
echo "Opcion 1 enviada: $1"
echo "Opcion 2 enviada: $2"
echo "Opcion 3 enviada: $3"
echo "Opciones enviadas: $*"

echo -e "\n"
echo "Recuperar valores"

while [ -n "$1" ]
do
case "$1" in
    -a) echo "-a option utilizada";;
    -b) echo "-b option utilizada";;
    -c) echo "-c option utilizada";;
    *) echo "$1 no es una opción válida";;
esac
shift
done
