
ida = 100
pin = 151
with open('user_file.txt', 'r') as user_data:
    text = user_data.readlines()
    for line in text:
        line = line.strip()
        line = line.split(':')
        print(line)
        if line == [str(ida), str(pin)]:
            print('Work')