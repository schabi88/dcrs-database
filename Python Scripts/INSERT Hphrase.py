import csv
newstring = "'"
counter = 0;
sqlString = "INSERT INTO Hphrase (name, description, category_number, code, property_id, category_id)"
newList_string = list()
newList_int = list()
newList_null = list()

with open('INSERT Hphrase.csv', 'r') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    for row in reader:
        for value in row:
            counter += 1
            if(counter == 5):
                if(value != 'NULL'):
                    resultstring_int = int(value)
                    newList_int.append(resultstring_int)
                else:
                    resultstring_null = value
                    newList_null.append(resultstring_null)
            elif(counter == 6):
                resultstring_int = int(value)
                newList_int.append(resultstring_int)
            else:
                resultstring = newstring + value + newstring
                newList_string.append(resultstring)

        print(sqlString)
        print("VALUES (" + ', '.join(newList_string) + ", " + ', '.join(newList_null) + ', ' + str(newList_int[0]) + ");")
        newList_string.clear()
        newList_int.clear()
        newList_null.clear()
        counter = 0

