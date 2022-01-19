# -*- coding: utf-8 -*-
"""
Michael Pultorak 

Fund Com Dev
Milestone 2

Help used: 
https://www.geeksforgeeks.org/caesar-cipher-in-cryptography/
"""

#Opens file to encrypt text and takes key
with open('text.txt', 'r') as textc:
    text = textc.read()    
key = input('please enter a shift key: ')

#Encrypts text using key 
encryp = ''
for letter in text:
    if letter.isupper():
        encryp += chr((ord(letter) + int(key) - 65) % 26 + 65)
    elif letter.islower():
        encryp += chr((ord(letter) + int(key) - 97) % 26 + 97)
    else:
        encryp += letter

#Unencrypts encrypted text if prompted
ask = input('Unincrypt? T/F: ')
if ask == 'T':
    unencryp = ''
    for c in encryp:
        if c.isupper():
            unencryp += chr((ord(c) - int(key) - 65) % 26 + 65)
        elif c.islower():
            unencryp += chr((ord(c) - int(key) - 97) % 26 + 97)
        else: 
            unencryp += c

#Outputs encrypted and unencryped, if prompted, text into output file
with open('output.txt', 'w') as end:
    end.write(f'Encryption: {encryp}')
    if ask =='T': 
        end.write(f'\nUnecryption: {unencryp}')
