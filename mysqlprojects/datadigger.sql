CREATE DATABASE datadigger;
USE datadigger;

/*Customers Tables....*/
CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(100),
Email VARCHAR(100),
Address VARCHAR(200)
);

INSERT INTO Customers (CustomerID,CustomerName,Email,Address)
VALUES
(101,"Arnob Maity","arnobadhirmaity@gmail.com","Vatva,Ahmedabad"),
(102,"Nandish Patel","nandishpatel@gmail.com","Maninagar,Ahmedabad"),
(103,"Happy Yadav","happyyadav@gmail.com","Ghodasar,Ahmedabad"),
(104,"Soham Maity","sohammaity@gmail.com","Vatva,Ahmedabad"),
(105,"Akash Nandi","akashnand123@gmail.com","Narol,Ahmedabad");


SELECT * FROM Customers;

UPDATE Customers SET Address = "Vatva,Ahmedabad" WHERE CustomerID = 104;

DELETE FROM Customers WHERE CustomerID = 105;

SELECT * FROM Customers WHERE CustomerName ="Arnob Maity";

/*Orders Tables....*/
CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
TotalAmount Decimal(10,2),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID,CustomerID,OrderDate,TotalAmount)
VALUES
(2001,102,"2025-11-16", 2000.00),
(2002,101,"2025-11-17", 3000.00),
(2003,103,"2025-11-10", 2505.50),
(2004,104,"2025-11-12", 1150.20),
(2005,103,"2025-11-11", 4505.60);

SELECT * FROM Orders WHERE CustomerID = 101;

UPDATE Orders SET TotalAmount = 1100.00 WHERE OrderID = 2003;

DELETE FROM Orders WHERE OrderDate = 2005;

SELECT * FROM Orders WHERE OrderDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

SELECT MAX(TotalAmount) AS HighestOrder, MIN(TotalAmount) AS LowestOrder, AVG(TotalAmount) AS AverageOrder FROM Orders;

/*Products table....*/
CREATE TABLE Products(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Price DECIMAL(10,2),
Stock INT
);

INSERT INTO Orders (ProductID,ProductName,Price,Stock)
VALUES
(3001,"Monitor", 5000.00, 30),
(3002,"Keyboard", 1500.00. 25),
(3003,"Wired-Mouse", 499.50, 40),
(3004,"USB-C Cable", 250.50, 50),
(3005,"Speaker", 2000.00, 15);

SELECT * FROM Products ORDER BY Price DESC;

SELECT * FROM Products WHERE Price BETWEEN 500 AND 3000;

UPDATE Products SET Price = 950.00 WHERE ProductID = 3003;

DELETE FROM Products WHERE STock = 15;

SELECT MAX(Price) AS MostExpensivePrice, MIN(Price) AS CheapestPrice FROM Products;

/*OrderDetails Table....*/
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY, 
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, SubTotal) VALUES
(4001, 2001, 3001, 1, 5000.00),
(4002, 2002, 3002, 2, 1800.00),
(4003, 2001, 3004, 1, 1899.00),
(4004, 2003, 3002, 1, 850.00),
(4005, 2005, 3001, 3, 14999.00);

SELECT * FROM OrderDetails WHERE OrderID = 2002;

SELECT SUM(SubTotal) AS TotalRevenue FROM OrderDetails;

SELECT t1.ProductID, t2.ProductName, 
SUM(t1.Quantity) AS TotalQuantitySold FROM OrderDetails
t1 JOIN Products t2 ON t1.ProductID = t2.ProductID 
GROUP BY t1.ProductID, t2.ProductName 
ORDER BY TotalQuantitySold DESC LIMIT 3;



