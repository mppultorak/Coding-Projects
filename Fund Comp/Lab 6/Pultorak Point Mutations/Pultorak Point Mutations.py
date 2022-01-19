# -*- coding: utf-8 -*-
"""
Michael Pultorak 

Fund Com Dev
Lab 6
Counting Point Mutations

Help used: 
https://stackoverflow.com/questions/22042948/split-string-using-a-newline-delimiter-with-python
https://stackoverflow.com/questions/1663807/how-to-iterate-through-two-lists-in-parallel
"""
#Opens text file and takes data
count = 0
with open('rosalind_hamm.txt', 'r') as enter:
    text = enter.read()

#Splits into two strs 
dna_joint = text.splitlines()
dna1 = dna_joint[0]
mut = dna_joint[1]

#Counts differences in two strs
for d, m in zip(dna1, mut):
    if d != m: 
        count += 1

#Outputs count to text file
with open('output.txt', 'w') as end:
    end.write(str(count))