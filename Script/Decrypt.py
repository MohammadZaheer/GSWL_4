from cryptography.fernet import Fernet
import os
import sys

FileToDecrypt = sys.argv[1]

file = open('key.key','rb')
key = file.read()
file.close	

os.chdir("/home/$USER/GSWL_4/ToDecrypt")

with open(FileToDecrypt,'rb') as f:
	data = f.read()

fernet = Fernet(key)
decrypted = fernet.decrypt(data)

NameOfFileToDecrypt = FileToDecrypt + '.decrypted'

#write decypted file

with open(NameOfFileToDecrypt,'wb') as f:
	f.write(decrypted)
