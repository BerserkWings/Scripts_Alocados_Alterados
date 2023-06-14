#!/bin/bash

# Programa creado por: BerserkWings con la ayuda de ChatGPT

# Explicacion: Este es un programa que cree, con la intención de que me ayude a guardar, consultar, las contraseña que se obtienen a traves de los niveles de la página Over The Wire. 
# Aunque se puede usar para guardar otras cosas. Al usar el programa, se creara un archivo txt de nombre datos.txt, este guardara las contraseñas.

# IMPORTANTE: La función guardar_datos, borrar_datos y mostrar_datos, hara un limpiado de terminal, por lo que recomiendo que se use en otra terminal. Además, es necesaria la herramienta xclip, puedes descargarla con el siguiente comando "sudo apt install xclip"

# Función para menu
menu() {
	echo -e "\t\nBienvenido al Gestor de Contraseñas para OverTheWire"
	echo "1. Guardar Contraseña."
	echo "2. Consultar Contraseña."
	echo "3. Borrar Contraseña."
	echo "4. Mostrar Contraseñas."
	echo -e "5. Salir = ctrl + C \n"
}

# Función para guardar nivel y contraseña
guardar_datos() {
	read -p "Ingresa el nivel: " nivel

	# Lee el último nivel utilizado, si no hay, lo establece en 0
	if [[ -f datos.txt ]]; then
		ultimo_numero=$(tail -n 1 datos.txt | cut -d ',' -f1)
		numero=$((ultimo_numero + 1))
	else
		numero = 1
	fi

	read -p "Ingresa la contraseña: " contrasena

	# Guardando datos en archivo txt
	echo "$nivel,$contrasena" >> datos.txt
	clear
	echo "[*] Datos guardados correctamente."
}

# Función para consultar nivel y contraseña
consultar_datos() {
	if [[ -f datos.txt ]]; then
		read -p "[*] Ingresa el nivel del que deseas la contraseña: " nivel
		linea=$(grep "^$nivel," datos.txt)

		if [[ -n $linea ]];then
			contrasena=$(echo "$linea" | cut -d ',' -f2)
			echo "[*] Contraseña encontrada: $contrasena, del nivel: $nivel"

			# Copiando contraseña en el portapapeles
			echo $contrasena | tr -d '\n' | xclip -sel clip
			echo -e "[!] La contraseña se copio en la clipboard!\n"
			return 0 # Retorna Exito
		else
			echo "[!] No se encontro ninguna contraseña del nivel: $nivel."
			return 1 # Retorna Fallo
		fi
	else
		echo "[!] No se encontraron datos almacenados."
		return 1 # Retorna Fallo
	fi
}

# Función para borrar datos
borrar_datos() {
	if [[ -f datos.txt ]]; then
		read -p "[*] Ingrese el nivel a borrar: " nivel
		linea=$(grep -v "^$nivel," datos.txt)
		
		if [[ "$linea" != "$(cat datos.txt)" ]]; then
			echo "$linea" > datos.txt
			echo -e "[!] Contraseña borrada correctamente.\n"
			clear
		else
			echo -e "[!] No se encontro ningún nivel con el número $nivel"
		fi
	else
		echo "[!] No se encontraron datos almacenados."
	fi
}

# Función para mostrar datos
mostrar_datos() {
	clear
	if [[ -f datos.txt ]]; then
		echo -e "[*] Contraseñas guardadas: \n"
		cat datos.txt
		echo
	else
		echo "[!] No se encontraron datos almacenados."
	fi
}

# Función para salir del programa
ctrl_c(){
	echo -e "\n\n[!] Saliendo...\n"
	exit 1
}
# ctrl + C
trap ctrl_c SIGINT

# Ciclo de Principal
consulta_exitosa=false # Variable de control

while true; do
	menu
	read -p "[*] Ingresa una opcion: " opcion
	echo

	case $opcion in
		1) guardar_datos ;;
		2) consultar_datos
		# Jugando con los codigos de estado para salir del ciclo principal 
		if [[ $? -eq 0 ]] then
			break
		fi;;
		3) borrar_datos ;;
		4) mostrar_datos ;;
		*)
			echo "[!] $REPLY, No es una operacion valida." ;;

	esac
done
