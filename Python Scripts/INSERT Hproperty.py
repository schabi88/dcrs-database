import csv
newstring = "'"
counter = 0;
sqlString = "INSERT INTO Hproperty (name)"
newList = list()

with open('INSERT Hproperty.csv', 'r') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    for row in reader:
        for value in row:
            resultstring =  newstring + value + newstring
            newList.append(resultstring)
        print(sqlString)
        print("VALUES (" + ', '.join(newList) + ");")
        newList.clear()
        counter = 0

