CREATE DATABASE Hospital_management_sql;
USE Hospital_management_sql;


CREATE TABLE Patients(
    Patient_id INT PRIMARY KEY,
    PatientName VARCHAR(50),
    D_O_B DATE,
    Gender VARCHAR(20),
    Phone_Number VARCHAR(15),
    Email VARCHAR(50),
    Address VARCHAR(100),
    Registration_Date DATE
);


CREATE TABLE Doctors(
    Doctor_id INT PRIMARY KEY,
    DoctorName VARCHAR(50),
    Specialization VARCHAR(50),
    Phone_Number VARCHAR(15),
    Email VARCHAR(50),
    Available_Days VARCHAR(50),
    Consultation_fee DECIMAL(10,2)
);


CREATE TABLE Appointments(
    Appointment_id INT PRIMARY KEY,
    Patient_id INT,
    Doctor_id INT,
    Appointment_Date DATE,
    Status VARCHAR(50),
    FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id),
    FOREIGN KEY (Doctor_id) REFERENCES Doctors(Doctor_id)
);


CREATE TABLE Medical_Records(
    Record_id INT PRIMARY KEY,
    Patient_id INT,
    Doctor_id INT,
    Diagnosis VARCHAR(100),
    Prescription VARCHAR(200),
    Treatment_Date DATE,
    FOREIGN KEY(Patient_id) REFERENCES Patients(Patient_id),
    FOREIGN KEY(Doctor_id) REFERENCES Doctors(Doctor_id)
);


CREATE TABLE Billings(
    Invoice_id INT PRIMARY KEY,
    Patient_id INT,
    Appointment_id INT,
    Amount DECIMAL(10,2),
    Payment_Status VARCHAR(50),
    Payment_Date DATE,
    FOREIGN KEY(Patient_id) REFERENCES Patients(Patient_id),
    FOREIGN KEY(Appointment_id) REFERENCES Appointments(Appointment_id)
);


CREATE TABLE Departments(
    Department_id INT PRIMARY KEY,
    Department_Name VARCHAR(50)
);


CREATE TABLE Doctor_Department(
    Doctor_id INT,
    Department_id INT,
    FOREIGN KEY(Doctor_id) REFERENCES Doctors(Doctor_id),
    FOREIGN KEY(Department_id) REFERENCES Departments(Department_id)
);

-- 1. CRUD Operations.....

INSERT INTO Patients VALUES
(1, 'Rahul Sharma', '1990-05-10', 'Male', '9876543210', 'rahul@mail.com', 'Mumbai', '2024-01-12'),
(2, 'Priya Patel', '1988-07-15', 'Female', '9865321470', 'priya@mail.com', 'Ahmedabad', '2024-02-05'),
(3, 'Amit Mehta', '1995-10-20', 'Male', '9822456710', 'amit@mail.com', 'Surat', '2024-03-01'),
(4, 'Neha Singh', '1992-03-18', 'Female', '9812345678', 'neha@mail.com', 'Delhi', '2024-04-10'),
(5, 'Rohit Gupta', '1985-12-30', 'Male', '9898765432', 'rohit@mail.com', 'Pune', '2024-04-22'),
(6, 'Anjali Verma', '1998-08-25', 'Female', '9801234567', 'anjali@mail.com', 'Jaipur', '2024-05-11'),
(7, 'Kunal Desai', '1993-11-12', 'Male', '9877012345', 'kunal@mail.com', 'Vadodara', '2024-06-01');


INSERT INTO Doctors VALUES
(101, 'Dr. Arjun Deshmukh', 'Cardiology', '9001112233', 'arjun@mail.com', 'Mon-Wed-Fri', 800.00),
(102, 'Dr. Sneha Nair', 'Dermatology', '9002223344', 'sneha@mail.com', 'Tue-Thu-Sat', 600.00),
(103, 'Dr. Ravi Kumar', 'Orthopedics', '9003334455', 'ravi@mail.com', 'Mon-Tue-Fri', 750.00),
(104, 'Dr. Pooja Shah', 'Pediatrics', '9004445566', 'pooja@mail.com', 'Wed-Fri-Sat', 500.00),
(105, 'Dr. Manish Jain', 'Neurology', '9005556677', 'manish@mail.com', 'Mon-Thu-Sat', 900.00),
(106, 'Dr. Kavita Joshi', 'Gynecology', '9006667788', 'kavita@mail.com', 'Tue-Fri-Sat', 700.00),
(107, 'Dr. Sagar Patel', 'ENT', '9007778899', 'sagar@mail.com', 'Mon-Wed-Sat', 550.00);


INSERT INTO Appointments VALUES
(199, 1, 101, '2024-06-01', 'Completed'),
(188, 2, 102, '2024-06-03', 'Cancelled'),
(158, 3, 103, '2024-06-05', 'Scheduled'),
(142, 4, 104, '2024-06-07', 'Completed'),
(125, 5, 105, '2024-06-10', 'Cancelled'),
(122, 6, 106, '2024-06-12', 'Completed'),
(101, 7, 107, '2024-06-14', 'Scheduled');


