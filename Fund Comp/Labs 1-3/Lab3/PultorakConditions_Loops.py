# -*- coding: utf-8 -*-
"""
Michael Pultorak 
Lab 3

Python Crash Course
CH 4,5 & 7 
"""

a = 4197
b = 8615 
count = 0
for number in range(a, b+1):
    if number % 2 != 0 :
        count =  count + number
        
print(count)