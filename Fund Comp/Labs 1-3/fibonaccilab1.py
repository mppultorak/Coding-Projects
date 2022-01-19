# -*- coding: utf-8 -*-
"""
Name: Michael Pultorak
Assignment: Lab 1 
"""

i = input("Enter a number: ")
i = int(i)
count = 0
var1 = 0 
var2 = 1

while count < i:
    print(var2)
    var3 = var2 + var1
    var1 = var2 
    var2 = var3 
    count+=1