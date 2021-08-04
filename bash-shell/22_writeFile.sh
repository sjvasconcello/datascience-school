# ! /bin/bash
# Programa para como escribir en un archivo

echo "Escribir en una linea"

echo "Valores escritos con echo" >> $1

# Adiccion multilinea
cat <<EOM >> $1
$2
EOM
