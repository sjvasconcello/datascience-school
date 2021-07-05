# !/bin/bash
# Programa para ejemplificar como capturar la información del usuario y validarla
# Autor: Santiago J. Vasconcello - @sjvasconcello


option=0
backupName=""
clave=""

echo "Programa Utilidades Postgres"
# Aceptar el ingreso de informacion de solo un caracter
read -n1 -p "Ingresar una opción: " option
echo -e "\n"
read -n10 -p "Ingresar el nombre del archivo del BackUp: " backupName
echo -e "\n"
echo "Opcion:$option , backupName:$backupName"
read -s -p "Clave:" clave
echo "Clave: $clave"