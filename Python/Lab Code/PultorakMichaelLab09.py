# Michael
# Pultorak
# Date: 03/22/21
# Description: Modular coding
from math import sqrt

########################################
# Function: read_data
# Reads data from file and returns list
# Perameter: file name
# Output: Outputs list of numbers
########################################
def read_data(file):
    nums = []
    with open(file, 'r') as data:
        for line in data.readlines():
            line = int(line)
            nums.append(line)
    return nums

########################################
# Function: compute_sum
# Reads data from list and returns sum
# Perameter: list of numbers
# Output: Outputs int
########################################
def compute_sum(lst):
    total = 0
    for val in lst:
        total += val
    return total
        
########################################
# Function: compute_mean
# Reads data from list and returns mean
# Perameter: list of numbers
# Output: Outputs float
########################################
def compute_mean(lst):
    summ = compute_sum(lst)
    mean = summ / len(lst)
    return mean

########################################
# Function: compute_sd
# Reads data from list and returns stand dev
# Perameter: list of numbers
# Output: Outputs float
########################################
def compute_sd(lst):
    total = 0
    mean = compute_mean(lst)
    for num in lst:
        dev = mean - num
        dev = dev**2
        total += dev
    size = len(lst)
    result = total / (size - 1) 
    result = sqrt(result)
    return result

########################################
# Function: write_result
# Reads data and writes reuslt
# Perameter: file, int, float
# Output: file
########################################
def write_result(file, summ, mean, dev):
    with open(file , 'w') as out:
        out.write(f'Sum is: {summ:.2f}\nMean is: {mean:.2f}\nStandard Deviation: {dev:.2f}')

########################################
# Function: main
# Reads data and writes reuslt
# Perameter: file, int, float
# Output: file
########################################
def main():
    infile = input('Enter a input file: ')
    outfile = input('Enter a output file: ')
    lst = read_data(infile)
    write_result(outfile, compute_sum(lst), compute_mean(lst), compute_sd(lst))
    
  