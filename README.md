## GSWL_TP1_User_Management

This project contains a service that detects whenever a file is added to the folder ToCrypt, it encrypts the file and sends it to the Crypted folder. Similarly, the service also detects whenever a file is added to the folder ToDecrypt, it decrypts the file and sends it to the folder Decrypted.

Note that this service can also be used on a server.

# Installation

1. The first step to use this project is to clone its repository. This is done by entering the following command:
   `git clone https://github.com/MohammadZaheer/GSWL_4.git`
   
2. The second step is to execute the script install.sh. But before doing that, it is mandatory to give the script install.sh the necessary permission to be able to execute it. This is done by entering the following command: 
`chmod u+x install.sh`
Then to execute the install.sh file, enter the following command
`./install.sh`

# Script folder

This folder contains all the required scripts for the encoding and decoding of files for this project:
1. Key.py
2. Encrypt.py
3. Decrypt.py
4. Encrypt.sh
5. Decrypt.sh

# Key.py

- This python script focuses mainly on generating a key which will be used by the python scripts Encrypt.py and Decrypt.py
- In order to generate the key, it makes use of an encryption method called Fernet.
- To be able to use Fernet, we have to import it from the library cryptography. This is done by the line `from cryptography.fernet import Fernet`.
- The line `key = Fernet.generate_key()` is used to generate a key and store it in the variable `key`. To do this, it makes use of the function generate_key().
- The remaining steps focuses on creating a file `key.key` which is opened for writing in binary mode, writes the key that has been generated to the file and closes it.

Note that when writing in binary mode, Python makes no changes to data as it is written to the file.

# Encrypt.py

- In this script, the file to be encrypted is passed as argument to the script. This is done by using sys.argv. sys.argv is a list in Python, which contains the commmand-line arguments passed to the script. To be able to use this list, we must import sys in the script, referring to the line `import sys`.
- This script also uses the OS module which allows us to interface with the underlying operating system that Python is running on - be that Windows, Mac or Linux. To be able to use this module, we must import os in the script, referring to the line `import os`.
- Then the file key.key is opened in binary format for reading and then the key is read and stored in the variable key.
- The file to be encrypted is then opened in binary format for reading and all the data in the file is read, stored in the variable data and is then encrypted. This is done by using the function `encrypt` and passing the variable `data` to it as parameter.
- The line `NameOfFileToEncrypt = FileToEncrypt + '.encrypted'` is used to take the name of the file that is to be encrypted and adds the extension `.encrypted` to it.
- This filename is then created when opening in binary format for writing and therefore the encrypted data is written to the file

# Decrypt.py

- In this script, the file to be decrypted is passed as argument to the script. This is done by using sys.argv. sys.argv is a list in Python, which contains the commmand-line arguments passed to the script. To be able to use this list, we must import sys in the script, referring to the line `import sys`.
- This script also uses the OS module which allows us to interface with the underlying operating system that Python is running on - be that Windows, Mac or Linux. To be able to use this module, we must import os in the script, referring to the line `import os`.
- Then the file key.key is opened in binary format for reading and then the key is read and stored in the variable key.
- The file to be decrypted is then opened in binary format for reading and all the data in the file is read, stored in the variable data and is then decrypted. This is done by using the function `decrypt` and passing the variable `data` to it as parameter.
- The line `NameOfFileToDecrypt = FileToDecrypt + '.decrypted'` is used to take the name of the file that is to be decrypted and adds the extension `.decrypted` to it.
- This filename is then created when opening in binary format for writing and therefore the decrypted data is written to the file

# Encrypt.sh

- This bash script compares the two folders ToCrypt and Crypted
- The two lines `cd /home/$USER/GSWL_4/ToCrypt` and `array=($(echo *))` is used to list all the files in the ToCrypt folder and store it in an array. It is the same things as going to the ToCrypt folder and running an `ls` in that folder.
- The two lines `cd /home/$USER/GSWL_4/Crypted` and `FilesInCrypted = "$(echo *)"` is used to list all the files in the Crypted folder and store it in FilesinCrypted. It is the same things as going to the Crypted folder and running an `ls` in that folder.
- The remaining lines verifies every files in the folder ToCrypt to check whether its encrypted version is present in the folder Crypted. - If that's the case, a message will de displayed to let the user know that there is already an encrypted version of the file. In the other way, the file will be encrypted and sent to the folder Crypted.

# Decrypt.sh

- This bash script compares the two folders ToDecrypt and Decrypted
- The two lines `cd /home/$USER/GSWL_4/ToDecrypt` and `array=($(echo *))` is used to list all the files in the ToDecrypt folder and store it in an array. It is the same things as going to the ToDecrypt folder and running an `ls` in that folder.
- The two lines `cd /home/$USER/GSWL_4/Decrypted` and `FilesInDecrypted = "$(echo *)"` is used to list all the files in the Decrypted folder and store it in FilesinDecrypted. It is the same things as going to the Decrypted folder and running an `ls` in that folder.
- The remaining lines verifies every files in the folder ToDecrypt to check whether its decrypted version is present in the folder Derypted. If that's the case, a message will de displayed to let the user know that there is already a decrypted version of the file. In the other way, the file will be decrypted and sent to the folder Decrypted.


# Src folder

This folder contains the services required for the encryption and decryption of files
1. Encrypt.service
2. Decrypt.service

# install folder

This folder contains the file install.sh which install the all the prerequisites for this project.

The commands `sudo apt-get update` and `sudo apt-get install python3-pip` respectively is used to update the system and then install pip.
pip is a de facto standard package-management system used to install and manage software packages written in Python. 

The command `pip3 install cryptography` is used to install a package which provides cryptographic recipes and primitives to Python developers.

The commands `mkdir ToCrypt`, `mkdir Crypted`, `mkdir ToDecrypt` and `mkdir Decrypted` is used create 4 folders; 
1. `ToCrypt`
2. `Crypted`
3. `ToDecrypt`
4. `Decrypted`

The commands `cd Script` and `python3 Key.py` is used to navigate to the folder `Script` and executing the python script `Key.py`.

The commands `cd Src`, `sudo cp /home/$USER/GSWL_4/Src/Encrypt.service /etc/systemd/system` and `sudo cp /home/$USER/GSWL_4/Src/Decrypt.service /etc/systemd/system` is used to navigate to the folder Src and copies the 2 services `Encrypt.service` and `Decrypt.service` to the directory `/etc/systemd/system`

The commands `cd ../../../` and `cd /etc/systemd/system` is used to navigate to the directory `/etc/systemd/system`

# How to manage services

To start service:
```
sudo systemctl start name_of_service
```

To stop service:
``` 
sudo systemctl stop name_of_service
```

To restart service:
```
sudo systemctl restart name_of_service
```

To check the status of service:
```
sudo systemctl status name_of_service
```

To enable service:
```
sudo systemctl enable name_of_service
```

To disable service:
```
sudo systemctl disable name_of_service
```

### Difference between the two file modes `rb` and `wb`

1. `rb`

> Opens a file for reading only in binary format. The file pointer is placed at the beginning of the file. This is the default mode.

2. `wb`

> Opens a file for writing only in binary format. Overwrites the file if the file exists. If the file does not exist, creates a new file for writing.


### Resources on Fernet

1. (https://youtu.be/H8t4DJ3Tdrg)

2. (https://nitratine.net/blog/post/encryption-and-decryption-in-python/)
