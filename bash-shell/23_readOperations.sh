# ! /bin/bash

echo "Leer un archivo"
cat $1
echo -e "\nAlmacenar los valores en una variable"
valorCat=`cat $1`
echo "$valorCat"

# Se utiliza la variable IFS (INTERNAL FIELD SEPARATOR) para evitar que los
# espacios en blanco al inicio al final se recortan

echo -e "\nLeer archivos linea por linea utilizando while"

while IFS= read linea
do
    echo "$linea"
done < $1




