#!/usr/bin/env bash
# Para ejemplificar el uso de pbzip
# Ruben Tellez Gerardo

echo "Empaquetar"
tar -cvf shellCourse2.tar *.sh
pbzip2 -f shellCourse2.tar

echo "Empaquetar un dir con tar y pbzip2"
tar -cf *.sh -c > shellCourse3.tar.bz2
