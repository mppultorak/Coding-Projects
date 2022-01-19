# Name: Michael Pultorak
# Class: CSCI 1411-001
# Due Date: 02/22/21
# Description: Use a custom libary to graph objects into console 

import graphics
from graphics import *
import time

def main():

    ### Sets window name to relevant title based on student
    winName = 'Lab4 MichaelPultorak'
    ### Asks for the color of the first circle
    color1 = input ("What color would you like the circle to be? ")
    ### Asks for the location of the first circle
    x1, y1 = eval (input ("what are the x, y coordinates of the center of circle? "))
    ### Asks for the radius of the first circle
    radius1 = eval(input("what is the radius of the circle? "))

    win = GraphWin(winName, 500, 500)
    center1 = Point (x1, y1)
    circ1 = Circle(center1, radius1)
    circ1.setFill (color1)
    circ1.draw (win)
    
    ### Sets color of second circle to green
    color2 = 'green'
    ### Places second circle directly above the first circle
    x2, y2 = x1, y1-(2*radius1)
    ### Sets radius of second circle to half of the first circle
    radius2 = (radius1/2)
    
    center2 = Point (x2, y2)
    circ2 = Circle(center2, radius2)
    circ2.setFill (color2)
    circ2.draw (win)
    line = Line(center1, center2)
    line.setFill('red')
    line.draw(win)

    ### Uses for loop to execute code three times
    for i in range (3):
        ### Moves second circle to the right of the first circle for the first mouse click 
        if i == 0:   
            win.getMouse()
            circ2.move(2*radius1,2*radius1)
        ### Moves second circle to the bottom of the first circle for the second mouse click     
        elif i == 1:
            win.getMouse()
            circ2.move(-2*radius1,2*radius1)
        ### Moves second circle to the left of the first circle for the third mouse click     
        else:
            win.getMouse()
            circ2.move(-2*radius1,-2*radius1)
        ### Draws line to the position of the second circle
        line.undraw()
        newCenter = circ2.getCenter()
        line = Line(center1, circ2.getCenter())
        line.setFill('red')
        line.draw(win)
