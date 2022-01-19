# -*- coding: utf-8 -*-
"""
Michael Pultorak 
Fund Comp Dev 

Creating plots section 3
"""

from alpha_vantage.techindicators import TechIndicators
import matplotlib.pyplot as blt

ti = TechIndicators(key="72EB5LMOXIRPOOPX", output_format = 'pandas')

data, meta_data = ti.get_bbands(symbol='Gold', interval = '60min', time_period = 60)
data.plot()
blt.title('BBands Indication for Gold stock (60days)')
blt.show()
