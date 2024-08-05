#!/usr/bin/env bash
# Programa para ejemplificar el uso de la iteracion for.
# Ruben Tellez Gerardo - rubentellezgerardo@aol.com


echo "Iterar en lista de numeros"
arregloNumeros=({1..6})

for num in ${arregloNumeros[*]}
do
    echo "Iteracion $num"
done


echo "Iterar en lista de strings"

for nombre in "Margo" "Peter" "George" "Ruben"
do
    echo "Nombre $nombre"
done


echo "Iterar en archivos"

for file in *
do
    echo "Archivo encontrado: $file"
done


echo "Iterar usando un comando"
for file in $(ls)
do
    echo "Nombre en comando: $file"
done


echo "Iterar usando el formato tradicional"
for ((i=1; i<10; i++))
do
    echo "Numero iterado tradicionalmente: $i"
done
