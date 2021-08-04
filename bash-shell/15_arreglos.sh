# ! /bin/bash
# Programa para ejemplificar el uso de los arreglos

arregloNumeros=(1 2 3 4 5 6)
arregloCadenas=(Marco, Antonio, Pedro, Susana)
arregloRangos=({A..Z} {10..20})

# imprimir todos los valores
echo "Arreglo de Números: ${arregloNumeros[*]}"
echo "Arreglo de Cadenas: ${arregloCadenas[*]}"
echo "Arreglo de Rangos: ${arregloRangos[*]}"

# imprime tamaño de los arreglos
echo "Tamaño del arreglo de Números: ${#arregloNumeros[*]}"
echo "Tamaño del arreglo de Cadenas: ${#arregloCadenas[*]}"
echo "Tamaño del arreglo de Rangos: ${#arregloRangos[*]}"

# imprimir las la posicion 3 de los arreglos
echo "Posición 3 del arreglo de Números: ${arregloNumeros[3]}"
echo "Posición 3 del arreglo de Cadenas: ${arregloCadenas[3]}"
echo "Posición 3 del arreglo de Rangos: ${arregloRangos[3]}"

# imprimir los indeces de los arreglos, para este caso @ funciona igual que *
echo "Indices de los arreglo de Números: ${!arregloNumeros[@]}"
echo "Indices de los arreglo de Cadenas: ${!arregloCadenas[@]}"
echo "Indices de los arreglo de Rangos: ${!arregloRangos[@]}"

# Añadir y eliminar valores de un arreglo
arregloNumeros[7]=20
unset arregloNumeros[0]
unset arregloNumeros[1]
echo "Arreglo de Números: ${arregloNumeros[*]}"
echo "Tamaño del arreglo de Números: ${#arregloNumeros[*]}"



