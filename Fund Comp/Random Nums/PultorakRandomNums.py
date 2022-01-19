# -*- coding: utf-8 -*-
"""
Michael Pultorak 

Fund Comp Dev
"""
import random 

rint1 = random.randint(5,8)
print(f'Random int from [5,8]: {rint1}')

rflo1 = random.random() * 0.25
print(f'Random float from [0,2.5]: {rflo1}')

rflo2 = random.random() * 4 + 3
print(f'Random float from [3,7]: {rflo2}')

rflo3 = random.random() * 4.5 + 3
print(f'Random float from [3,7.5]: {rflo3}')

rflo4 = random.random() * 1.25 + 2.5
print(f'Random float from [2.5,3.75]: {rflo4}')