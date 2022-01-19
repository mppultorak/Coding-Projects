# -*- coding: utf-8 -*-
"""
Michael Pultorak 
Fund Comp
Lab 4

Help used:
https://www.tutorialspoint.com/python/python_dictionary.htm
https://careerkarma.com/blog/python-add-to-dictionary/
https://stackoverflow.com/questions/19775692/use-and-meaning-of-in-in-an-if-statement
"""

words = {}
with open('rosalind_ini6.txt', 'r') as filew:
    for line in filew: 
        for word in line.split():
            if word in words:
                words[word] += 1
            else:
                words[word] = 1               
with open('output.txt', 'w') as out:
    for end in words: 
        out.write(f'{end} {words[end]} \n')