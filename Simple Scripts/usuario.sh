#!/bin/bash

#Declare una variable usuario que imprime el usuario de la sesion en consola. En su primer instancia la variable usuario tenia que ser ejecutada por el script.sh. Lo cual no funciona ya que no es una variable exportada. 

export USUARIO=$USER

# Luego de usar export, convierto a mi variable en una global y puede ser ejecutada por mi proceso hijo (imprimir.sh) por ende cuando yo llame a mi script usuario, imprimir va a devolverme la variable declarada
echo""

echo "El usuario de esta PC es: "

./imprimir.sh
