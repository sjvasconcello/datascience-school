# !/bin/bash
# Programa para revisar la declaracion de variables

opcion=0
nombre=Marco

echo "Opción: $opcion y Nombre $nombre"

# Exportar la variable nombre para que este disponible a los demás procesos

export nombre

# Llamar al siguiente script

./1_utilityPostgres.sh