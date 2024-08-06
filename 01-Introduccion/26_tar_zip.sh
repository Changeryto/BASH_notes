#!/usr/bin/env bash
# Programa para ejemplificar el empaquetamiento con tar y gzip.
# Ruben Tellez Gearardo \ rubentellezgerardo@aol.com

echo "Empaquetar todos los scripts de la carpeta actual"
# c create. v vervose. f file.
tar -cvf shellCourse.tar *.sh

# Cuando se empaqueta con gzip, el empaquetamiento anterior se elimina.
gzip shellCourse.tar

echo "Empaquetar 1 archivo unico, con un ratio 9"
gzip -9 renames.sh

# Descomprimir el archivo
if [ $# = 1 ]; then
    tar -xf $1
fi
