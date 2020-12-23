#!/bin/bash

# ***************************************************
# Deploy de LAMP Stack (Linux, Apache, MariaDB, PHP)
# Date: 15/09/2020
# Written by por Federico Berbara
# ***************************************************

echo ""
echo "Durante ese script realizaremos la instalacion de un Stack LAMP" 
echo "" 

#Actualizacion de repositorios
echo "---------------------------------------"
echo "***Se actualiza repo local y sistema***"
echo "---------------------------------------"
sudo apt-get update -y && sudo apt-get upgrade -y

echo ""
#Pregunto al usuario si desea instalar Apache
while true
do
read -p "Desea instalar Apache? [y/n]: " RESPUESTA
case $RESPUESTA in
	[yY]* ) echo "------------------------"
		echo "***Instalado  Apache2***"
		echo "------------------------"
		sudo apt-get install apache2 -y >> logs.txt
		break;;

	[nN]* ) break;;

	* ) 	echo "Por favor, ingrese Y o N.";;
esac
done

echo ""
#Pregunto al usuario si desea instalar MariaDB 
while true
do
read -p "Desea instalar MariaDB? [y/n]: " RESPUESTA
case $RESPUESTA in
	[yY]* ) echo "------------------------"
		echo "***Instalando MariaDB***"
		echo "------------------------"
		sudo apt-get install mariadb-server -y >> logs.txt
		break;;

	[nN]* ) break;;

	* )	echo "Por favor, ingrese Y o N.";;
esac
done

echo ""
#Pregunto al usuario si quiere instalar PHP 
while true
do
read -p "Desea instalar servidor PHP? [y/n]: " RESPUESTA
case $RESPUESTA in
	[yY]* ) echo "--------------------"
		echo "***Instalando PHP***"
		echo "--------------------"
		sudo apt-get install php libapache2-mod-php php-mysql -y >> logs.txt

		#Creamos archivos de prueba para PHP
		echo "------------------------------------------------------"
		echo "***Creando test de prueba para validar servidor PHP***"
		echo "------------------------------------------------------"
		sudo echo "<?php phpinfo(); ?>" > /var/www/html/info.php

		break;;

	[nN]* ) break;;

	* )	echo "Por favor, ingrese Y o N.";;
esac
done

echo ""
#Recomiendo reiniciar el servidor 
while true
do
read -p "Se recomienda reinciar Apache y MariaDB antes de probarlo, seleccione Y para realizarlo [y/n]: " RESPUESTA
case $RESPUESTA in
        [yY]* ) echo "---------------------"
                echo "***Reiniciando....***"
                echo "---------------------"
                sudo service apache2 reload
		sudo service mariadb reload
                break;;

        [nN]* ) break;;

        * )     echo "Por favor, ingrese Y o N.";;
esac
done

echo ""
#Pregunto al usuario si quiere iniciar Apache al encender la computadora 
while true
do
read -p "Desea que el servidor apache inicie con el sistema? [y/n]: " RESPUESTA
case $RESPUESTA in
        [yY]* ) echo "---------------------"
                echo "***Configurando...***"
                echo "---------------------"
                sudo systemctl enable apache2 
                break;;

        [nN]* ) echo "---------------------"
		echo "***Configurando...***"
		echo "---------------------"
		sudo systemctl disable apache2
		break;;

        * )     echo "Por favor, ingrese Y o N.";;
esac
done

echo ""
#Modifico los permisos para el owner 
echo "Se le otorgaron todos los permisos al owner hacia el directorio html" 
sudo chmod 755 /var/www/html
echo ""

echo ""
#Detalles finales 
echo "A terminado la configuracion del LAMP"
echo "" 
echo "Para realizar el test, ingrese al navegador con su IP/info.php. Si no conoce su ip, al salir ingrese ip a y podra ver la misma. Su URL deberia quedar algo asi (ejemplo): 192.168.100.87/info.php" 
echo "Gracias !"
echo ""
