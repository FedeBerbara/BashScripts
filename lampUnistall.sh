#!/bin/bash 

# ************************************************************
# Uninstall of Stack LAMP (Linux, Apache 2, MariaDB, PHP)
# Date: 15/09/2020
# Written by Federico Berbara
# ************************************************************

echo ""
echo "Durante ese script realizaremos la desinstalacion de un Stack LAMP" 
echo "" 

#Stop de servicios 
echo "-----------------------------------------------------"
echo "***Se le dara stop al servicio de Apache y MariaDB***"
echo "-----------------------------------------------------"
sudo service apache2 stop && sudo service mariadb stop
echo "" 

#Pregunto al usuario si desea desinstalar Apache
while true
do
read -p "Desea eliminar Apache del sistema? [y/n]: " RESPUESTA
case $RESPUESTA in
        [yY]* ) echo "------------------------"
                echo "***Eliminando Apache2***"
                echo "------------------------"
                sudo apt-get remove apache2 -y
		
		#Paquetes dependientes
		echo "-------------------------------------"
		echo "***Eliminando paquetes adicionales***"
		echo "-------------------------------------"
		sudo apt-get autoremove apache2 -y

		#Purgamos
		echo "------------------------"
		echo "***Purgando Apache2..***"
		echo "------------------------"
		sudo apt-get purge apache2 apache2-utils -y
                break;;

        [nN]* ) break;;

        * )     echo "Por favor, ingrese Y o N.";;
esac
done

echo ""
echo "Se elimino apache exitosamente, al finalizar el script se le daran indicaciones de como proseguir"
echo ""

#Pregunto al usuario si desea desinstalar MariaDB
while true
do
read -p "Desea eliminar MariaDB del sistema? [y/n]: " RESPUESTA
case $RESPUESTA in
        [yY]* ) echo "------------------------"
                echo "***Eliminando MariaDB***"
                echo "------------------------"
                sudo apt-get remove mariadb-server -y
		
		#Paquetes dependientes 
		echo "-------------------------------------"
		echo "***Eliminando paquetes adicionales***"
		echo "-------------------------------------"
		sudo apt-get autoremove mariadb-server

		#Purgamos
		echo "------------------------"
		echo "***Purgando MariaDB..***"
		echo "------------------------"
		sudo apt-get purge mariadb-server -y
                break;;

        [nN]* ) break;;

        * )     echo "Por favor, ingrese Y o N.";;
esac
done

echo ""
#Pregunto al usuario si desea desinstalar PHP 
while true
do
read -p "Desea eliminar PHP del sistema? [y/n]: " RESPUESTA
case $RESPUESTA in
        [yY]* ) echo "--------------------"
                echo "***Eliminando PHP***"
                echo "--------------------"
                sudo apt-get remove php libapache2-mod-php php-mysql -y
		
		#Paquetes dependientes 
		echo "-------------------------------------"
		echo "***Eliminando paquetes adicionales***"
		echo "-------------------------------------"
		sudo apt-get autoremove php libapache2-mod-php php-mysql

                #Purgamos
                echo "------------------"
                echo "***Purgando PHP***"
                echo "------------------"
                sudo apt-get purge php libapache2-mod-php php-mysql

                break;;

        [nN]* ) break;;

        * )     echo "Por favor, ingrese Y o N.";;
esac
done
echo ""

echo "Se recomienda verificar con (whereis xxxx) si quedo algun archivo adicional y reiniciar"
echo "Ha finalizado, gracias" 
