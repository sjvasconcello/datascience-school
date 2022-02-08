# ! /bin/bash
# Programa para ejemplificar el empaquetamiento con el comando pbzip

echo "Empaquetar todos los scripts de la carpeta shellCourse"
tar -cvf shellCourse.tar *.sh # c: create, v:visual; f:file

# Cuando se empaqueta con gzip el empaquetamiento anterior se eliminaa
gzip shellCourse.tar 

echo "Empaquetar un solo archivo, con un ratio 9"
gzip -9 9_options.sh