INSERT INTO Medical_Records VALUES
(20, 1, 101, 'High BP', 'Medicine A1', '2024-06-01'),
(40, 2, 102, 'Skin Allergy', 'Cream B2', '2024-06-03'),
(60, 3, 103, 'Knee Pain', 'Tablet C3', '2024-06-05'),
(80, 4, 104, 'Fever', 'Syrup D4', '2024-06-07'),
(100, 5, 105, 'Migraine', 'Medicine E5', '2024-06-10'),
(120, 6, 106, 'Hormonal Issue', 'Tablet F6', '2024-06-12'),
(140, 7, 107, 'Ear Infection', 'Drops G7', '2024-06-14');


INSERT INTO Billings VALUES
(240, 1, 199, 800.00, 'Paid', '2024-06-01'),
(250, 2, 188, 600.00, 'Cancelled', '2024-06-03'),
(260, 3, 158, 750.00, 'Pending', NULL),
(270, 4, 142, 500.00, 'Paid', '2024-06-07'),
(280, 5, 125, 900.00, 'Cancelled', '2024-06-10'),
(290, 6, 122, 700.00, 'Paid', '2024-06-12'),
(300, 7, 101, 550.00, 'Pending', NULL);


INSERT INTO Departments VALUES
(21, 'Cardiology'),
(22, 'Dermatology'),
(23, 'Orthopedics'),
(24, 'Pediatrics'),
(25, 'Neurology'),
(26, 'Gynecology'),
(27, 'ENT');


INSERT INTO Doctor_Department VALUES
(101, 21),
(102, 22),
(103, 23),
(104, 24),
(105, 25),
(106, 26),
(107, 27);


select * from Patients;
select * from Doctors;
select * from Appointments;
select * from Medical_Records;
select * from Billings;
select * from Departments;
select * from Doctor_Department;

UPDATE Patients SET Phone_Number = '9999999999', Address = 'Chennai' WHERE Patient_id = 3;
UPDATE Doctors SET Consultation_fee = 1500.00 WHERE Doctor_id in (101,105);
UPDATE Appointments SET Status = 'Completed' WHERE Appointment_id = 158;
UPDATE Medical_Records SET Prescription = 'Tablet Z9' WHERE Record_id = 20;
UPDATE Billings SET Payment_Status = 'Paid', Payment_Date = '2024-06-18' WHERE Invoice_id = 260;
UPDATE Departments SET Department_Name = 'Advanced Neurology' WHERE Department_id = 25;
UPDATE Doctor_Department SET Department_id = 21 WHERE Doctor_id = 101;


DELETE FROM Patients WHERE Patient_id = 8;
DELETE FROM Doctors WHERE Doctor_id = 108;
DELETE FROM Appointments WHERE Appointment_id = 200;
DELETE FROM Medical_Records WHERE Record_id = 160;
DELETE FROM Billings WHERE Invoice_id = 310;
DELETE FROM Departments WHERE Department_id = 28;
DELETE FROM Doctor_Department WHERE Doctor_id = 101 AND Department_id = 23;

select * from Patients;
select * from Doctors;
select * from Appointments;
select * from Medical_Records;
select * from Billings;
select * from Departments;
select * from Doctor_Department;

-- 2. Use SQL Clause(WHERE,HAVING,LIMIT).....

SELECT * FROM Patients WHERE YEAR(Registration_Date) in (2024);
SELECT Patient_id, Amount 
FROM Billings
ORDER BY Amount DESC
LIMIT 5;
SELECT Doctor_id,DoctorName,Specialization,Consultation_fee
FROM Doctors WHERE Consultation_fee > 1000;

-- 3. Apply SQL Clause(AND,OR,NOT).....
SELECT * FROM Appointments WHERE Status in('Scheduled') AND Doctor_id in (3);
SELECT * FROM Doctors WHERE Specialization in ('Cardiology') OR ('Neurology');
SELECT *
FROM Patients
WHERE Patient_id NOT IN (
    SELECT Patient_id
    FROM Appointments
    WHERE Appointment_Date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
);

-- 4. Sorting & Grouping Data.....
SELECT DoctorName, Specialization FROM Doctors ORDER BY Specialization;
SELECT Doctor_id, 
COUNT(*) AS Total_Patients
FROM Appointments
GROUP BY Doctor_id;




-- 5. Use Aggregate Functions.....
SELECT SUM(Amount) AS Total_Revenue 
FROM Billings
WHERE Payment_Status = 'Paid';
SELECT Doctor_id, COUNT(*) AS Total_Visits
FROM Appointments
GROUP BY Doctor_id
ORDER BY Total_Visits DESC
LIMIT 1;
SELECT AVG(Consultation_fee) AS Avg_Consultation_Fee
FROM Doctors;

