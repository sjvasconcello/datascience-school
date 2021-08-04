# ! /bin/bash

echo "Loops Anidados"

for fill in $(ls)
do 
    for nombre in {1..4}    
    do
        echo "Nombre archivo:$fill _ $nombre"
    done
done
