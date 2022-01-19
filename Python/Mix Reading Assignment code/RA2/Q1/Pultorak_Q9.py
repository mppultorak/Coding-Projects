
def acronym():
    # Forming an acronym
    acr = '' # Empty str for the output
    prepos = [] # Empty list for the preposition

    phrase = input('Enter a phrase: ')  # Take input of phrase 
    quest = input('(y)|(n) Does this phrase have a preposition?: ') # Asks if a preposition is present

    if quest.lower() == 'y': # Checks responce of last input
        i = int(input('How many prepositions does it have?: ')) # Asks for number of prepositions
        for itter in range(i): 
            temp = input('Please enter one preposition: ') # Takes all prepositions in phrase
            prepos.append(temp.upper()) # Appends prepositions to list
        
        phrase = phrase.upper().split() # Splits phrase into list
        for ele in phrase: ####
            if ele in prepos: # Ignores values in phrase list that are listed as prepositions
                continue
            else:
                acr += ele[0] # Adds first character of values in list to str 
    print(f'The acronym is: {acr}') # Prints result
