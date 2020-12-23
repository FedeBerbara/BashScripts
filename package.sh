#!/bin/bash 

# ---------------------------------------
# Script for package administration
# Date: 20/10/2020
# Written by Federico Berbara
# ---------------------------------------

##Actualizamos el sistema y repo local
echo "-------------------------------------------------"
echo "Se actualizara repo local y SO antes de continuar"
echo "-------------------------------------------------"
sudo apt-get update -y && sudo apt-get upgrade
echo "" 

#Realizo autoremove y autoclean 
echo "--------------------------------------"
echo "Se esta finaliando de actualizar el SO"
echo "--------------------------------------"
sudo apt autoremove && sudo apt-get autoclean

#Limpio la pantalla 
clear 
echo "A continuacion se le mostrara una lista de los paquetes instalados actualmente"
sleep 2

#Le muestro al usuario los paquetes instalados 
sudo apt list --installed | more 

#Consulto como continuar
echo "------------------------------------------------"
read -p "Su paquete se encuentra en la lista ? [y/n]: " RESPUESTA
echo "------------------------------------------------"

if [ $RESPUESTA == y ];
then 
	echo "Gracias por utilizar este script"
else 
	echo "---------------------------------------------"
	read -p "Escriba el nombre del paquete a instalar: " PAQUETE 
	echo "---------------------------------------------"
	sudo apt-get install $PAQUETE
fi

#Consuto si desea eliminar algun paquete
echo "-----------------------------------------"
read -p "Desea eliminar algun paquete ? [y/n]: " OPCION
echo "-----------------------------------------"

if [ $OPCION == y ];
then 
	echo "---------------------------------------------"
	read -p "Indique nombre del paquete a desisntalar: " PAQUETE
	echo "---------------------------------------------"
	sudo apt-get --purge remove $PAQUETE
	echo "" 
	echo "Gracias por utilizar este script"
else 
	echo "Gracias por utilizar este script"
fi

exit 0
