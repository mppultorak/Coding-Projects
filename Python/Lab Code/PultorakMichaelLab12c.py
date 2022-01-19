def main():

    count = 0
    sum = 0
    infile = open ('data2.txt', 'r')

    lines = infile.readlines()
    while lines != "":
        for line in lines:
            line = line.split(',')
            for num in line:
                sum = sum + float (num)
                count = count + 1
        lines = infile.readline()

            
    infile.close()

    average = sum / count

    print ('Number of data:', count)
    print ('Sum of numbers is:', sum)
    print ('Average is: {0:.2f}'.format(average))
    