###########################################################################
# Name: Michael Pultorak 
# Date: 03/29/21
# This program will perform the following tasks:
# 1) Ask use for the quantity
# 2) Use discount_percentage function to calculate the discount percentage
# 3) Calculate amount (quantity * 99)
# 4) Calculate discount amount (amount * discount percentage /100)
# 5) Calculate total amount (amount – discount amount)
# 6) Display discount percentage, amount of discount, and total amount
# 7) Display an error message if quantity is less than 0 (negative number)
# 8) Use try/except construct to catch any errors
# It will display an error message if the entered score is non-numerical 
###########################################################################

##############################################################
# Function Name: discount_percentage 
# Description: Calculate percentage of discount
# Parameter: number of packages
# Returns discount percentage
##############################################################

def discount_percentage(packages):
    if 10 <= packages <= 19:
        discount = 20
    elif 20 <= packages <= 49:
        discount = 30
    elif 50 <= packages <= 99:
        discount = 40
    elif packages >= 100:
        discount = 50
    else:
        discount = 0
    return discount

###########################################################################
# Function Name: main
# Description: Ask the user for quanity of packages. Use discount_percentage
#              function to caluate the amount, discount amount, and total amount           
# Parameter: None
# Returns None
###########################################################################

def main():
    packages = input('Enter number of packages: ')
    try:
        packages = int(packages)
        if packages < 0: 
            exit
        amount = packages * 99 
        discount_amount = (amount * discount_percentage(packages)/100)
        total_amount = amount - discount_amount
        
        print(f'The discount percentage is: {discount_percentage(packages)}%')
        print(f'The amount of discount is: ${discount_amount}')
        print(f'The total amount is: ${total_amount}')
        
    except ValueError:
        print('Input of packages is not a number')
        print('Please input a number')
    except:
        print('The input number is non-logical')
        print('Please input a correct number')
    