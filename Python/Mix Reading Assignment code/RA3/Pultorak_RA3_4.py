# Michael Pultorak Q4
def display(infile):
    out = []
    count = 0
    with open(infile, 'r') as file:
        lines = file.readlines()
    for line in lines:
        line = line.split()
        for char in line:
            if len(char) < 5:
                out.append(char)
                if char[0].isupper() == True:
                    count += 1
    return out, count
