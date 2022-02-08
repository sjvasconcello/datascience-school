# ! /bin/bash
# Programa para ejemplificar la forma de como transferir por la red utilizando el
# comando rsync, utilizando las opciones de empaquetamiento para optmizar la 
# velocidad de tranferencia

echo "Empaquetar todas los scripts de la carpeta shellCourse y transferirlos por la red a otro equipo utilizando el comando rsync"

host=""
usuario=""


read -p "Ingresar el host: " host
read -p "Ingresar el usuario: " usuario
echo -e "\nEn este momento se procedera a empaquetar la carpeta y transferiria según los datos ingresados"

rsync -avz $(pwd) $usuario@$host:/Users/martosfre/Downloads/platzi



