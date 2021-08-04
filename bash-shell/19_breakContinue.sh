# ! /bin/bash

echo "Sentencias break y continue"

for fill in $(ls)
do 
    for nombre in {1..4}
    do
        if [ $fill = "10_download.sh" ]; then
            break
        elif [[ $fill == 4* ]]; then
            continue
        else
            echo "Nombre archivo:$fill _ $nombre"
        fi
    done 
done

