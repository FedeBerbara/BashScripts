#!/bin/bash

## Script to automate Virtual Host creation with basic structure
## Date: 20/10/2020
## Written by Federico Berbara

echo "---------------------------------------"
echo "Creacion de VHost virtuales con Apache2"
echo "-----Creado por Federico Berbara-------"
echo "---------------------------------------"

#Defino variables globales que usare en el script
LOGS=/var/log/apache2
ROUTE=/var/www
RUTA=/etc/apache2/sites-available

echo "Durante este script, primero creara un Virtual Host"
echo "Luego se dejara creada un HTML basico para su prueba" 

#Chequeo si el usuario es root de lo contrario, que utilize sudo 
if [ "$EUID" -ne 0 ]; then 
	echo "Debes ser root para ejecutar este script o utilizar sudo"
	exit 1;
fi
echo "" 

#Creacion del directorio 
echo "Debera indicar el nombre del directorio para su sitio Web (El mismo se creara en /var/www)"
read -p "Indique el nombre (Por ejemplo: mipagina.net): " DIR 
echo ""

#Verifico el nombre del directorio con un IF
if ! mkdir $ROUTE/$DIR; then 
	echo "¡Atencion! Ya existe un directorio con ese nombre" 
else 
	echo "Directorio creado exitosamente"
fi
echo ""

#Le muestro al user que se creo el directorio
ls -l $ROUTE
echo "" 

#Creo el nombre del propietario y lo asigno al  directorio
read -p "Quien sera el propietario del directorio ? Indiquelo a continuacion: " OWNER 
chown $OWNER:$OWNER $ROUTE/$DIR
echo "" 

#Creo el fichero que contenera el directorio 
echo "Debe crear el fichero para su Vhost, luego podra editarlo" 
read -p "Indique su nombre a continuacion (Por ejemplo: 'index.html'): " FICHERO
touch $ROUTE/$DIR/$FICHERO
echo ""

# Le cambio el propietario al fichero 
echo "Se le asigno al fichero el mismo propietario del directorio" 
chown $OWNER:$OWNER $ROUTE/$DIR/ -R
clear 

#Creacion de archivo vhost
echo "Se comenzara a crear el Vhost..." 
touch $RUTA/$DIR.conf

#Edicion del archivo de configuracion
echo " 
<VirtualHost *:80>
ServerName $DIR 

ServerAdmin webmaster@localhost
DocumentRoot $ROUTE/$DIR

ErrorLog $LOGS/error.log
CustomLog $LOGS/access.log combined

</VirtualHost>" >> $RUTA/$DIR.conf
echo ""

#Creacion del enlace simbolico
echo "Se realizo el enlace simbolico hacia el  directorio sites-enabled" 
ln -s $RUTA/$DIR.conf /etc/apache2/sites-enabled/$DIR.conf
echo ""

#Muestro que se realizo con exito 
ls -l /etc/apache2/sites-enabled
echo ""

#Armo la etiqueta basica de HTML
while true
do
read -p "Debe editar el $FICHERO, desea agregarle el etiquetado basico? [y/n]: " RESPUESTA
case $RESPUESTA in 
	[yY]* ) echo "-------------"
		echo "**Creando..**"
		echo "-------------"
echo "
<!DOCTYPE HTML>
<head>
	<meta charset="utf-8">
	<title>Bienvenido a su Pagina</title>
</head>
<body>
	<h1>Hola Mundo!</h1>
</body>
</html>" >> $ROUTE/$DIR/$FICHERO
break;;

	[nN]* ) echo "--------------------------"
		echo "Debera crearlo manualmente"
		echo "--------------------------"
		break;;
	
	* ) 	echo "Por favor, ingrese Y o N.";;
esac
done

#Le indico que reinicie apache
while true
do
read -p "Debe recargar servidor apache, desea realizarlo ? [y/n]: " RESPUESTA
case $RESPUESTA in
        [yY]* ) echo "---------------------"
                echo "***Recargando.....***"
                echo "---------------------"
                systemctl reload apache2
                break;;

        [nN]* ) echo "----------------------------------------------------------"
                echo "Su Vhost no estara activa hasta que se recarge el servidor"
                echo "----------------------------------------------------------"
                break;;

        * )     echo "Por favor, ingrese Y o N.";;
esac
done 

echo "Ha creado su VHost exitosamente, gracias"
