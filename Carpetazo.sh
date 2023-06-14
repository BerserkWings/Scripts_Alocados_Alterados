#!/bin/bash

echo "[*]Selecciona una opción: "
select opcion in OSCP Metasploit Ambos Salir;
do
	case $opcion in
		OSCP)
			read -p "Escribe el nombre de la carpeta padre: " OSCP
			mkdir -p $OSCP/{OSCP/{nmap,content,scripts,exploits},}
			echo "[*]Se han creado las carpetas de $OSCP, exitosamente en: $PWD[*]"
			break
			;;
		Metasploit)
			read -p "Escribe el nombre de la carpeta padre: " Metas
			mkdir -p $Metas/{Metasploit/{nmap,exploits},}
			echo "[*]Se han creado las carpetas de $Metas, exitosamente en: $PWD[*]"
			break
			;;
		Ambos)
			read -p "Escribe el nombre de la carpeta padre: " Ambos
			mkdir -p $Ambos/{OSCP/{nmap,content,scripts,exploits},}
			cd $Ambos
			mkdir -p Metasploit/{nmap,exploits}
			echo "[*]Se han creado las carpetas de $Ambos, exitosamente en: $PWD[*]"
			break
			;;
		Salir)
			break
			;;
		*)
			echo "$REPLY no es una operación válida."
			;;
	esac
done

