# ! /bin/bash
# Programa para ejemplificar la creacion de archivos y directorios


echo "Archivos - Directorios"

if [ $1 == "d" ]; then
    mkdir -m 755 $2
    echo "Directorio creado correctamente"
    ls -la $2
elif [ $1 == "f" ]; then
    touch $2
    echo "Archivo creado correctamente"
    ls -la $2
else
    echo "No existe esa opción: $1"
fi


