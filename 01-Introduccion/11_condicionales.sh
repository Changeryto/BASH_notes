#!/usr/bin/env bash
# Programa para ejemplificar las sentencias if, else en bash.
# Autor: Rubén Téllez Gerardo rubentellezgerardo@aol.com

echo "Ejemplo sentencia if else"
read -n2 -p "Indique cual es su nota (00-10): " notaClase
echo -e "\n"

if (( $notaClase >= 7 )); then
    echo "Alumno aprobado"
else
    echo "Alumno reprobado"
fi


read -p "Indique cuál es su edad: " edad

if [ $edad -le 18 ]; then # -le significa menor o igual
    echo "Persona sin derecho a votar."
else
    echo "La persona puede votar."
fi
