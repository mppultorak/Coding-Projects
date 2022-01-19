# -*- coding: utf-8 -*-
"""
Michael Pultorak
Recursion 

Help Used:
https://www.youtube.com/watch?v=Qk0zUZW-U_M
"""
from functools import lru_cache

@lru_cache(maxsize = 1000)
def fibonacci(n):
    
    if type(n) != int:
       raise TypeError("n must be a positive int") 
    elif n < 1:
        raise TypeError("n must be a positive int") 
    
    if n == 1:
        return 1
    elif n == 2:
        return 1
    elif n > 2:
        return fibonacci(n-1) + fibonacci(n-2)
    
        
for n in range(1, 10):
    print(n, ':', fibonacci(n))    
    
print(fibonacci(2.1))
    
    
    
    
       
"""    
i = input("Enter a number: ")
i = int(i)
count = 0
var1 = 0 
var2 = 1

while count < i:
    print(var2)
    var3 = var2 + var1
    var1 = var2 
    var2 = var3 
    count+=1
"""    