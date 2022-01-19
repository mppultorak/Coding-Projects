# -*- coding: utf-8 -*-
"""
Michael Pultorak 
Lab 5: Working With Files 

Help used: 
https://www.thetopsites.net/article/51744520.shtml
"""
lines = []
check = 0
with open('rosalind_ini5.txt') as filew:
    for line in filew:
        check += 1
        if check % 2 == 0: 
            lines.append(line.strip())
            
with open('output.txt', 'w') as end:
    for text in lines:
        end.write(f'{text} \n')
