CREATE DATABASE universitycoursemanagement;
USE universitycoursemanagement;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(150),
    BirthDate DATE,
    EnrollmentDate DATE
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(150),
    DepartmentID INT,
    Credits INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(150),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Mathematics');

INSERT INTO Students VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01'),
(3, 'Sam', 'Green', 'sam.green@univ.com', '2001-02-02', '2023-01-15');

INSERT INTO Courses VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4),
(103, 'Algorithms', 1, 5);

INSERT INTO Instructors VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2),
(3, 'Carol', 'Ng', 'carol.ng@univ.com', 1);

INSERT INTO Enrollments VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01'),
(3, 1, 102, '2023-09-02');

SELECT * FROM Students
WHERE EnrollmentDate > '2022-12-31';

SELECT CourseID, CourseName, Credits
FROM Courses
WHERE DepartmentID = 2
LIMIT 5;

SELECT C.CourseID, C.CourseName, COUNT(E.StudentID) AS TotalStudents
FROM Courses C
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY C.CourseID, C.CourseName
HAVING COUNT(E.StudentID) > 5;

SELECT StudentID, FirstName, LastName
FROM Students
WHERE StudentID IN (
    SELECT StudentID
    FROM Enrollments
    WHERE CourseID IN (101,102)
    GROUP BY StudentID
    HAVING COUNT(DISTINCT CourseID)=2
);

SELECT DISTINCT S.StudentID, S.FirstName, S.LastName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
WHERE E.CourseID IN (101,102);

SELECT AVG(Credits) AS AvgCredits FROM Courses;

ALTER TABLE Instructors ADD Salary DECIMAL(10,2);

UPDATE Instructors SET Salary =
CASE
    WHEN InstructorID = 1 THEN 80000
    WHEN InstructorID = 2 THEN 70000
    ELSE 60000
END;

SELECT MAX(Salary) AS MaxSalary
FROM Instructors
WHERE DepartmentID = 1;

SELECT D.DepartmentName, COUNT(DISTINCT E.StudentID) AS TotalStudents
FROM Departments D
LEFT JOIN Courses C ON D.DepartmentID = C.DepartmentID
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY D.DepartmentName;

SELECT S.StudentID, S.FirstName, C.CourseName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
JOIN Courses C ON E.CourseID = C.CourseID;

SELECT S.StudentID, S.FirstName, C.CourseName
FROM Students S
LEFT JOIN Enrollments E ON S.StudentID = E.StudentID
LEFT JOIN Courses C ON E.CourseID = C.CourseID;

SELECT *
FROM Students
WHERE StudentID IN (
    SELECT StudentID FROM Enrollments
    WHERE CourseID IN (
        SELECT CourseID
        FROM Enrollments
        GROUP BY CourseID
        HAVING COUNT(*) > 10
    )
);

SELECT StudentID, FirstName, YEAR(EnrollmentDate) AS YearOfEnrollment
FROM Students;

SELECT InstructorID, CONCAT(FirstName,' ',LastName) AS FullName
FROM Instructors;

SELECT EnrollmentID, EnrollmentDate,
       COUNT(*) OVER (ORDER BY EnrollmentDate) AS RunningCount
FROM Enrollments;

SELECT StudentID, FirstName, LastName,
       CASE  
           WHEN TIMESTAMPDIFF(YEAR, EnrollmentDate, CURDATE()) > 4 THEN 'Senior'
           ELSE 'Junior'
       END AS Level
FROM Students;
