#!/usr/bin/env bash
# Programa para ejemplificar el empaquetamiento con tar.
# Ruben Tellez Gearardo \ rubentellezgerardo@aol.com

echo "Empaquetar todos los scripts de la carpeta actual"
# c create. v vervose. f file.
tar -cvf shellCourse.tar *.sh
