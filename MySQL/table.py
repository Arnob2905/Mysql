import mysql.connector as MyConn

mydb=MyConn.connect(host="localhost",user="root",password="arnobmaity29",database="Dataanalyst")
db_cursor=mydb.cursor()
db_cursor.execute("show tables")
for i in db_cursor:
    print(i)
















































