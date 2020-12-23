#!/bin/bash

## Federico Martin Berbara
## 03/11/2020, Editado el 17/11/2020
## En este script vamos a hacer un juego de trivia usando While para dar comienzo
## condicionales para validar las respuestas y bucle for para la impresion de caracteres. 

#Instrucciones del juego
clear
echo "Bienvenido a mi Linux Trivia!!! Vamos a ver que tanto sabes de Linux :D"
sleep 2s
echo "Como funciona el juego ?"
sleep 2s
echo "" 
echo "* Vas a tener una serie de 6 preguntas"
sleep 2s
echo "* Todas las preguntas se responden con [v]erdadero o [f]also. Usa la letra adecuada"
sleep 2s
echo ""

#Pregunto si desea jugar. 
while true
do
	read -p "Jugamos? [s/n]: " OP
        case $OP in 
		[sS])  echo ""
		       echo "Excelente ! Empezemos :)"
		       echo ""

		       #Pregunta 1
		       PREGUNTA1='Pregunta 1: Linus Torvalds, creo el nucleo de Linux en 1991? [v/f]?'
		       for (( i=0; i<${#PREGUNTA1}; i++ ));
		       do
				echo -n "${PREGUNTA1:$i:1}"
				sleep 0.08s
		       done
		       sleep 1s
		       echo ""
		       read -n1 RES
                       if [[ $RES == "v" || $RES == "V" ]]; then
			        echo "erdadero"
        			sleep 1s
				echo ""
        			echo "Es correcta! Muy bien."
        			echo ""
		       else
        			echo "also"
        			sleep 1s
				echo ""
        			echo "Que mal, es incorrecto."
				echo ""
		       fi

		       #Pregunta 2
                       PREGUNTA2='Pregunta 2: Fedora, es una distribucion basada en Debian? [v/f]?'
                       for (( i=0; i<${#PREGUNTA2}; i++ ));
                       do
                                echo -n "${PREGUNTA2:$i:1}"
                                sleep 0.08s
                       done
                       sleep 1s
                       echo ""
                       read -n1 RES
                       if [[ $RES == "f" || $RES == "F" ]]; then
                                echo "also"
                                sleep 1s
				echo ""
                                echo "Bien ! Fedora es una distribucion basada en RedHat."
                                echo ""
                       else
                                echo "erdadero"
                                sleep 1s
				echo ""
                                echo "Que pena, Fedora no es una distribucion de Debian."
				echo ""
                       fi

		       #Pregunta 3
                       PREGUNTA3='Pregunta 3: Arch Linux, es una distribucion basada en RedHat? [v/f]?'
                       for (( i=0; i<${#PREGUNTA3}; i++ ));
                       do
                                echo -n "${PREGUNTA3:$i:1}"
                                sleep 0.08s
                       done
                       sleep 1s
                       echo ""
                       read -n1 RES
                       if [[ $RES == "f" || $RES == "F" ]]; then
                                echo "also"
                                sleep 1s
				echo ""
                                echo "$USER, punto para vos. Arch Linux no encaja en distos Debian/RedHat"
                                echo ""
                       else
                                echo "erdadero"
                                sleep 1s
				echo ""
                                echo "Estas seguro de tu respuesta? Deberias investigar al respecto."
				echo ""
                       fi

                       #Pregunta 4
                       PREGUNTA4='Pregunta 4: En VIM para guardar y salir, debo introducir :wq ? [v/f]?'
                       for (( i=0; i<${#PREGUNTA4}; i++ ));
                       do
                                echo -n "${PREGUNTA4:$i:1}"
                                sleep 0.08s
                       done
                       sleep 1s
                       echo ""
                       read -n1 RES
                       if [[ $RES == "v" || $RES == "V" ]]; then
                                echo "erdadero"
                                sleep 1s
				echo ""
                                echo "Acertaste ! Estas en llamas !"
                                echo ""
                       else
                                echo "also"
                                sleep 1s
				echo ""
                                echo "Incorrecto :("
				echo ""
                       fi

		       #Pregunta 5
		       echo "$USER, vamos a complicarla un poquito mas." 
		       read -p "Si queres continuar, presiona ENTER de lo contrario CTRL + C para salir"
		       sleep 2s
		       echo ""
                       PREGUNTA5='Pregunta 5: Si en un comando, veo estos simbolos &&. Hago referencia a un operador "AND" logico ? [v/f]?'
                       for (( i=0; i<${#PREGUNTA5}; i++ ));
                       do
                                echo -n "${PREGUNTA5:$i:1}"
                                sleep 0.08s
                       done
                       sleep 1s
                       echo ""
                       read -n1 RES
                       if [[ $RES == "v" || $RES == "V" ]]; then
                                echo "erdadero"
                                sleep 1s
                                echo ""
                                echo "Acertaste ! Veo que te gusta mucho Linux !"
                                echo ""
                       else
                                echo "also"
                                sleep 1s
                                echo ""
                                echo "Segui participando"
                                echo ""
                       fi

		       #Pregunta 6
		       echo "Ultima pregunta!!"
		       read -p "Estas preparado ? (Presiona ENTER para continuar)"
		       echo ""
		       sleep 2s
                       PREGUNTA6='Pregunta 6: Tengo el numero 1756.Y uso de REGEX "[1][0-9][0-9][0-9]" voy a ver el numero en el output ? [v/f]?'
                       for (( i=0; i<${#PREGUNTA6}; i++ ));
                       do
                                echo -n "${PREGUNTA6:$i:1}"
                                sleep 0.08s
                       done
                       sleep 1s
                       echo ""
                       read -n1 RES
                       if [[ $RES == "v" || $RES == "V" ]]; then
                                echo "erdadero"
                                sleep 1s
                                echo ""
                                echo "Acertaste $USER ! Sos todo un Linux Master !"
                                echo ""
                       else
                                echo "also"
                                sleep 1s
                                echo ""
                                echo "Casi...pero no, mejor suerte para la proxima"
                                echo ""
                       fi



		       ANUNCIO="Gracias por jugar, espero que te hayas divertido."
		       for ((  i=0; i<${#ANUNCIO}; i++ ));
                       do
          			echo -n "${ANUNCIO:$i:1}"
				sleep 0.06s
		       done
		       echo ""
		       break;;

		[nN])  echo ""
		       echo "Que pena! La proxima sera"
		       sleep 1s
		       echo "Saliendo.."
		       break;; 

		  *)   echo ""
		       echo "No tan rapido ! Necesito una respuesta"
		       echo "";;

		esac 
	done 
exit 
