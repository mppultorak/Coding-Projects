# Michael Pultorak
from math import sqrt
n = int(input('Enter a number: '))
num = 2 
while num < sqrt(n):
    if n % num == 0: 
        print('Not prime.')
        break
    num += 1
    
        
