# Michael Pultorak Q2
def string_middlechrs(string):
    if len(string) <= 7:
        raise ValueError('Incorrect length')
    elif len(string) % 2 == 0: 
        raise ValueError('Not odd')
    middle = len(string) // 2
    out = string[middle-1] + string[middle] + string[middle+1]
    return out
