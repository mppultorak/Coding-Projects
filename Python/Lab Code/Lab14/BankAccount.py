# BankAccount.py
# Author: 
# Date: 

#import Transaction class
from Transaction import Transaction

def main():
    """Display main menu and class functions based on the selected action"""

    print ('Welcome to Bank Account Application')
    print ()

    done = False

    # Create an empty list of transactions
    list_of_transactions = []

    #Loop as long as done is False
    while (not done):
        #Display menu
        print ('===================================')
        print ('A - Read data from the file')
        print ('B - Display list of transactions')
        print ('C - Add a new transaction')
        print ('D - Calculate current balance')
        print ('E - Save data to a file')
        print ('Q - Quit')
        print ('===================================')
        print ('Please select an action by typing A, B, C, D, E, or Q')
        action = input ('? ')

        if (action == 'A' or action == 'a'):
            read_data (list_of_transactions)
        elif (action == 'B' or action == 'b'):
            display_list (list_of_transactions)
        elif (action == 'C' or action == 'c'):
            add_transaction (list_of_transactions)
        elif (action == 'D' or action == 'd'):
            calculate_balance (list_of_transactions)
        elif (action == 'E' or action == 'e'):
            save_date (list_of_transactions)
        elif (action == 'Q' or action == 'q'):
            done = True
        else:
            print ('Incorrect action type. Please try again')

        print ()

    print ('Thank you for using Bank Account Application')

def read_data (list_of_transactions):
    """Read data from the input file, create transaction object and add it to
       the list of transactions"""
    file = input('Enter a file: ')
    with open(file, 'r') as file:
        lines = file.readlines()
        for data in lines:
            data = data.strip()
            data = data.split(':')
            portal = Transaction(data[0], data[1], data[2])
            list_of_transactions.append(portal)

       # Ask user for name of the input file, read each line of the data,
       # split line using colon (:) is delimiter, create transaction object
       # and add it to the list of transaction. Display error message if the
       # input file is not found.
    print ('Read Data Function')
    


def display_list(list_of_transactions):
   """ Displays list of transactions """
   list_of_transactions.sort()
   for data in list_of_transactions:
       x = data
       print(x)
   # Sort the list of transactions by date and display list of transactions
   # in form of a table

def add_transaction (list_of_transactions):
    """Adds a new transaction to list of Transactions"""

    # Ask user for date, type, and amount of transaction, create a transaction
    # object and append it to the list of transactions.
    # Display an error message if the transaction type is not valid or amount
    # is negative. Valid transaction types are deposit, withdraw, bank charge
    # and interest
    print ('Add Transaction Function')



def calculate_balance (list_of_transactions):

    """Calculates the current balance"""

    # Start with initializing balance to zero
    # For each transaction in the list of transactions you will
    # add the amount to balance if the transaction type is deposit or interest
    # subtract the amount if transaction type is withdraw or bank charge
    # Print the balance on the screen
    print ('Calculate Balance Function')
            
        


def save_data (list_of_transactions):
    """ Saves list of transaction to a file"""

    # Ask user for name of the output file, sort the list of transactions by date
    # and save the data using the following format:
    # date:transaction_type:amount
    # Display a message that data was saved to the output file.
    print ('Save Data Function')
            
if __name__ == '__main__':
    main()