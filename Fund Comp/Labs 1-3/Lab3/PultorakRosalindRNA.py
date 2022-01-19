# -*- coding: utf-8 -*-
"""
Michael Pultorak 
Lab 3

Python Crash Course
CH 4,5 & 7 

Used this tutorial for join() function: 
https://pythonbasics.org/join/
"""

# Input str of DNA
s = 'GATGGAACTTGACTACGTAAATTTTT'

# Empty list for output
rna = []

#Iterates on each letter in str s
for letter in s:
    #Checks if letter is 'T'
    if letter == 'T':
        #Appends letter as U to new list
        rna.append('U')
    else:
        #If letter is not 'T'
        #Appends letter to new list
        rna.append(letter)

#prints list to console/ Join function joins list of seperate strings to one
print("".join(rna))

        
