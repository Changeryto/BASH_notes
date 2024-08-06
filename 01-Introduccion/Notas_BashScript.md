# Linux

## Linux consta de algunas partes principales.

- Kernel: Gestiona todos los recuersos de hardware
- Shell: Interprete que permite manejar y controlar la aplicación y programas.
- Aplicaciones: Aquellas con las que se interactúa para desarrollar alguna actividad.
- Ejecutua algunos comandos directamente en el núcleo o kernel.


## Tipos de Shell

SH, BASH, KSH, CSH
BASH es la que se tratará en este curso.


## ¿Qué es el bash scripting?
La idea es ejecutar programas de manera secuencial, con la idea de automatizar una tarea específica atravez de rutinas, funciones, palabras reservadas y sentencias para llegar a un objetivo final.
 Estos comandos colocados en un script y ejecutados por el usuario.

## Verificar que el nombre del script es único en el OS.

Esto se realiza con:

```sh
type {{ nombre_del_script }}
```

## Cambiar las variables globales

```sh
sudo vim /etc/profile
```

## ¿Cómo ejecutar un script con argumentos?

- $0 : El nombre del script
- $1 al ${10} : El número de argumento, si son más de un digito se usan llaves.
- $# : Contado de argumentos
- $* : Refiere a todos los argumentos.

## ¿Cómo realizar la sustitución de comandos en variables?

La idea de la sustitución de comandos en variables es almacenar la salida de una ejecución de un comando en una variable. Se puede realizar:

- Usando el backtick caracter (`)
- Usando el signo de dólar con el formato $(comdando)

## ¿Cómo realizar el debug de un script?

Hay 2 opciones para realizar el debug usando el comando bash.

- -v .- Usado para ver el resultado detallado de nuestro script, evaluado línea por línea.
- -x .- Usado para ver desplegar la información, capturando el comando y no su salida.


## ¿Cómo capturar la información del usuario?

Se usa el comando read de 2 maneras.

- Utilizado en conjunto con el comando echo.
- Utilizado directamente en el comando read.

## ¿Cómo validar tamaños y tipo de dato en el ingreso de la información?

- Para validar tamaños se usa el comando read -n<#_caracteres>
- Para validar el tipo de datos se usan expresiones regulares.

## RegEx


- ^.- Caracter que representa el inicio de la expresión regular.
- $.- Caracter que representa el final de la expresión regular.
- *.- Caracter que representa cero o más ocurrencias de la expresión
- +.- Caracter que representa una o más ocurrencias de la expresión.
- {n}.-Representa n veces de una expresión.
- [ ] .- Representa un conjunto de caracteres, por ejemplo: [a-z] representa las letras del abecedario de la a a la z.


## ¿Cómo usar las sentencias if, else if, else?

```sh
if [ condition ]; then
    statement 1
elif [ condition ]; then
    statement 2
else
    statement 3
fi
```

La condición usa operadores lógicos y operadores condicionales.

## ¿Cómo usar sentencias if anidadas?

```sh
if [ condition ]; then
    if [ condition ]; then
        statement 1
    else
        statement 2
else 
    statement 3
fi
```
## ¿Cómo usar la sentencia case?

```sh
case expression in
opcion1)
    statement 1;;
opcion2)
    statement 2;;
esac
```

## ¿Cómo usar arreglos?

- Una variable con varios elementos.
- Para crear un arreglo se debe colocar los elementos dentoro de paréntesis con cada elemento separado por espacio o coma según el tipo de dato, o usar rangos.
- El índice de un arreglo comienza en 0.
- Para remover los elementos de un arreglo se usa el comando `sh unset arreglo[posocion]`


## ¿Cómo usar la sentencia for loop?

Se puede iterar un array, también se soporta la expresión.

```sh
for var in item1 item2 ...itemN
do
    statement1
    statement2
    ...
    statementN
done
```

## ¿Cómo se realizan los loops anidados?

```sh
for var in item1 item2 ...itemN
do
    for var2 in [A..Z]
    do
    statement1
    ...
    statementN
    done
done
```

## break y continue

Igual a la funcionalidad en Python.

- Usar la sentencia break para salir de la ejecución de los loops for, while (es decir para la iteración).
- Usar la sentencia continue para saltar a la siguiente iteración.
