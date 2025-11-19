CREATE DATABASE SCHOOL;
USE SCHOOL;

CREATE TABLE CAREER(
StudentID INT PRIMARY KEY,
StudentName VARCHAR(100),
Branch VARCHAR(100),
Marks INT,
Fees INT,
City VARCHAR(100),
Age INT,
Gender VARCHAR(100)
);


INSERT INTO CAREER     -- Inserting Table:
(StudentID,StudentName,Branch,Marks,Fees,City,Age,Gender)

VALUES -- Assigning Data:
(1,"Arnob Maity","RNW3",88,118000,"Maninagar",19,"Male"),
(2,"Nandish Patel","RNW3",98,125000,"Maninagar",18,"Male"),
(3,"Krina Suthar","RNW3",100,125000,"Maninagar",20,"Female"),
(4,"Rajvi Patel","RNW3",68,50000,"Maninagar",25,"Female"),
(5,"Rahul Yadav","RNW1",71,118000,"Surat",20,"Male"),
(6,"Amit Pal","RNW2",77,128000,"Bhopal",17,"Male"),
(7,"Sujal Dey","RNW1",84,138000,"Surat",23,"Male"),
(8,"Shivansh Rajpoot","RNW3",78,150000,"Maninagar",20,"Male"),
(9,"Eren Kumar","RNW2",62,120000,"Bhopal",19,"Male"),
(10,"Meet Shah","RNW1",72,132000,"Surat",25,"Male"),
(11,"Ronak Das","RNW2",95,112000,"Bhopal",16,"Male"),
(12,"Happy Yadav","RNW1",83,118000,"Surat",19,"Male");


