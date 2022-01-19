# -*- coding: utf-8 -*-
"""
Michael Pultorak 
Fund Comp Dev 

Milestone Lab - Data Viz & Using APIs
Help Used:
https://towardsdatascience.com/5-methods-to-remove-the-from-your-data-in-python-and-the-fastest-one-281489382455
https://stackabuse.com/how-to-format-dates-in-python/
https://kodify.net/python/math/truncate-integers/
https://note.nkmk.me/en/python-function-return-multiple-values/
https://stackoverflow.com/questions/11005814/how-can-i-append-in-reverse-python
"""

### Imports needed libaries
import math
import csv
from datetime import datetime
from matplotlib import pyplot as blt

### Spend function for selling stock
def spend(z, x, y):
    sa = z*x
    snum = math.trunc(sa/y)
    cost = snum*y
    return cost, snum 
    
### Opens excel file    
filename = 'SNE_CNY.csv'
with open(filename) as inf:
    sd = csv.reader(inf)
    header_row = next(sd)
    dates, prices = [], []
    ### Iterates over collums in excel file and appends date, low, high, closing, and opening prices.
    for row in sd:
        current_date = datetime.strptime(row[0], '%m/%d/%Y')
        dates.append(current_date)
        c = float(row[1].replace('$',''))
        prices.append(c)
        h = float(row[4].replace('$',''))
        prices.append(h)
        l = float(row[5].replace('$',''))
        prices.append(l)
        o = float(row[3].replace('$',''))
        prices.append(o)

### Set variables to iterate over        
count = 0       
record = []
bank = 10000
stock = 0 
### Iterates over prices list starting at opening for each day 
for day in prices[::-1]:
    ### Checks to see if there is enough money to purchase at least one stock:
    if bank/day < 1: 
        ### If not sells all stock at $88
        if day >= 88:
            bank += stock * day
            stock = 0
        ### Else sells 30% of stock at 84%
        elif day >= 84:
            bank += math.trunc(.3*stock) * day
            stock -= math.trunc(.3*stock)
        continue 
    ### If there is enough money to purchase at least one stock:
    else:
        ### If the day is less than $76, buy all
        if day <= 76:
            temp = spend(1, bank, day)
            stock += temp[1]
            bank -= temp[0]
        ### If day is less than $83 buy %30 of money avaiable
        elif day <= 83:
            temp = spend(.3, bank, day)
            stock += temp[1]
            bank -= temp[0]
    ### Retricts y value for graph to len of x value
    if count < len(dates):
        record.insert(0,(bank + (stock * day)))
    count += 1
      
### Graphs data obtained
blt.style.use('seaborn') 
fig, ax = blt.subplots()
ax.plot(dates, record, c='red')
blt.title("Stock and bank total value (USD)", fontsize=23)
blt.xlabel('', fontsize=16)
fig.autofmt_xdate()
blt.ylabel("US Dollars", fontsize=16)
blt.tick_params(axis='both', which='major', labelsize=16)
blt.show()
