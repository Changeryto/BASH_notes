#!/usr/bin/env bash
# Programa para revisar cómo ejecutar comandos dentro de un programa y almacenar en una variable para su posterior uso.
# Autor: Rubén Téllez Gerardo -rubentellezgerardo@aol.com

ubicacionActual=$(pwd)
infoKernel=$(uname -a)

echo "La ubicación actual es: $ubicacionActual"
echo "Información del Kernel: $infoKernel"
