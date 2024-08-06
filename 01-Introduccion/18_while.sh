#!/usr/bin/env bash
# Programa para ejemplificar el uso de sentencia de iteracion while loop.
# Autor Ruben Tellez Gerardo - rubentellezgerardo@aol.com

read -p "Escoge un numero (<12): " numero

while [[ $numero -le 11 ]]
do
    echo "Activaste el while loop"
    numero=$(( numero + 1))
    echo "Nuevo no. $numero"
done
