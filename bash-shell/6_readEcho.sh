# !/bin/bash
# Programa para ejemṕlificar como capturar informacion del usuario utilizando el comando
# echo, read y $REPLY

option=0
backupName=""

echo "Programa Utilidades Postgres"
echo -n "Ingresar una opción: "
read 

option=$REPLY

echo -n "Ingresar el nombre del archivo del BackUp: "
read 

backupName=$REPLY

echo "Opcion:$option , backupName:$backupName"




