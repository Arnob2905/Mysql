CREATE DATABASE datatransformer;
USE datatransformer;


CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(100),
LastName VARCHAR(100),
Email VARCHAR(100),
RegistrationDate DATE
);

INSERT INTO Customers (CustomerID,FirstName,LastName,Email,RegistrationDate)
VALUES
(1,"John","Doe","john.doe@email.com",'2022-03-15'),
(2,"Jane","Smith","jane.smith@email.com",'2021-11-02');



CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
TotalAmount DECIMAL(12,2),
 CONSTRAINT fk_orders_customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID,CustomerID,OrderDate,TotalAmount)
VALUES
(101,1,'2023-07-01',150.50),
(102,2,'2023-07-03',200.75),
(103,1,'2023-08-10',1200.00);

CREATE TABLE Employees(
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(100),
LastName VARCHAR(100),
Department VARCHAR(100),
HireDate DATE,
Salary DECIMAL(12,2)
);

INSERT INTO Employees (EmployeeID,FirstName,LastName,Department,HireDate,Salary)
VALUES
(1,"Mark","Johnson","Sales",'2020-01-15',50000.00),
(2,"Susan","Lee","HR",'2021-03-20',55000.00);


SELECT o.OrderID, o.OrderDate, o.TotalAmount,
	   c.CustomerID, c.FirstName, c.LastName
FROM Orders o INNER JOIN Customers c
ON o.CustomerID = c.CustomerID;   


SELECT c.CustomerID, c.FirstName, c.LastName, 
       o.OrderID, o.TotalAmount
       FROM Customers c LEFT JOIN Orders o
       ON c.CustomerID = o.CustomerID;
       
SELECT o.OrderID, o.TotalAmount,
       c.CustomerID, c.FirstName, c.LastName
       FROM Orders o RIGHT JOIN Customers c
       ON o.CustomerID = c.CustomerID;
       

SELECT c.CustomerID, c.FirstName, c.LastName,
       o.OrderID, o.TotalAmount
FROM Customers c LEFT JOIN Orders o 
ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerID, c.FirstName, c.LastName,
       o.OrderID, o.TotalAmount
       FROM Customers c RIGHT JOIN Orders o
       ON c.CustomerID = o.CustomerID;
       
SELECT *
FROM Customers WHERE CustomerID IN(
SELECT CustomerID
FROM Orders
WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Orders)
);       
	
SELECT * FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees);  

SELECT OrderID,
       YEAR(OrderDate) AS OrderYear,
       MONTH(OrderDate) AS OrderMonth
FROM Orders;       


SELECT OrderID,
       DATEDIFF(CURDATE(), OrderDate) AS DaysDifference
FROM Orders;       
       

SELECT OrderID,
       DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedDate
FROM Orders;


SELECT CONCAT(FirstName,' ',LastName) AS FullName
FROM Customers;

SELECT REPLACE(FirstName,"John", "Jonathan") AS UpdatedName
FROM Customers;

SELECT UPPER(FirstName) AS FirstNameUpper,
       LOWER(LastName) AS LastNameLower
FROM Customers;

SELECT TRIM(Email) AS TrimmedEmail
FROM Customers;


SELECT OrderID, TotalAmount,
SUM(TotalAmount) OVER (ORDER BY OrderDate) AS RunningTotal
FROM Orders;


SELECT OrderID, TotalAmount,
      RANK() OVER (ORDER BY TotalAmount DESC) AS AmountRank
FROM Orders; 

SELECT OrderID, TotalAmount,
    CASE
        WHEN TotalAmount > 1000 THEN "10% Discount"
        WHEN TotalAmount > 500  THEN "5% Discount"
        ELSE "NO Discount"
    END AS Discount
FROM Orders;    


SELECT EmployeeID, FirstName, Salary,
     CASE
         WHEN Salary >= 55000 THEN "High"
         WHEN Salary >= 50000 THEN "Medium"
         ELSE "Low"
      END AS SalaryCategory
FROM Employees;      

       
       
       

