#!/bin/bash

cd /home/$USER/GSWL_4/ToCrypt

array=($(echo *))

cd /home/$USER/GSWL_4/Crypted

FilesInCrypted = "$(echo *)"

for filename in ${array[*]}
do
    if [[ "$FilesInCrypted" == "$filename.encrypted" ]] then
        echo "File is present"
    else
        cd /home/$USER/GSWL_4
        python3 Encrypt.py "$filename"
        mv /home/$USER/GSWL_4/ToCrypt/"$filename.encrypted" /home/$USER/GSWL_4/Crypted/"$filename.encrypted"
    fi
done
