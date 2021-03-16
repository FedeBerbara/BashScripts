#!/bin/bash

###############################
## Federico Martin Berbara
## 13/12/2020
## Script SHELL
###############################

## Varialbes
BIN=/opt/bin
MAINDIR=/home

## Funciones 
exportFunction() {
	chmod -R 755 $1
	echo "export PATH=$PATH:$1" | sudo tee -a /etc/profile
	source $HOME/.bashrc
}

scriptBasico(){
	echo "
#!/bin/bash
echo 'Hello World' " >> $1/$2/$3/$4.sh
}

updateFunction() {
	cp $1/$2/$3/* $4
	chmod 755 $4 -R
}

## Chequeo que el usuario sea root
if [ "$EUID" -ne 0 ]; then 
	echo "Ey ! Necesitas ser root o tener permisos de sudo para ejecutar este script"
	exit 1
fi

## Breve explicacion del script
echo ""
echo "Este script creara un directorio donde almacenara scripts que podran ejecutar todos los usuarios como si fuese un comando del sistema" 
sleep 1
echo ""

## Consulto si desea continuar	
while true 
do 
	read -p "Desea continuar? [s/n]: " ANS
	case $ANS in 
		[sS])
			mkdir -p $BIN
			echo "Se le solicitara a continuacion el nombre de un directorio donde almacenara los scripts"
			sleep 2
			echo "Por defecto, se crearan a partir de su directorio /home en adelante"
			sleep 2
			echo ""
			read -p "Ingrese su nombre de usuario como se encuentra en el sistema. Sin / : " USR 
			read -p "Indique el nombre para el directorio. Sin / : " NWDIR
		        if [ -d $MAINDIR/$USR/$NWDIR ]; then
				echo ""
				echo "El directorio ya existe"
				echo "Chequeando que existan ficheros dentro del mismo.."
				sleep 1
				ls -l $MAINDIR/$USR/$NWDIR
				echo ""
				read -p "El directorio $NWDIR contiene ficheros dentro? [s/n] : " ANS
				if [[ $ANS == "s" || $ANS == "S" ]]; then	
					cp $MAINDIR/$USR/$NWDIR/* $BIN
					exportFunction "$BIN"
					echo "A finalizado!"
				        exit 0	
				else 
					echo "No se puede continuar si el directorio esta vacio"
					read -p "Desea agregar un fichero basico? [s/n]:  " RES
					if [[ $RES == "s" || $RES == "S" ]]; then
						echo ""
						read -p "Indique nombre del fichero: " NWFICHERO
						echo "Creando fichero..."
						sleep 1
					        scriptBasico "$MAINDIR" "$USR" "$NWDIR" "$NWFICHERO"	
						echo "Copiando Archivos..."
						sleep 1 
						cp $MAINDIR/$USR/$NWDIR/* $BIN
						exportFunction "$BIN"
						echo "A finalizado"
						exit 0
					else 
						echo ""
						echo "No podra continuar sin crear un fichero"
						echo "Saliendo..."
						sleep 1
						exit 0
					fi
				fi
			else 
				echo ""
				echo "El directorio no existe, lo crearemos"
			        read -p "Se creara con un script que diga HelloWorld, como desea llamarlo? : " FICHERO
				read -p "Desea continuar? [s/n] : " ANS
				case $ANS in 
					[sS])
						echo ""
						echo "Creando..."
						sleep 1
						mkdir $MAINDIR/$USR/$NWDIR
						echo "Directorio creado"
						echo "Creando Script..."
						sleep 1
						scriptBasico "$MAINDIR" "$USR" "$NWDIR" "$FICHERO"
						echo "Copiando Archivos..."
						sleep 1
						cp $MAINDIR/$USR/$NWDIR/* $BIN
						exportFunction "$BIN"
						echo "A finalizado!"
						exit 0
						;;

					[nN])
						echo ""
						echo "Saliendo..."
						sleep 1
						exit 0
						;;

					*) 
						echo ""
						echo "Debes indicar una respuesta"
						;;

				esac 
			fi
			;;	
		[nN])
			echo ""
			echo "Saliendo.."
			sleep 1
			break;;

		*) 
			echo ""
			echo "¡Necesito una respuesta!"
			echo ""
			;;
	esac
done 
exit  
