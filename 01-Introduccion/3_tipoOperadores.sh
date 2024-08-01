#!/usr/bin/env
# Programa para revisar los tipos de operadores.
# Autor: Rubén Téllez Gerardo -rubentellezgerardo@aol.com

numA=10
numB=4

echo "Operadores Aritméticos"
echo "No. A=$numA y B=$numB"
echo "Sumar A + B =" $((numA + numB))
echo "Restar A - B =" $((numA - numB))
echo "Multiplicar A * B =" $((numA * numB))
echo "Dividir A / B =" $((numA / numB))
echo "Residuo (Modulo) A % B =" $((numA % numB))

# -e permite manejar caracteres especiales en strings
echo -e "\nOperadores Relacionales"
echo "No. A=$numA y B=$numB"
echo "A > B =" $((numA > numB))
echo "A < B =" $((numA < numB))
echo "A >= B =" $((numA >= numB))
echo "A <= B =" $((numA <= numB))
echo "A == B =" $((numA == numB))
echo "A != B =" $((numA != numB))


echo -e "\nOperadores Asignacion"
echo "No. A=$numA y B=$numB"
echo "A += B" $((numA += numB))
echo "A -= B" $((numA -= numB))
echo "A *= B" $((numA *= numB))
echo "A /= B" $((numA /= numB))
echo "A %= B" $((numA %= numB))
