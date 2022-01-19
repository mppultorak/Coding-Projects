# -*- coding: utf-8 -*-
"""
Michael Pultorak 
Fund Comp Dev 

Creating plots section 1
"""

import matplotlib.pyplot as pyplot

x = [0,1,2,3,4,5,6,7,8,9,10]
y = [1,2,4,8,16,32,64,128,256,512,1024]

pyplot.scatter(x,y, label = 'powers of two', color = 'r')
pyplot.xlabel('n')
pyplot.ylabel('2^n')
pyplot.title('Scatter plot example')
pyplot.legend()

for i in range(0, len(x)):
    pyplot.annotate(xy = [x[i], y[i]], s = y[i])

pyplot.yscale('log')

pyplot.show()