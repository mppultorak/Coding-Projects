# -*- coding: utf-8 -*-
"""
Michael Pultorak 

Fund Com Dev
Milestone 2

Help used: 
https://www.geeksforgeeks.org/caesar-cipher-in-cryptography/
https://www.geeksforgeeks.org/vigenere-cipher/
https://stackoverflow.com/questions/1663807/how-to-iterate-through-two-lists-in-parallel
https://stackoverflow.com/questions/5254445/add-string-in-a-certain-position-in-python
"""

encryp = ''

#Opens file to encrypt text and takes key
with open('text.txt', 'r') as textc:
    text = textc.read()
key = input('please enter a key phrase: ')

       
#Takes key input and creates key based upon the len of text
key1 = ''
kint = 0
while kint < len(text.replace(' ', '')):
      for k in key:
          if kint < len(text.replace(' ', '')):
              key1 += k
          kint += 1   
    
    
#Encrypts text using key
for indtext, indkey in zip(text.replace(' ', ''), key1):
    if indtext.isupper():
        encryp += chr((ord(indtext) + (ord(indkey) - 65) - 65) % 26 + 65)
    elif indtext.islower():
        encryp += chr(((ord(indtext) + (ord(indkey.lower()) - 97) - 97) % 26) + 97)
    else:
        encryp += indtext

#Adds spaces to encryption based on location in text
count = 0
for sp in text:
    if sp == ' ':
     encryp = encryp[:count] + ' ' + encryp[count:]   
    count += 1 

#Prints output into new file
with open('output.txt', 'w') as out:
    out.write(encryp)
    
