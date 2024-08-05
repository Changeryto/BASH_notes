#!/usr/bin/env bash
# Programa para ejemplificar las sentencias if, elif en bash.
# Autor: Rubén Téllez Gerardo rubentellezgerardo@aol.com

edad=0
echo "Ejemplo sentencia if else"
echo -e "\n"


while [ -n "$1" ]
do    
    edad=$1

    if [ $edad -ge 18 ]; then
        echo "$edad : La persona es mayor de edad."
    elif [ $edad -ge 13 ] && [ $edad -le 18 ]; then
        echo "$edad : La persona es adolecente."
    else
        echo "$edad : La persona es un ninio."
    fi

shift
done