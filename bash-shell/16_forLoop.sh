# ! /bin/bash
# Programa para ejemplificar el uso de la sentencia de iteración for
# Autor: Marco Toscano Freire - @martosfre

arregloNumeros=(1 2 3 4 5 6)

echo "Iterar en la Lista de Números"
echo -e "\n"
for num in ${arregloNumeros[*]}
do
    echo "Número:$num"
done

echo "Iterar en la lista de Cadenas"
echo -e "\n"
for nom in "Marco" "Pedro" "Luis" "Daniela"
do
    echo "Nombres:$nom"
done

echo "Iterar en Archivos"
echo -e "\n"

for fil in *
do
    echo "Nombre archivo:$fil"
done

echo "Iterar utilizando un comando"
echo -e "\n"
for fil in $(ls)
do
    echo "Nombre archivo:$fil"
done

echo "Iterar utilizando el formato tradcional"
echo -e "\n"
for ((i=1; i<10; i++))
do
    echo "Número;$i"
done



