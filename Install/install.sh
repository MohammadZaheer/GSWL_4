#!/bin/bash

sudo apt-get update

sudo apt-get install python3-pip

pip3 install cryptography

cd ..

mkdir ToCrypt
mkdir Crypted
mkdir ToDecrypt
mkdir Decrypted

cd Script

python3 Key.py

cd ..
cd Src

sudo cp /home/$USER/GSWL_4/Src/Encrypt.service /etc/systemd/system
sudo cp /home/$USER/GSWL_4/Src/Decrypt.service /etc/systemd/system

cd ../../../
cd /etc/systemd/system

sudo systemctl enable Encrypt.service
sudo systemctl start Encrypt.service
sudo systemctl enable Decrypt.service
sudo systemctl start Decrypt.service
