#!/bin/bash

# Programa creado por: BerserkWings

# Explicación: Esta es una calculardora simple en Bash, no tiene un objetivo en si, pero es buena practica...creo xd.
# IMPORTANTE: Cada que realiza una operación, limpia la terminal para que se vea mejor.

# Función para menu
menu() {
	echo -e "\tCalculadora Don Brga"
	echo "1. Suma"
	echo "2. Resta"
	echo "3. Multiplicación"
	echo "4. División"
	echo "5. Potencia"
	echo -e "6. Salir = ctrl + C \n"
}

# Función para sumar
Suma() {
	clear
	read -p "Ingresa un número a Sumar: " num1
	read -p "Ingresa el otro número: " num2
	resultado=$(($num1+$num2))
	echo -e "[*] El resultado de la suma es: $resultado\n" 
}

# Función para restar
Resta() {
	clear
	read -p "Ingresa un número a Restar: " num1   
        read -p "Ingresa el otro número: " num2   
        resultado=$(($num1-$num2)) 
        echo -e "[*] El resultado de la resta es: $resultado\n"
}

# Función para multiplicar
Multi() {
	clear
	read -p "Ingresa un número a Multiplicar: " num1   
        read -p "Ingresa el otro número: " num2   
        resultado=$(($num1*$num2)) 
        echo -e "[*] El resultado de la multiplicación es: $resultado\n"
}

# Función para dividir
Division(){
	clear
	read -p "Ingresa un número a Dividir: " num1   
        read -p "Ingresa el dividendo: " num2   
        resultado=$(($num1/$num2)) 
        echo -e "[*] El resultado de la división es: $resultado\n"
}

# Función para potencias
Potencia(){
	clear
	read -p "Ingresa un número a elevar: " num1
	read -p "Ingresa la potencia: " num2
	resultado=$(($num1**$num2))
	echo -e "[*] El resultado de la elevación: $resultado\n"
}

# Funcion para salir del programa
ctrl_c(){
	echo -e "\n\n[!] Saliendo...\n"
	exit 1
}
# ctrl + C
trap ctrl_c SIGINT


while true; do
	menu
	read -p "[*] Ingresa una opción: " opcion
	
	case $opcion in
		1) Suma ;;
		2) Resta ;;
		3) Multi ;;
		4) Division ;;
		5) Potencia ;;
		*)
			echo "[!] $REPLY, NO es una operación valida." ;;
	esac
done
