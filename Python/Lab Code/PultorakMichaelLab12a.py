def main():
    import random
    number1 = random.randint (1, 10)
    number2 = random.randint (1, 10)
    print ('What is', number1, '+', number2, '?')
    answer = int(input ('? '))

    if answer == number1 + number2:
        print ('Your answer is correct')
    else:
        print ('Nope! The correct answer is', number1 + number2)
    
       
