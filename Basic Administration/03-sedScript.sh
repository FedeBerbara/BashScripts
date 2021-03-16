#!/bin/bash

## Federico Martin Berbara
## Written 18/11/2020
## Este script brindara opciones para modificar archivos de configuracion del fichero SSH

FILE=/etc/ssh/sshd_config

clear
echo "--------Menu--------"
echo ""
echo "1) Eliminar lineas con #"
echo "2) Negar X11Forwarding"
echo "3) Agregar un espacio a cada caracter"
echo "4) Cambiar puerto por defecto"
echo "5) Eliminar espacios en blanco"
echo ""
read -p "Elija su opcion: " OPTION
echo ""
case $OPTION in 
	1)
		read -p "Esta seguro que desea continuar? [y/n]: " RES
                if [[ $RES == "y" || $RES == "Y" ]]; then
                        echo ""
                        echo "Actualizando..."
                        sed -i "/^#/d" $FILE
                        sleep 1s
                        echo "Fichero actualizado"
                else
                        echo ""
                        echo "No se realizara ninguna accion"
                fi
		;;

	2)
		read -p "Esta seguro que desea continuar? [y/n]: " RES
                if [[ $RES == "y" || $RES == "Y" ]]; then
                        echo ""
                        echo "Actualizando..."
                        sed -i "s/X11Forwarding yes/X11Forwarding no/" $FILE
                        sleep 1s
                        echo "Fichero actualizado"
                else
                        echo ""
                        echo "No se realizara ninguna accion"
                fi
		;;

	3)
		read -p "Esta seguro que desea continuar? [y/n]: " RES
                if [[ $RES == "y" || $RES == "Y" ]]; then
                        echo ""
                        echo "Actualizando..."
                        sed -i "s/ */ /g" $FILE
                        sleep 1s
                        echo "Fichero actualizado"
                else
                        echo ""
                        echo "No se realizara ninguna accion"
                fi
		;;

	4)
		read -p "Esta seguro que desea continuar? [y/n]: " RES
                if [[ $RES == "y" || $RES == "Y" ]]; then
                        echo ""
			echo "Recuerde que SSH funciona en el puerto 22"
			sleep 1s
			read -p "Indique numero de puerto (Por ejemplo, 456): " OP
                        echo "Actualizando..."
                        sed -i "s/#Port 22/Port ${OP}/" $FILE
                        sleep 1s
                        echo "Fichero actualizado"
                else
                        echo ""
                        echo "No se realizara ninguna accion"
                fi
		;;

	5)
		read -p "¡Atencion! Esta ejecucion dejara el fichero vacio,desea continuar? [y/n]: " RES
                if [[ $RES == "y" || $RES == "Y" ]]; then
                        echo ""
                        echo "Actualizando..."
                        sed -i '/\s/d' $FILE
                        sleep 1
                        echo "Fichero actualizado"
                else
                        echo ""
                        echo "No se realizara ninguna accion"
                fi
                ;;

	*)
		;;
esac
