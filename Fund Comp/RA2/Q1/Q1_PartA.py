# Finding len of ladder 
import math

height = float(input('Enter the height of the ladder against the wall: ')) # Height of ladder on wall
angle_deg = float(input('Enter the angle made by the ladder to the ground: ')) # Angle formed by ladder and ground

rad = angle_deg * math.pi / 180 # Degrees to radians

ladder_len = height / (math.sin(rad)) # Calulates len of ladder

print(f'The length of the ladder is: {ladder_len}') # Prints result
