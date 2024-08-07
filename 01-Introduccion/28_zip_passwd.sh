#!/usr/bin/env bash
# Programa para ejemplificar el empaquetamiento con clave usando zip.
# Por Ruben Tellez Gerardo - rubentellezgerardo@aol.com

echo "Empaquetando todos los shell scripts con zip y asignando una clave de seguridad"
zip -e shellCourse.zip *.sh

# Descomprimir con
unzip shellCourse.zip
