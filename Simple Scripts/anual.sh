#!/bin/bash

ANUAL=$(cal -y)

echo "Estas en el año: "
echo ""

echo "$ANUAL"

echo "" 

#Voy a intentar llamar a VARPRUEBA desde este script y en teoria no se va a poder ejecutar porque la tengo declarada en mi proceso padre, asi como tampoco mi variable ANUAL va a poder ejecutarse por mi proceso padre 

echo $VARPRUEBA

