import math

# Finding len of ladder 
def ladder():
    height = float(input('Enter the height of the ladder against the wall: ')) # Height of ladder on wall
    angle_deg = float(input('Enter the angle made by the ladder to the ground: ')) # Angle formed by ladder and ground
    rad = angle_deg * math.pi / 180 # Degrees to radians
    ladder_len = height / (math.sin(rad)) # Calulates len of ladder
    print(f'The length of the ladder is: {ladder_len:.2f}') # Prints result


# Finding the sum of the natural numbers for a given n
def naturalsum():
    n = int(input('Enter a number: ')) # Takes input
    total = 0 # Empty variable for the sum
    for num in range(n+1): # Iterates over every real number in n
        total += num # Sums all numbers
    print(f'The sum of all real numbers in {n} is: {total}')
    

# Implementing formula for given n
def formulasum():
    n = int(input("Enter a number: ")) # Take input
    k = (n*(n+1))/2 # Finds summation 
    print(f'The result for {n} summations is: {k}') # Prints result
    ### The result of B and C are the same
    ### The difference between the two is one used a for loop and the other used a formula
    ### Futhermore, part c results in a floating point rather than an int


# Find the average of a series of a numbers entered
def avg():
    n = int(input('How many numbers are there? '))
    total = 0 # Empty variable for the sum
    for var in range(n): # For loop per how many numbers there are
        i = int(input('Please enter a number: ')) # Asks for number
        total += i # Adds number to total  
    average = total / n # Finds avg
    print(f'The average is: {average:.2f}') # Prints result


# Finds factorial of number n
def factorial():
    n = int(input("Enter a number: ")) # Takes input
    total = 1 # Empty variable for the factoral
    for var in range(1, n+1): # Finds all numbers in n excluding 0 
        total *= var # Multiples by total 
    print(f'The factorial of the number {n} is: {total}')
    
    
