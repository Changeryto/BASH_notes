# !usr/bin/env bash
# Programa para ejemplificar el paso de argumentos.
# Autor Ruben Tellez Gerardo

# Cada $no. es un argumento dado al programa.
nombreCurso=$1
horarioCurso=$2

echo "Curso $nombreCurso: Horario de $horarioCurso"
echo "El no de paraemtros enviados es: $#"
echo "Los parametros enviados son: $*"
