# Finds factorial of number n
n = int(input("Enter a number: ")) # Takes input
total = 1 # Empty variable for the factoral
for var in range(1, n+1): # Finds all numbers in n excluding 0 
    total *= var # Multiples by total 

print(f'The factorial of the number {n} is: {total}')