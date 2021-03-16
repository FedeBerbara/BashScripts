#!/bin/bash

## Federico Martin Berbara
## Written 13-10-2020, Modificado 10/11/2020
## Este script realizara una simple validacion de directorios.

read -p "Ingrese la ruta del directorio que se desea validar. (Para rutas absolutas '/' y para relativas './' o '../':  " RUTA

# Variable
COMPARADOR=$( echo $RUTA | cut -c 1-3 )

# Validacion de Ruta
if [[ $COMPARADOR == .* ]] || [[ $COMPARADOR == /* ]]; then
	        echo ""
		echo "La ruta es correcta"
	else
		echo "La ruta no es correca"
fi
