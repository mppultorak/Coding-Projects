# Michael
# Pultorak
# Date: 03/18/21
# Description: Converting date format 

##############################################
# Function: DateConvert(<var>)
# Description: Converts date in m/d/y to text
# Perameter: date in form m/d/y
# Output: month day, year
##############################################
def dateConvert(date):
    months = ['January', 'February', 'March', 'April', 'May', 'June',
              'July', 'August','September', 'October', 'November','December']
    date = date.split('/')
    date[0] = months[int(date[0])-1]
    formated_date = f'{date[0]} {date[1]}, {date[2]}'
    return formated_date


##############################################
# Function: main()
# Description: Converts date from input
# Perameter: None
# Output: month day, year
##############################################
def main():
    date = input('Enter date: ')
    print(dateConvert(date))

