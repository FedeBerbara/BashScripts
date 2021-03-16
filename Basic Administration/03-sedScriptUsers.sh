#!/bin/bash

## Federico Martin Berbara
## Written 18/11/2020
## Este script brindara opciones para modificar archivos de configuracion en el fichero adduser

FILE=/etc/adduser.conf

clear
echo "--------Menu--------"
echo ""
echo "1) Eliminar lineas con #"
echo "2) Cambiar interprete por defecto"
echo "3) Cambiar valor de FIRST_UID"
echo "4) Agregar un espacio a cada caracter"
echo "5) Negar USERGROUPS"
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
			echo "Gracias"
		fi
		;;

	2)
		echo "¡Atencion! Esta accion puede causar algunas fallas en el sistema"
		read -p "Esta seguro que desea continuar? [y/n]: " RES
		if [[ $RES == "y" || $RES == "Y" ]]; then
			echo ""
                        echo "Listando shell actual.."
			cat $FILE | grep DSHELL
			sleep 1s
			echo ""
			echo "El /bin se encuentra agregado por defecto en el comando, por lo cual no sea util para el interprete /sbin/nologin"
			sleep 1s
			read -p "Indique el interprete actual (No olvide usar / ): " VAL
			read -p "A que interprete cambiara? (Por ejemplo /sh /tcsh): " RES
                        echo "Actualizando..."
                        sed -i "s/DSHELL=\/bin\\${VAL}/DSHELL=\/bin\\${RES}/" $FILE
                        sleep 1s
                        echo "Fichero actualizado"
                else
                        echo ""
                        echo "No se realizara ninguna accion"
                        echo "Gracias"
                fi
		;;

	3)
		read -p "Esta seguro que desea continuar? [y/n]: " RES
                if [[ $RES == "y" || $RES == "Y" ]]; then
                        echo ""
			echo "Se le mostrara el valor actual de FIRST_UID"
			sleep 1s 
			cat $FILE | grep FIRST_UID
			echo ""
			read -p "Ingrese el valor actual (En formato numero): " VAL1
			read -p "Indique el valor deseado (En formato numero, por ejemplo, 1500): " VAL2
                        echo "Actualizando..."
                        sed -i "s/FIRST_UID=${VAL1}/FIRST_UID=${VAL2}/" $FILE
                        sleep 1
                        echo "Fichero actualizado"
                else
                        echo ""
                        echo "No se realizara ninguna accion"
                        echo "Gracias"
                fi	
		;;

	4)
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
			echo "Gracias"
                fi
                ;;

	5)
		read -p "Esta seguro que desea continuar? [y/n]: " RES
		if [[ $RES == "y" || $RES == "Y" ]]; then
			echo "" 
			echo "Actualizando..."
			sed -i 's/USERGROUPS=yes/USERGROUPS=no/' $FILE
			sleep 1s
			echo "Fichero actualizado"
		else 
			echo ""
			echo "No se realizara ninguna accion"
			echo "Gracias"
		fi
		;;

	*)
		echo ""
		;;
esac
