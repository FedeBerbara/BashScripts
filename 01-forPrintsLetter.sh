#!/bin/bash

## Federico Berbara
## 12/11/20202
## Este script fue resultado de una prueba en clase para imprimir caracteres one by one. 
## Recorre cada caracter de una variable y va sumando para terminar de formar la oracion

MITEXTO='Esta es mi oracion que se imprime de a un caracter'

for (( i=0; i<${#MITEXTO}; i++)); do 
	echo -n "${MITEXTO:$i:1}"
	sleep 0.08s
done
echo ""
