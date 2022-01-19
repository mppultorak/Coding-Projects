# Michael
# Pultorak
# 03/01/21
# Description: Lab 5. This lab is developing skills in str opperations

def main():
    first = input('Please enter your first name: ')
    last = input('Please enter you last name: ')

    print(f'Your username is: {last.lower() + first[0].lower()}')
    
    print(f'Your email address is: {first.lower()}.{last.lower()}@ucdenver.edu')

