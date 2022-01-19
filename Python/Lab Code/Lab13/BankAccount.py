# BankAccount.py
# Name: Michael Pultorak
# Date: 04/26/21

class BankAccount:
    """BankAccount class keeps track of the balance of a bank account
    and allows changed to be made to the value."""

    def __init__(self):
        """Initializes starting balance as zero."""
        self.balance = 0

    def deposit(self, amount):
        """Deposit method allows for the addition to the total bank account.
        Returns True if transaction was successful.
        Returns False if transaction failed."""
        if amount < 0:
            return False
        else:
            self.balance += amount
            return True

    def withdraw(self, amount):
        """Withdraw method allows for the subtraction to the total bank account.
        Returns True if transaction was successful.
        Returns False if transaction failed."""
        if amount > self.balance or amount < 0:
            return False
        else:
            self.balance -= amount
            return True

    def getBalance(self):
        """Get balance method returns the current bank account balance."""
        return self.balance




