# -*- coding: utf-8 -*-
"""
Michael Pultorak 
Fund Comp
Lab 4

Help used:
https://docs.python.org/release/2.3.5/whatsnew/section-slices.html
"""
out = ''
file = input('Enter a file name: ')
with open(f'{file}') as filed:
    for strand in filed: 
        for letter in strand [::-1]:
            if letter == 'A':
                out += 'T'
            elif letter == 'C':
                out += 'G'
            elif letter == 'T':
                out += 'A'
            elif letter == 'G':
                out += 'C'
                
with open('output.txt', 'w') as end:
    end.write(out)
