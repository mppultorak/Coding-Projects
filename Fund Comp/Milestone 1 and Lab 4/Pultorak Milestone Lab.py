# -*- coding: utf-8 -*-
"""
Michael Pultorak 
Fund Comp Innovation

Milestone Lab 1
Help used:
https://docs.python.org/release/2.3.5/whatsnew/section-slices.html
https://docs.python.org/3/tutorial/controlflow.html
"""
### Opens file of credit cards and appends them to a list
lines = []
out = []
with open('testCCNums.txt') as filec:
    for line in filec:
        lines.append(line.strip())

### Iterates over list of credit cards         
for cc in lines: 
    tot1 = 0
    tot2 = 0
    count = 0
    
    ### Checks first two numbers for credit card type
    check = int(cc[0:2]) 
    if check == 34 or check == 37:
        cardname = 'American Express'
    elif check >= 51 and check <= 55:
        cardname = 'MasterCard'
    elif int(cc[:1]) == 4: 
        cardname = 'Visa'
    else: 
        cardname = 'Unknown Card Type'
    
    ### Checks that len of credit card is 16 or 15
    if len(cc) != 15 and len(cc) != 16: 
        valid_chk = 'Invalid Length'
        out.append(f'{cc}--------{cardname}: {valid_chk}')
        continue
 
    
        ### Iterates over each number starting from the back 
    for num in cc[::-1]:
        ### Checks to see if the current count is in an even or odd number 
        ### If even add to tot2 if odd mult by 2 and add to tot1
        if count % 2 != 0: 
            mult = int(num)*2
            ### Checks if mult number has two digits
            ### Sparates both digits into list and adds them
            if mult >= 10:  
                two = [int(digit) for digit in str(mult)]  
                tot1 += two[0]+two[1]
            else: 
                tot1 += mult
        else: 
            tot2 += int(num)
        ### Increases count to change path of if statement of line 44
        count += 1

    
    ### checks if remainder is zero to determine if valid or not 
    if (tot1 + tot2) % 10 == 0:
        valid_chk = 'Valid'
    else:
       valid_chk = 'Invalid'
       
    ### Appends final formated output into new list
    out.append(f'{cc}--------{cardname}: {valid_chk}')

### Takes output list and writes results to new file
with open('output.txt', 'w') as end:
    for credit in out:
        end.write(f'{credit} \n')

