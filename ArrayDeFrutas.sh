#!/bin/bash

#Declaro mi array

FRUTAS=(manzana naranja pera sandia) 

#Listo mi array 
echo "Mi array de frutas es: " 
echo ${FRUTAS[*]}
echo ""

#Voy a modificar naranja por kiwi y vuelvo a listar mi array

FRUTAS[1]=kiwi 

echo "Modifique una de mis frutas: "
echo ${FRUTAS[*]}
echo ""

#Ahora voy a agregar un elemento a mi array de frutas

FRUTAS[4]=pomelo 

echo "Agregue una fruta nueva a mi array: "
echo Ahora tengo 5 frutas: ${FRUTAS[*]}
echo ""

#Ahora voy a eliminar manzana 

unset 'FRUTAS[0]'

echo "Elimino una de mis frutas, entonces ahora tengo: "
echo ${FRUTAS[*]}
echo ""









