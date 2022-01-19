# Michael
# Pultorak
# Date: 03/18/21
# Description: Doubles values of list


##############################################
# Function: findDoubles(<list>)
# Description: Multiplies numbers of list by 2
# Perameter: list
# Output: list * 2
##############################################
def findDoubles(numlist):
    i = 0
    for value in numlist:
        numlist[i] = value * 2
        i += 1
    return numlist

##############################################
# Function: findDoubles()
# Description: Forms list from input and mults by 2
# Perameter: None
# Output: list
##############################################
def main():
    lst = []
    for i in range(5):
        lst.append(int(input('Enter a number: ')))
    print(findDoubles(lst))

