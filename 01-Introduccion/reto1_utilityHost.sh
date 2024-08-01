#!/usr/bin/env bash
# Programa para imprimir 2 variables.

read -p "Elija opción: " option
result=$((213 * $option))

echo "Seleccionaste la opción $option. Resultado: $result"
