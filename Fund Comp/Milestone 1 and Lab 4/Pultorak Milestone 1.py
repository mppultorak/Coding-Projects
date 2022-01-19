# -*- coding: utf-8 -*-
"""
Michael Pultorak 

Milestone Lab 1
https://docs.python.org/release/2.3.5/whatsnew/section-slices.html
"""
lines = []
out = []
with open('testCCNums.txt') as filec:
    for line in filec:
        lines.append(line.strip())

for cc in lines:
    tot1 = 0
    tot2 = 0
    check = int(cc[0:2])
    if check == 34 and check == 37:
        cardname = 'American Express'
    elif check >= 51 and check <= 55:
        cardname = 'MasterCard'
    elif check 
        cardname = 'Visa'
    for num in cc[-2::-2]:
        mult = int(num)*2
        if mult >= 10:
            two = [int(digit) for digit in str(mult)]
            tot1 += two[0] + two[1]
        else: 
            tot1 += mult 
    for num2 in cc[::2]:
        tot2 += int(num2)
    if (tot1 + tot2) % 10 == 0:
        valid_chk = 'Valid'
    else:
        valid_chk = 'Invalid'
    out.append(f'{cc}--------{cardname}: {valid_chk}')


with open('output.txt', 'w') as end:
    for credit in out:
        end.write(f'{credit} \n')

    
# Open text file 

# Grab set of numbers by line 

# Take length (This should be a varible)

# Take first 2 numbers of card:
    # 34/37 = American Express
    # 51/52/53/54/55 = MasterCard
    # 4 = Visa
    # Other = Invalid
 
# Compare to length:
    # 5 and 4 cards must be 16 digits
    # 3 must be 15 digits
    
# Take every other digit starting from -2

# Muliply these by 2 

# Check to see if result is two digits:
    # If it is add the two digits together
    # Else add to total
    
# Take total of every other starting from -1 (not multiplied)
    
# Add totals

# Check to see if last digit of sum is zero:
    # If true = Valid 
    # If false = Invalid

# Append result to new text file in this form and one per line:
    # (CARD NUMBER)--------(TYPE IE: VISA): (RESULT)    