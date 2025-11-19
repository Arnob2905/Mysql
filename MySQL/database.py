import mysql.connector as MyConn

mydb=MyConn.connect(host="localhost",user="root",password="arnobmaity29")
db_cursor=mydb.cursor()

db_cursor.execute("create database DataAnalyst")

print("Database Created....!!")