#!/usr/bin/env bash
# Programa para ejemplificar el uso de arreglos.
# Autor Ruben Tellez Gerardo rubentellezgerardo@aol.com

arregloNumeros=(1 2 3 4 5 6 8)
arregloCadenas=(Marco Antonio Pedro Susana)
arregloRangos=({A..Z} {10..20})

# Imprimir todos los valores
echo "Arrglo de números: ${arregloNumeros[*]}"
echo "Arreglo de strings: ${arregloCadenas[*]}"
echo "Arreglo rangos: ${arregloRangos[*]}"

# Imprimir el tamanio de los arreglos
echo "Tamaño arreglo de números: ${#arregloNumeros[*]}"
echo "Tamaño arreglo de strings: ${#arregloCadenas[*]}"
echo "Tamaño arreglo rangos: ${#arregloRangos[*]}"

# Imprimir la posicion 3 del arreglo
echo "Posición 3 arrglo de números: ${arregloNumeros[2]}"
echo "Posición 3 de strings: ${arregloCadenas[2]}"
echo "Posición 3 arreglo rangos: ${arregloRangos[3]}"

# Aniadir y eliminar valores en un array.
arregloNumeros[7]=20
unset arregloNumeros[0]
echo "Nuevo arreglo nums: ${arregloNumeros[*]}"
echo "Nuevo tamanio arreglo nums. ${#arregloNumeros[*]}"
