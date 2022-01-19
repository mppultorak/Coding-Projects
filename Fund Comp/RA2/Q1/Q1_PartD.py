# Find the average of a series of a numbers entered
n = int(input('How many numbers are there? '))
total = 0 # Empty variable for the sum
for var in range(n): # For loop per how many numbers there are
    i = int(input('Please enter a number: ')) # Asks for number
    total += i # Adds number to total
    
avg = total / n # Finds avg
print(f'The average is: {avg}') # Prints result
