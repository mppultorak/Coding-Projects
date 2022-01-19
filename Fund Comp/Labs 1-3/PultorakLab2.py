# -*- coding: utf-8 -*-
"""
Michael Pultorak 
Lab 2

Help used: 
    Module 3: Stings and more 
    Python Crash Course: page 21
"""

name = input("Please enter your name: ")
age = input("Please enter your age: ")

if int(age) > 60:
    print(f"Hello, {name}! Your age is: {age} \n . . . Wow! you are old! ")
else:
    print(f"Hello, {name}! Your age is: {age}")
