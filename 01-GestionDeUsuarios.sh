#!/bin/bash 

#####################################
## Federico Martin Berbara
## 12/12/2020
## Script for User Managment
#####################################

# Chequeo si el usuario es root
if [ "$EUID" -ne 0 ]; then
	echo "Ey! Debes ser root o utilizar sudo para la ejecucion de este script"
	exit 1;
fi

# Funciones
shellTypes() {
	echo "/bin/bash"
	echo "/bin/sh"
	echo "/bin/tcsh"
	echo "/bin/csh"
	echo "/bin/rbash"
	echo "/bin/dash"
	echo "/bin/ksh"
	echo "/bin/zsh"
}

userValidation() {
	if grep $1 /etc/passwd; then 
		echo "Usuario validado"
		echo ""
	else 
		echo "Usuario no existente"
		echo ""
		exit 1
	fi
}

clear 
echo "--------Menu--------"
echo ""
echo "1) Informar Usuarios con GID 1000 o +"
echo "2) ABM de Usuarios"
echo "3) Cambiar Shell de un Usuario"
echo "4) Desactivar Login de un Usuario"
echo "5) Usuario con Login pero no podra ejecutar comandos"
echo "6) Salir"
echo ""
read -p "Elija su opcion: " OPCION
echo ""
case $OPCION in
	1)
		echo ""
		echo "Listando usuarios..."
		sleep 1
		awk -F: '$3 > 999' /etc/passwd
		echo ""
		;;

	2) while : 
		do 
		echo "-------Menu-------"
		echo "1) Crear nuevo Usuario"
		echo "2) Borrar un Usuario"
		echo ""
		read -p "Seleccione la tarea a realizar: " OPT
		echo ""
	        case $OPT in 
			1) 
				echo "El usuario se creara con /bin/bash como interprete por defecto"
				read -p "Indique nombre del usuario: " USRNAME
				echo "Creando..."
				sleep 1
				useradd -s /bin/bash -d /home/$USRNAME -m $USRNAME
				echo "Usuario creado"
				echo ""
				echo "Debe crearle una contraseña al nuevo usuario"
				read -p "Presione enter para crear una contraseña: "
				passwd $USRNAME
				break 
				;;
			
			2)
				echo ""
				read -p "Que usuario va a eliminar? " USRDEL
				userValidation "$USRDEL"
				echo "Eliminando usuario..."
				sleep 1
				userdel $USRDEL
				echo "Usuario eliminado con exito"
				break	
				;;
			
			*) 
				echo "Opcion no valida" 
				;;
		esac 
	done
	;;
	
	3)	
		echo ""
		read -p "A que usuario desea cambiar el Shell? " RES
		userValidation "$RES"
	       	echo "Mostrando shell actual.."
		sleep 1
		echo ""
		cat /etc/passwd | grep $RES | cut -d: -f7
		echo "" 
		echo "Se listaran tipos de Shell admitidos"
		sleep 1
	        echo ""
		shellTypes
		echo ""
		read -p "A que shell desea cambiar? (Escriba como se encuentra en el listado): " NWSHELL
	        echo "Cambiando..."
		sleep 1
		usermod -s $NWSHELL $RES
		echo "Chequeando cambios..."
		sleep 1
		cat /etc/passwd | grep $RES | cut -d: -f7	
		echo ""
		;;
	
	4)
		echo ""
		read -p "A que usuario no le permitira iniciar sesion? " USR
		userValidation "$USR"
		echo "Aplicando cambios..."
		usermod -s /sbin/nologin $USR
		sleep 1
		echo "Cambios aplicados"
		;;
	
	5)
		echo ""
		read -p "Que usuario no podra ejecutar comandos? " USR
		userValidation "$USR"
		echo "Aplicando cambios..."
		usermod -s /bin/rbash $USR
		sleep 1
		echo "Cambios aplicados"
		;;
	
	6) 
		echo "Gracias por utilizar este script"
		echo "Saliendo..."
		sleep 1
		exit
		;;
esac
