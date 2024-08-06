#!/usr/bin/env bash
# Programa para ejemplificar el uso de break y continue
# Autor Ruben Tellez Gerardo - rubentellezgerardo@aol.com

echo "Sentencias break y continue"
#breakRegex='^7_*$'

for file in $(ls)
do
    for num in {1..4}
    do
        if [[ "$file" == "10_uso_wget.sh" ]]; then
            echo "BREAK ACTIVADO file: $file num: $num"
            break
        elif [[ $file == 4* ]]; then
            echo "CONTINUE ACTIVADO file: $file num: $num"
            continue
        else
            echo "Iteración completada $file iteracion $num"
        fi
    done
done
