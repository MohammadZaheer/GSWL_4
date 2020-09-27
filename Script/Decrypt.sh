#!/bin/bash

cd /home/$USER/GSWL_4/ToDecrypt

array=($(echo *))

cd /home/$USER/GSWL_4/Decrypted

FilesInDecrypted = "$(echo *)"

for filename in ${array[*]}
do
    if [[ "$FilesInDecrypted" == "$filename.decrypted" ]] then
        echo "File is present"
    else
        cd /home/$USER/GSWL_4
        python3 Decrypt.py "$filename"
        mv /home/$USER/GSWL_4/ToDecrypt/"$filename.Decrypted" /home/$USER/GSWL_4/Decrypted/"$filename.Decrypted"
    fi
done
