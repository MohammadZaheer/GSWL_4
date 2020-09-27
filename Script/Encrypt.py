from cryptography.fernet import Fernet
import os
import sys

FileToEncrypt = sys.argv[1]

file = open('key.key','rb')
key = file.read()
file.close	

os.chdir("/home/$USER/GSWL_4/ToCrypt")

with open(FileToEncrypt,'rb') as f:
	data = f.read()

fernet = Fernet(key)
encrypted = fernet.encrypt(data)

NameOfFileToEncrypt = FileToEncrypt + '.encrypted'

# write encrypted file

with open(NameOfFileToEncrypt,'wb') as f:
	f.write(encrypted)
