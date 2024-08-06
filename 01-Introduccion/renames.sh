#!/usr/bin/env bash
# Programa para renombrar archivos que inician en solo 1 número, añadiendo un 0 al inicio para respetar los algoritmos de sorting de nombres de archivos
# Rubén Téllez Gerardo - @Changeryto
for file in $(ls | grep -E -i "^[0-9]_")
do
    git mv "$file" "0$file" || mv "$file" "0$file"
done
