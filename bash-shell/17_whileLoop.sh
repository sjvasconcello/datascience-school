# ! /bin/bash
# Programa para ejemplificar el uso de la sentencia de iteracion while

numero=1

while [ $numero -ne 10 ]
do
  echo "Imprimindo $numero veces"
  numero=$(( numero + 1 ))
done
