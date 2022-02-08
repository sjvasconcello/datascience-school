# ! /bin/bash
# Programa para ejemplificar el empaquetamiento con el comando pbzip

echo "Empaquetar todos los scripts de la carpeta shellCourse"
tar -cvf shellCourse.tar *.sh # c: create, v:visual; f:file
pbzip2 -f shellCourse.tar


echo "Empaquetar un directorio con tar u pbzip2"

tar -cf *.sh -c > shellCourseDos.tar.bz2