# Register.py
# Name: Michael Pultorak
# Date: 04/26/21

from BankAccount import BankAccount
def main():
    bank = BankAccount()
    num = float(input('Please enter number of transactions: '))
    i = 0
    transaction_number = 0
    while i < num:
        typ = input('Please enter type of transaction [deposit / withdraw]: ')
        amount = float(input('Please enter amount of transaction: '))
        if typ == 'deposit':
            x = bank.deposit(amount)
            if x == False:
                print(f'Value {amount} is less than zero. Please enter positive numbers. Transaction rejected.')
            else:
                transaction_number += 1
                print(f'Transaction successful. Current balence: {bank.getBalance():.2f}')
            i += 1
        else:
            x = bank.withdraw(amount)
            if x == False:
                print(f' Value {amount} is less than total in bank: {bank.getBalance():.2f} Transaction rejected.')
            else:
                transaction_number += 1
                print(f'Transaction successful. Current balence: {bank.getBalance():.2f}')
            i += 1
    print(f'{transaction_number} transactions have been completed. \nFinal balance: {bank.getBalance():.2f}')
