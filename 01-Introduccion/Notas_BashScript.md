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

