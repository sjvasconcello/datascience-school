# ! /bin/bash
# Progrma para ejemplificar las operacion de un archivo

echo "Operaciones de un archivo"
mkdir -m 755 backupScript

echo -e "\nCopiar los scripts del directorio actual al nuevo directorio "
cp *.* backupScript/
ls -la backupScript/

echo -e "\nMover el directorio backupScript a otra ubicación: $HOME"
mv backupScript $HOME

echo -e "\nEliminar los archivos .txt"
rm *.txt


