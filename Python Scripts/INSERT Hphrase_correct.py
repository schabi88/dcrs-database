import csv
newstring = "'"
counter = 0;
sqlString = "INSERT INTO Hphrase (name, description, category_number, code, property_id, category_id)"
newList = list()

with open('INSERT Hphrase.csv', 'r') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    for row in reader:
        for value in row:
            counter += 1
            if(counter <=4):
                if(value != 'NULL'):
                    resultstring = newstring + value + newstring
                    newList.append(resultstring)
                else:
                    resultstring = value
                    newList.append(resultstring)
            if(counter >=5 and counter <7):
                resultstring = value
                newList.append(resultstring)
        print(sqlString)
        print("VALUES (" + ', '.join(newList) + ");")
        newList.clear()
        counter = 0

