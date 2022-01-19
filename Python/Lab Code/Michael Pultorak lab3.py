# Name: Michael Pultorak
# Class: CSCI 1411-00X
# Due Date: 02/15/21
# Description: Ask for length and width of box. Print out the perimeter, how many 12" segments of trim needed, the cost of the trim, and the ammount wasted on unneed trim.
import math

l = float(input('Enter the length of the box in inches: '))
w = float(input('Enter the width of the box inches: '))
per = 2*w + 2*l

print(f'Thank you, the perimeter of your box is: {per}')
trim = math.ceil(per/12)
waste = trim*12 - per 
total = trim * 1.88
print(f"You will need to buy {trim} trim boards")
print(f"The cost of the trim is ${format(total, '.2f')}")
print(f"You will waste {format(waste, '.2f')} inches of trim, which totals to ${format(waste*(1.88/12), '.2f')}")