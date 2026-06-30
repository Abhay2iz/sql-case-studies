/* =====================================================================
   CASE STUDY 2: EMPLOYEE DATABASE — SCHEMA & SAMPLE DATA
   Platform: Microsoft SQL Server (SSMS)
   ===================================================================== */

CREATE DATABASE sqlcasestudy2;
GO
USE sqlcasestudy2;
GO


-- LOCATION Table
CREATE TABLE LOCATION (
    Location_ID INT PRIMARY KEY,
    City VARCHAR(50)
);

INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');


-- DEPARTMENT Table
CREATE TABLE DEPARTMENT (
    Department_Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Location_Id INT,
    FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);

INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);


-- JOB Table
-- FIX: original file created this table twice (once with Designation
-- VARCHAR(50), once with VARCHAR(20)) which would error on the 2nd
-- CREATE TABLE. Keeping a single definition here.
CREATE TABLE JOB (
    Job_ID INT PRIMARY KEY,
    Designation VARCHAR(50)
);

INSERT INTO JOB VALUES
(667, 'Clerk'),
(668, 'Staff'),
(669, 'Analyst'),
(670, 'Sales_Person'),
(671, 'Manager'),
(672, 'President');


-- EMPLOYEE Table
-- FIX: added PRIMARY KEY on Employee_Id (missing in original).
CREATE TABLE EMPLOYEE (
    Employee_Id   INT PRIMARY KEY,
    Last_Name     VARCHAR(20),
    First_Name    VARCHAR(20),
    Middle_Name   CHAR(1),
    Job_Id        INT FOREIGN KEY REFERENCES JOB(Job_ID),
    Manager_Id    INT,
    Hire_Date     DATE,
    Salary        INT,
    Comm          INT,
    Department_Id INT FOREIGN KEY REFERENCES DEPARTMENT(Department_Id)
);

INSERT INTO EMPLOYEE VALUES
(7369, 'Smith',  'John',    'Q', 667, 7902, '1984-12-17', 800,  NULL, 20),
(7499, 'Allen',  'Kevin',   'J', 670, 7698, '1984-02-20', 1600, 300,  30),
(7505, 'Doyle',  'Jean',    'K', 671, 7839, '1985-04-04', 2850, NULL, 30),
(7506, 'Dennis', 'Lynn',    'S', 671, 7839, '1985-05-15', 2750, NULL, 30),
(7507, 'Baker',  'Leslie',  'D', 671, 7839, '1985-06-10', 2200, NULL, 40),
(7521, 'Wark',   'Cynthia', 'D', 670, 7698, '1985-02-22', 1250, 500,  30);