-- 6. Establish Primary & Foreign Key Relationships....
-- i
/*ALTER TABLE Doctors
ADD CONSTRAINT Patient UNIQUE (Doctor_id, Patient_id);*/ -- already unique constraint exists

-- ii

/*ALTER TABLE 
ADD CONSTRAINT fk_Appointments
FOREIGN KEY (Appointment_id) REFERENCES Appointments(Appointment_id)
ON DELETE CASCADE
ON UPDATE CASCADE;*/ -- valid foreign key references already exists

-- 7. Implements Joins...
SELECT d.DoctorName, dept.Department_Name
FROM Doctors d
INNER JOIN Doctor_Department dd ON d.Doctor_id = dd.Doctor_id
INNER JOIN Departments dept ON dd.Department_id = dept.Department_id;

SELECT p.PatientName, a.Status
FROM Patients p
LEFT JOIN Appointments a ON p.Patient_id = a.Patient_id
WHERE a.Status = 'Completed';

SELECT a.Appointment_id, a.Appointment_Date
FROM Appointments a
RIGHT JOIN Billings b ON a.Appointment_id = b.Appointment_id
WHERE b.Amount IS NULL;

SELECT p.Patient_id, p.PatientName
FROM Patients p
LEFT JOIN Appointments a ON p.Patient_id = a.Patient_id
WHERE a.Appointment_id IS NULL
UNION
SELECT p.Patient_id, p.PatientName
FROM Patients p
RIGHT JOIN Appointments a ON p.Patient_id = a.Patient_id
WHERE a.Patient_id IS NULL;

-- 8. Use Subqueries...
SELECT Doctor_id, DoctorName
FROM Doctors
WHERE Doctor_id IN (
    SELECT Doctor_id
    FROM Appointments
    GROUP BY Doctor_id
    HAVING COUNT(Patient_id) > 50
);

SELECT Patient_id, PatientName
FROM Patients
WHERE Patient_id = (
    SELECT Patient_id
    FROM Billings
    GROUP BY Patient_id
    ORDER BY SUM(Amount) DESC
    LIMIT 1
);

SELECT *
FROM Appointments
WHERE Doctor_id IN (
    SELECT Doctor_id
    FROM Doctors
    WHERE Specialization = 'Dermatology'
);

-- 9. Implement Date & Time Functions....
SELECT Appointment_id,
    MONTH(Appointment_Date) AS Visit_Month
FROM Appointments;
SELECT Patient_id,
    DATEDIFF(Discharge_Date, Admission_Date) AS Stay_Duration
FROM Medical_Records;
SELECT Record_id,
    DATE_FORMAT(Treatment_Date, '%d-%m-%Y') AS Formatted_Date
FROM Medical_Records;

-- 10 . Use String Manipulation
SELECT UPPER(PatientName) AS PatientName
FROM Patients;
SELECT TRIM(DoctorName) AS Clean_Name
FROM Doctors;
SELECT PatientName,
    IFNULL(Phone_Number, "Not Available") AS Phone_Number
FROM Patients;

-- 11. Implement Window Functions...
SELECT 
    d.DoctorName,
    COUNT(a.Patient_id) AS Total_Patients,
    RANK() OVER (ORDER BY COUNT(a.Patient_id) DESC) AS Rank_Position
FROM Doctors d
JOIN Appointments a ON d.Doctor_id = a.Doctor_id
GROUP BY d.Doctor_id;

SELECT 
    DATE_FORMAT(Payment_Date, '%Y-%m') AS Month,
    SUM(Amount) AS Monthly_Revenue,
    SUM(SUM(Amount)) OVER (ORDER BY DATE_FORMAT(Payment_Date,'%Y-%m')) AS Cumulative_Revenue
FROM Billings
GROUP BY DATE_FORMAT(Payment_Date, '%Y-%m');

SELECT 
    Appointment_id,
    Appointment_Date,
    COUNT(*) OVER (ORDER BY Appointment_Date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Running_Total
FROM Appointments;

-- 12 Apply SQL CASE Expressions...
SELECT 
    p.PatientName,
    COUNT(mr.Record_id) AS Record_Count,
    CASE
        WHEN COUNT(mr.Record_id) > 5 THEN 'High'
        WHEN COUNT(mr.Record_id) BETWEEN 3 AND 5 THEN 'Medium'
        ELSE 'Low'
    END AS Patient_Risk_Level
FROM Patients p
LEFT JOIN Medical_Records mr ON p.Patient_id = mr.Patient_id
GROUP BY p.Patient_id;

SELECT 
    DoctorName,
    Exp_Years,
    CASE
        WHEN Exp_Years > 15 THEN 'Senior'
        WHEN Exp_Years BETWEEN 5 AND 15 THEN 'Mid-Level'
        ELSE 'Junior'
    END AS Doctor_Category
FROM Doctors;





































