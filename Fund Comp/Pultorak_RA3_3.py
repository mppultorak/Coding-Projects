# Michael Pultorak Q3
def repeating_chrs(string):
    repos = []
    rep = []
    for letter in string:
        if letter in repos and letter not in rep:
            rep.append(letter)
        repos.append(letter)
    return ''.join(rep)
