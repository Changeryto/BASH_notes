#!/usr/bin/env bash
# Programa para ejemplificar cómo se escribe en un archivo.
# Autor Rubén Téllez Gerardo | rubentellezgerardo@aol.com

echo "Escribir en un archivo"

# Aniade el argumento 2 en el archivo del argumento 1.
echo "Valor escrito con echo" >> $1

# Adicion multilinea
# EOM es una palabra reservada que puede ser cambiada
cat << EOM >>$1
$2
EOM
