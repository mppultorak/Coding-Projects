# -*- coding: utf-8 -*-
"""
Created on Sun Sep 20 20:06:10 2020

@author: Mike
"""
tot1 = 0
tot2 = 0
count = 0
lines = ['4198857511330877'] ## '3123213', '32323546', '4236546456', '432467654']
for cc in lines:
    for num in cc[::-1]:
        if count % 2 != 0: 
            mult = int(num)*2
            if mult >= 10:
                two = [int(digit) for digit in str(mult)]
                tot1 += two[0]+two[1]
            else: 
                tot1 += mult
        else: 
            tot2 += int(num)
        count += 1
       
            
"""
    for num2 in cc[::2]:
        tot2 += int(num2)
    if (tot1 + tot2) % 10 == 0:
        print('valid')
"""
print(tot1)
print(tot2)

