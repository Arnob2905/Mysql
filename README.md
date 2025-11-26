🏥 Hospital Management System - SQL Project

This project involves designing and implementing a relational database schema for a Hospital Management System using SQL. It includes creating tables, establishing relationships, populating data, and executing queries to manage and analyze hospital operations.

📝 Problem Statement

The goal is to design a Hospital Management System that enables the hospital administration to:

Manage Patients & Doctors: Add, update, delete, and search patient and doctor information.

Schedule Appointments: Assign patients to doctors and track appointments.

Handle Medical Records: Store patient diagnoses, prescriptions, and reports.

Manage Billing & Payments: Track patient invoices and payments.

Analyze Hospital Performance: Calculate total revenue, identify most visited departments, track patient history, etc.

💻 Database Schema (Tables & Relationships)

Patients

Primary Key: patient_id

Foreign Key: None

Description: Stores patient demographics and registration details.

Doctors

Primary Key: doctor_id

Foreign Key: None

Description: Stores doctor profiles, specialization, availability, and consultation fees.

Departments

Primary Key: department_id

Foreign Key: None

Description: Stores a list of hospital departments.

Appointments

Primary Key: appointment_id

Foreign Keys: patient_id, doctor_id

Description: Records scheduled, completed, or cancelled appointments.

Medical_Records

Primary Key: record_id

Foreign Keys: patient_id, doctor_id

Description: Stores patient medical history, diagnoses, and prescriptions.

Billings

Primary Key: invoice_id

Foreign Keys: patient_id, appointment_id

Description: Tracks billing information, amounts, and payment status.

Doctor_Department

Primary Key: Composite key (doctor_id, department_id)

Description: Maps doctors to one or more departments (Many-to-Many relationship).

🛠 SQL Implementation Details

Schema Definition and Data Population

Tables created with appropriate data types and constraints.

Primary Key and Foreign Key relationships established.

Sample data inserted for testing queries.

CRUD Operations

Create: INSERT statements to populate tables.

Read: SELECT queries to display table contents.

Update: UPDATE statements to modify records.

Delete: DELETE statements to remove records.

Core SQL Query Tasks

SQL Clauses: WHERE, HAVING, LIMIT (e.g., patients registered last year).

SQL Operators: AND, OR, NOT (e.g., appointments where status = 'Scheduled' AND doctor_id = 3).

Sorting & Grouping: ORDER BY, GROUP BY (e.g., number of patients per doctor).

Aggregate Functions: SUM, AVG, MAX, MIN, COUNT (e.g., total revenue from paid bills).

Advanced SQL Query Tasks

Joins: INNER, LEFT, RIGHT, FULL OUTER (e.g., doctors with department names).

Subqueries: (e.g., doctors handling more than 50 patients).

Date & Time Functions: Extract month, calculate stay duration, format dates.

String Functions: UPPER, TRIM, REPLACE.

Window Functions

Rank doctors by patients treated.

Cumulative revenue per month.

Running total of appointments.

SQL CASE Expressions

Assign Patient_Risk_Level based on medical records count:

High: >5 records

Medium: 3-5 records

Low: otherwise

Categorize doctors based on years of experience (conceptual):

Senior: >15 years

Mid-Level: 5-15 years

Junior: otherwise

🔗 How to Run the Project

Setup Database: Create Hospital_management_sql database in your preferred SQL environment (MySQL, PostgreSQL, etc.).

Execute SQL Script: Run the provided SQL script containing all CREATE TABLE, INSERT, UPDATE, DELETE, and SELECT statements in order.

🎯 Project Achievements

This project demonstrates proficiency in:

Database schema design and normalization.

Implementing Primary and Foreign Key constraints.

Executing CRUD operations.

Writing complex queries with joins, subqueries, and aggregates.

Applying advanced SQL features like Window Functions and CASE Expressions for analysis and reporting.
