CREATE DATABASE IF NOT EXISTS Dataanalyst;
USE Dataanalyst;

CREATE TABLE IF NOT EXISTS Employee (
    EmployeeId INT PRIMARY KEY,
    Name VARCHAR(255),
    Gender VARCHAR(10),
    Salary DECIMAL(10, 2),
    Department VARCHAR(255),
    Experience VARCHAR(255)
);

INSERT INTO Employee (EmployeeId, Name, Gender, Salary, Department, Experience)
VALUES 
(5, 'Priya Sharma', 'Female', 45000, 'IT', '2 years'),
(6, 'Rahul Patel', 'Male', 65000, 'Sales', '5 years'),
(7, 'Nisha Gupta', 'Female', 55000, 'Marketing', '4 years'),
(8, 'Vikram Singh', 'Male', 75000, 'Finance', '7 years'),
(9, 'Aarti Desai', 'Female', 50000, 'IT', '3 years');
