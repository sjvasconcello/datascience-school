# !/bin/bash
# Programa para ejemṕlificar como captar informacion del usuario utilizando el comando read

option=0
backupName=""

echo "Programa Utilidades Postgres"
read -p "Ingresar una opción: " option
read -p "Ingresar el nombre del archivo del BackUp: " backupName

echo "Opcion:$option , backupName:$backupName"
