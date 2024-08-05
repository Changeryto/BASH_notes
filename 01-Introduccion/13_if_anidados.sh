#!/usr/bin/env bash
# Programa para ejemplificar los if anidados.
# Autor: Ruben Tellez Gerardo rubentellezgerardo@aol.com

echo "Ejemplo Sentencia if else anidado."
notaClase=0
read -n2 -p "Indique la nota (00-10): " notaClase
echo -e "\n"
if [ $notaClase -ge 7 ]; then
    echo "El alumno aprueba la materia."
    read -n1 -p "¿Va a continuar estudiando en el siguiente nivel? (s/n): " continua
    if [ "$continua" = "s" ]; then
        echo -e "\nBienvenido al siguiente nivel."
    else
        echo -e "\nGracias por trabajar con nosotros. Suerte."
    fi
else
    echo "El alumno reprueba la materia."
fi
