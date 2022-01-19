# -*- coding: utf-8 -*-
"""
Michael Pultorak 
List Exercise

Python Crash Course
CH 3 & 4 
"""

### Numbers 1 through 6 (strings)

todo_list = ['math homework', 'finish paper', 'read', 'physics homework', 'civil engineering homework']

todo_list[2] = 'python homework'

due_tuesday =  todo_list[-2]

todo_list.append('fix mountain bike')

todo_list.insert(4, 'read')

due_monday = todo_list.pop(2)

total_todo = len(todo_list)

print(f"Finish today: {due_monday} \nFinish by Tuesday: {due_tuesday} \nTotal to do: {total_todo}")

### Numbers 7 through 9 (numbers)

numbers_list = list(range(-10, 16))


print(min(numbers_list))
print(max(numbers_list))

v1 = numbers_list[2]**2
v2 = v1 / numbers_list[12]
print(f"Number: {v2}")

### Numbers 10 through 11

cubes = []
for cube in numbers_list[:11]:
    cube = cube**3
    cubes.append(cube)
    
print(cubes)