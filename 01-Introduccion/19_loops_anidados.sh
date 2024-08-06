#!/usr/bin/env bash
# Programa para ejemplificar loops anidados.
# Ruben Tellez Gerardo - rubentellezgerardo@aol.com

echo "Loops anidados"
for file in $(ls)
do
    for number in {1..4}
    do
        echo "Verification $number: $file"
    done
done
