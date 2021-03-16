#!/bin/bash

# Federico Martin Berbara
# Written 19/11/2020
# Este script lo asistira en la creacion/configuracion de dockerfiles

DOCKER=dockerfile

echo "Bienvenido al asistente de configuracion de Dockerfiles"
echo "Este script lo ayudara a configurar un Dockerfile de 0"
echo "Verificando existencia de fichero $DOCKER..."
sleep 1
if [ -f "$DOCKER" ]; then
	echo "Se encontro un fichero $DOCKER"
else 
	read -p "No se encontro ningun fichero $DOCKER, desea crearlo [y/n]? : " OPTION 
	if [[ $OPTION == "y" || $OPTION == "Y" ]]; then
		echo "Creando dockerfile..."
echo "
FROM
COPY
RUN
CMD" >> $DOCKER
		sleep 1
		echo ""
	else 
		"No se creara ningun $DOCKER"
	fi
fi
echo ""
echo "Listando contenido de su $DOCKER"
cat $DOCKER
echo ""
echo "Menu: "
echo "1) Desea cambiar la imagen ?" 
echo "2) Desea configurar como iniciara su contenedor ?"
echo ""
read -p "Indique la accion a realizar: " OP
echo ""
case $OP in
		1)
			read -p "Que imagen pondra en su contenedor? (Por ejemplo node:latest): " RES
			echo "Actualizando..."
			sed -i "s/FROM/FROM ${RES}/" $DOCKER
			sleep 1
			echo "Dockerfile actualizado"
		;;

     	       2)
		        echo "Recuerde que esta accion modificara el directorio donde se realizara el build"
			read -p "Indique el directorio de su app con /: " RESPONSE
			read -p "Indique el comando con cual iniciara su contenedor (Por ejemplo, node): " RESP
			read -p "Por ultimo, indique el fichero (Por ejemplo, app.js): " FICHERO
			echo "Actualizando COPY...." 
			sed -i "s/COPY/COPY . \\${RESPONSE}/" $DOCKER 
			sleep 1
			echo "Actualizando RUN...."
			sed -i "s/RUN/RUN make \\${RESPONSE}/" $DOCKER 
			sleep 1
			echo "Actualizando CMD...."
			sed -i "s/CMD/CMD ${RESP} \\${RESPONSE}\/${FICHERO}/" $DOCKER
			echo "Dockerfile actualizado"
			echo "Saliendo...."
			exit 0
		;;

		*)
			echo ""
		;;
esac
