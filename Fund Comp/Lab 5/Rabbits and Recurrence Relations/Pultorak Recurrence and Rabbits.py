# -*- coding: utf-8 -*-
"""
Michael Pultorak 
Lab 5: Recurrence

Help used:
https://www.youtube.com/watch?v=Qk0zUZW-U_M
https://stackoverflow.com/questions/6429638/how-to-split-a-string-of-space-separated-numbers-into-integers
"""

from functools import lru_cache

@lru_cache()
def rabbits(n, k):
    if n == 1:
        return 1
    elif n == 2:
        return 1
    elif n > 2:
        return rabbits(n-1, k) + k*rabbits(n-2, k)

with open('rosalind_fib.txt') as filer:
    for nums in filer:
        numbers = str.split(nums)
            
with open('output.txt', 'w') as end:
     rabnum = rabbits(int(numbers[0]), int(numbers[1]))
     end.write(str(rabnum))
    
