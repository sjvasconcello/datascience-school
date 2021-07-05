# !/bin/bash
# Programa para revisar como ejecutar comandos dentro de un programa y almacenar en una
# variable para su posterior utilizacion 

# Autor: Santiago J. Vasconcello - @sjvasconcello
# -v Muestra el texto
# -x Execucion

ubicacionActual=`pwd`
infoKernel=$(uname -a)

echo "La informacion actual es la siguiente: $ubicacionActual"
echo "Informacion del Kernel: $infoKernel"
