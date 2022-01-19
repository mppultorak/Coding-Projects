# -*- coding: utf-8 -*-
"""
Michael Pultorak 

Fund Com Dev
Lab 6
Translating RNA into Protein

Help used: 
https://www.geeksforgeeks.org/python-dictionary/
https://stackoverflow.com/questions/22571259/split-a-string-into-n-equal-parts
"""
#Dict for RNA into Protein
prot = ''
rna = {'UUU':'F', 'UUC':'F', 'UUA':'L', 'UUG':'L',
       'UCU':'S', 'UCC':'S', 'UCA':'S', 'UCG':'S',
       'UAU':'Y', 'UAC':'Y', 'UAA':'STOP', 'UAG':'STOP',
       'UGU':'C', 'UGC':'C', 'UGA':'STOP', 'UGG':'W',
       'CUU':'L', 'CUC':'L', 'CUA':'L', 'CUG':'L',
       'CCU':'P', 'CCC':'P', 'CCA':'P', 'CCG':'P',
       'CAU':'H', 'CAC':'H', 'CAA':'Q', 'CAG':'Q',
       'CGU':'R', 'CGC':'R', 'CGA':'R', 'CGG':'R',
       'AUU':'I', 'AUC':'I', 'AUA':'I', 'AUG':'M',
       'ACU':'T', 'ACC':'T', 'ACA':'T', 'ACG':'T',
       'AAU':'N', 'AAC':'N', 'AAA':'K', 'AAG':'K',
       'AGU':'S', 'AGC':'S', 'AGA':'R', 'AGG':'R',
       'GUU':'V', 'GUC':'V', 'GUA':'V', 'GUG':'V',
       'GCU':'A', 'GCC':'A', 'GCA':'A', 'GCG':'A',
       'GAU':'D', 'GAC':'D', 'GAA':'E', 'GAG':'E',
       'GGU':'G', 'GGC':'G', 'GGA':'G', 'GGG':'G'}

#Opens input file
with open('rosalind_prot.txt', 'r') as enter:
    text = enter.read()

#Splits text from input file into groups of three    
rna_split = [text[i:i+3] for i in range(0, len(text), 3)]

#Uses dict to transform rna into protein
for group in rna_split:
    if rna[group] == 'STOP':
        break
    else:
        prot += rna[group]

#Output into new file
with open('output.txt', 'w') as end:
    end.write(prot)
