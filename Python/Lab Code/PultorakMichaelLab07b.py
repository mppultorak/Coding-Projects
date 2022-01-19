# Michael
# Pultorak
# 03/15/21
# Description: Lab 7 File I/O

def main():
    out = [] # Output file for out file
    text = input("Please enter a input file: ") # Takes name of input text file 
    outf = input("Please enter a output file: ") # Takes name of output file
    with open(text, "r") as file: # Opens file as read
        lines = file.readlines() # Reads lines to list 

    for line in lines: # Take individual component of list 
        i = 0 # Iterable for ending sum and taking avg per list item
        total = 0 # Iterable for sum of scores
        sep = line.split() # Splits line into list 
        for lit in sep[1::]: # Iterates over list other than first variable 
            i += 1 # Counts number of scores added  
            total += int(lit) # Sums total
            if i == len(sep[1::]): # If the number of scored added = the total number of scores, take avg
                avg = total/len(sep[1::]) # Takes average 
                out.append(f"{sep[0]} {avg}") # Appends to new file in format 
                   
    with open(outf, 'w') as final: # Open output file as write 
        for l in out: # Iterates over output list
            final.write(f"{l}\n") # Writes to list
    
    print(f'The scores have been output into file: {outf}') # Final print statement

