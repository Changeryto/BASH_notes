#!/usr/bin/env
# Programa para verificar la declaración de variables.

# El alcance de las variables de un srcipt está limitado al proceso que lo crea. A menos que se use la palabra reservada export.

opcion=0
nombre=Ruben

echo "Opcion: $opcion y Nombre: $nombre"

# Exportar la variable nombre para su disponibilidad a los demás procesos.
export nombre

# Llamar al siguiente srcipt para utilizar la variable.
./2_variables_2.sh
