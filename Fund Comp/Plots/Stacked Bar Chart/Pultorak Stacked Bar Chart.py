# -*- coding: utf-8 -*-
"""
Michael Pultorak 
Fund Comp Dev 

Creating plots section 2
"""

import matplotlib.pyplot as pyplot

xval = ['Q1', 'Q2', 'Q3', 'Q4', 'Q5']
t1_yval = [24,55,53,49,44]
t2_yval = [25,33,55,50,51]
standev_t1 = [2,5,4,3,4]
standev_t2 = [3,5,2,5,6]
width = 0.5

figure, xaxis = pyplot.subplots()

xaxis.bar(xval, t1_yval, width, yerr=standev_t1, label = 'Team 1', color = 'g')
xaxis.bar(xval, t2_yval, width, yerr=standev_t2, bottom=t1_yval, label = 'Team 2', color = 'y')

xaxis.set_ylabel('Scores per quarter')
xaxis.set_title('Scores per quarter per team')
xaxis.legend()

pyplot.show()
