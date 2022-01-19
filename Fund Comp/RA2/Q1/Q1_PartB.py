# Finding the sum of the natural numbers for a given n

n = int(input('Enter a number: ')) # Takes input
total = 0 # Empty variable for the sum
for num in range(n+1): # Iterates over every real number in n
    total += num # Sums all numbers

print(f'The sum of all real numbers in {n} is: {total}')
    
