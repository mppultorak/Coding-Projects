# -*- coding: utf-8 -*-
"""
Michael Pultorak 

While Loop Tutorial 
"""

a = int(input('Enter smaller number: '))
b = int(input('Enter larger number: '))
tot = 0
while(a <= b):
    if a % 2 != 0: 
        tot += a 
    a += 1
print(tot)     
