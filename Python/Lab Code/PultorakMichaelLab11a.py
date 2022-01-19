import math

###########################################################################
# Name: Michael Pultorak  
# Date: 05/04/21
# This program will perform the following tasks:
#    1) It will ask user for a number - number must be greater than or equal 
#       to 2. If the user enters a number less than 2 (1, 0, or any
#       negative number then it will display an error message. In the same #           
#       way it will display an error message if the user enters a non-
#       numerical or a floating point number
#    2) It will calculate and display all prime numbers between 2
#       and the user entered number.
###########################################################################

###########################################################################
# Function Name: is_prime
# Description: Return true if the given number is prime,
#              otherwise it will return false. A number (n) is prime
#              if no number between 2 and square root of n can evenly
#              divide n.
# Parameter: num - an integer number
# Returns true if the given number is prime, otherwise false
###########################################################################
def is_prime (num):
    square_root = int(math.sqrt(num))
    for n in range (2, square_root+1):
        if (num % n == 0):
            return False
    return True

###########################################################################
# Function Name: main
# Description: Ask the user for a number greater than 2. It will
#              use a loop to iterate from 2 to the given number
#              and disply all the numbers which are prime. It will
#              use is_prime function to check if the number is prime.
#              It will also display an error message if the input is
#              invalid (see program description)
# Parameter: none
#
###########################################################################
def main():
    error = True
    while error:
        try:
            user_input = int (input ('Enter a whole number >= 2: '))
            if user_input < 2:
                print ('Input must be >= 2. Please try again')
            else:
                error = False
        except ValueError as err:
            print ('Input is non-numerical. Please try again')

    print ('Following numbers between 2 and', user_input, 'are prime:')
    for num in range (2, user_input+1):
        result = is_prime (num)
        if result:
            print (num, end = '  ')

