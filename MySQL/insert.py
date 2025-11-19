import mysql.connector as MyConn

# mydb=MyConn.connect(host="localhost",user="root",password="arnobmaity29",database="Dataanalyst")
# db_cursor=mydb.cursor()
# db_insert="insert into Emp(Roll,Ename) values(%s,%s)"
# db_list=[(30,"Akhil"),(40,"Altah"),(13,"Ram")]
# db_cursor.executemany(db_insert,db_list)

# mydb.commit()
# print(db_cursor.rowcount, "Record Inserted")
CREATE TABLE Employee (
    EmployeeId INT PRIMARY KEY,
    Name VARCHAR(255),
    Gender VARCHAR(10),
    Salary DECIMAL(10, 2),
    Department VARCHAR(255),
    Experience VARCHAR(255)
);

INSERT INTO Employee (EmployeeId, Name, Gender, Salary, Department, Experience)
VALUES (5, 'Priya Sharma', 'Female', 45000, 'IT', '2 years');

INSERT INTO Employee (EmployeeId, Name, Gender, Salary, Department, Experience)
VALUES (6, 'Rahul Patel', 'Male', 65000, 'Sales', '5 years');

INSERT INTO Employee (EmployeeId, Name, Gender, Salary, Department, Experience)
VALUES (7, 'Nisha Gupta', 'Female', 55000, 'Marketing', '4 years');

INSERT INTO Employee (EmployeeId, Name, Gender, Salary, Department, Experience)
VALUES (8, 'Vikram Singh', 'Male', 75000, 'Finance', '7 years');

INSERT INTO Employee (EmployeeId, Name, Gender, Salary, Department, Experience)
VALUES (9, 'Aarti Desai', 'Female', 50000, 'IT', '3 years');

INSERT INTO Employee (EmployeeId, Name, Gender, Salary, Department, Experience)
VALUES (9, 'Aarti Desai', 'Female', 50000, 'IT', '3 years');