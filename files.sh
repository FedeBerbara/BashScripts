#!/bin/bash 

#Lo primero que hara el script, es limpiar la pantalla
clear

#Empezamos creando un directorio 
read -p "Indique el nombre del directorio que desea crear: " DIR 
echo "" 

#Llamo a la variable que va a crear el directorio
mkdir -p /home/$USER/$DIR
echo "" 

#Devuelvo el resultado del directorio que creamos 
echo "Se ha el directorio llamado:" $DIR
echo "" 

#Ahora creamos un archivo 
read -p "Indique el nombre del fichero que desea crear: " FILE
echo ""

#Llamo a la variable
touch /home/$USER/$DIR/$FILE 

#Devuelvo resultado
echo "Se creo el fichero llamado: " $FILE 
echo ""

echo "Si desea asignar un permiso a al directorio $DIR,  presione enter, de lo contrario CRTL + C para finalizar" 
read

#Asignacion de permisos para los directorios 
echo "Se precisa que se le indique que permisos desea que tenga el directorio"
read -p "Permisos para Usuario (Numerico)  : " UP
read -p "Permisos para Grupo (Numerico) : " GP
read -p "Permisos para Otros (Numerico) : " OP

chmod $UP$GP$OP /home/$USER/$DIR

echo ""
#Ofrezco al usuario la opcion de asignar permisos a o los ficheros creados 
echo "Modifico los permisos del directorio con exito, si desea asignarle algun permiso al fichero $FILE, presione enter, de lo contrario CRTL + C para finalizar"
echo ""
read 

echo ""
echo "Se precisa que se le indique que permisos desea que tenga el fichero"
read -p "Permisos para Usuario (Numerico) : " UP
read -p "Permisos para Grupo (Numerico) : " GP
read -p "Permisos para Otros(Numerico) : " OP

chmod $UP$GP$OP /home/$USER/$DIR/$FILE

##Fin del Script
