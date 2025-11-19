import mysql.connector as MyConn

mydb=MyConn.connect(host="localhost",user="root",password="arnobmaity29")
print(mydb,"Connection Created........")