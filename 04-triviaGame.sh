#!/bin/bash

#######################################################################
## Federico Martin Berbara
## Written 03/11/2020 
## Modify 17/11/2020
## Second Modify 15/12/2020
## Little trivia game of Linux using functions, conditionals and loops 
#######################################################################

## Instrucciones del juego
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
echo "* Para ganar, deberas responder todas las preguntas correctamente"
echo ""

## Funciones 
isWinner() {
	if [[ $1 == "v" || $1 == "V" ]] && [[ $2 == "f" || $2 == "F" ]] && [[ $3 == "f" || $3 == "F" ]] && [[ $4 == "v" || $4 == "V" ]] && [[ $5 == "v" || $5 == "V" ]] && [[ $6 == "v" || $6 == "V" ]] ;
	then
		echo "Felicitaciones, ganaste el juego!!"
		sleep 1s
	else 
		echo "Una lastima $USER , quizas la proxima te vaya mejor"
		sleep 1s
	fi
}

printsPreguntas() {
	for (( i=0; i<${#1}; i++ ));
        do
                echo -n "${1:$i:1}"
                sleep 0.08s
        done
        sleep 1
        echo ""
}

## Pregunto si desea jugar. 
while true
do
	read -p "Jugamos? [s/n]: " OP
        case $OP in 
		[sS])  echo ""
		       echo "Excelente ! Empezemos :)"
		       echo ""

		       #Pregunta 1
		       PREGUNTA1='Pregunta 1: Linus Torvalds, creo el nucleo de Linux en 1991? [v/f]?'
		       printsPreguntas "$PREGUNTA1"
		       read -n1 RES1
                       if [[ $RES1 == "v" || $RES1 == "V" ]]; then
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
                       printsPreguntas "$PREGUNTA2"
		       read -n1 RES2
                       if [[ $RES2 == "f" || $RES2 == "F" ]]; then
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
                       printsPreguntas "$PREGUNTA3"
		       read -n1 RES3
                       if [[ $RES3 == "f" || $RES3 == "F" ]]; then
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
                       printsPreguntas "$PREGUNTA4"
		       read -n1 RES4
                       if [[ $RES4 == "v" || $RES4 == "V" ]]; then
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
                       PREGUNTA5='Pregunta 5: Si en un comando, veo estos simbolos &&. Hago referencia a un operador "AND" logico ? [v/f]?'
                       printsPreguntas "$PREGUNTA5"
		       read -n1 RES5
                       if [[ $RES5 == "v" || $RES5 == "V" ]]; then
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
                       printsPreguntas "$PREGUNTA6"
		       read -n1 RES6
                       if [[ $RES6 == "v" || $RES6 == "V" ]]; then
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
			
		       isWinner "$RES1" "$RES2" "$RES3" "$RES4" "$RES5" "$RES6"

		       ANUNCIO="Gracias por jugar, espero que te hayas divertido"
		       printsPreguntas "$ANUNCIO"
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
