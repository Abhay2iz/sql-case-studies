/* =====================================================================
   CASE STUDY 2: EMPLOYEE DATABASE — SOLUTIONS
   Tables: LOCATION, DEPARTMENT, JOB, EMPLOYEE
   Platform: Microsoft SQL Server (SSMS)
   Run schema/create_tables.sql first before executing these queries.
   ===================================================================== */


/* =====================================================================
   SIMPLE QUERIES
   ===================================================================== */

-- 1. List all employee details
SELECT * FROM EMPLOYEE;

-- 2. List all department details
SELECT * FROM DEPARTMENT;

-- 3. List all job details
SELECT * FROM JOB;

-- 4. List all locations
SELECT * FROM LOCATION;

-- 5. First Name, Last Name, Salary, Commission
SELECT First_Name, Last_Name, Salary, Comm FROM EMPLOYEE;

-- 6. Employee ID, Last Name, Department ID with aliases
SELECT Employee_Id AS Emp_Id, Last_Name AS Emp_Name, Department_Id AS Dep_id
FROM EMPLOYEE;

-- 7. Annual salary with employee names
SELECT First_Name, Last_Name, Salary * 12 AS Annual_Salary
FROM EMPLOYEE;


/* =====================================================================
   WHERE CONDITION
   ===================================================================== */

-- 1. Details about Smith
SELECT * FROM EMPLOYEE WHERE Last_Name = 'Smith';

-- 2. Employees in department 20
SELECT * FROM EMPLOYEE WHERE Department_Id = 20;

-- 3. Salary between 2000 and 3000
SELECT * FROM EMPLOYEE WHERE Salary BETWEEN 2000 AND 3000;

-- 4. Working in department 10 or 20
SELECT * FROM EMPLOYEE WHERE Department_Id IN (10, 20);

-- 5. NOT working in department 10 or 30
SELECT * FROM EMPLOYEE WHERE Department_Id NOT IN (10, 30);

-- 6. Name starts with 'L'
SELECT * FROM EMPLOYEE WHERE Last_Name LIKE 'L%';

-- 7. Name starts with 'L' and ends with 'E'
SELECT * FROM EMPLOYEE WHERE Last_Name LIKE 'L%E';

-- 8. Name length is 4 and starts with 'J'
SELECT * FROM EMPLOYEE WHERE Last_Name LIKE 'J___';

-- 9. Department 30 and salary more than 2500
SELECT * FROM EMPLOYEE WHERE Department_Id = 30 AND Salary > 2500;

-- 10. Employees not receiving commission (NULL)
SELECT * FROM EMPLOYEE WHERE Comm IS NULL;


/* =====================================================================
   ORDER BY CLAUSE
   ===================================================================== */

-- 1. Employee ID and Last Name ascending by Employee ID
SELECT Employee_Id, Last_Name FROM EMPLOYEE ORDER BY Employee_Id ASC;

-- 2. Employee ID and Name descending by salary
SELECT Employee_Id, First_Name, Last_Name FROM EMPLOYEE ORDER BY Salary DESC;

-- 3. All employee details ascending by Last Name
SELECT * FROM EMPLOYEE ORDER BY Last_Name ASC;

-- 4. Last Name ascending, Department ID descending
SELECT * FROM EMPLOYEE ORDER BY Last_Name ASC, Department_Id DESC;


/* =====================================================================
   GROUP BY AND HAVING CLAUSE
   ===================================================================== */

-- 1. Department-wise MAX, MIN, AVG salary
SELECT Department_Id, MAX(Salary) AS Max_Salary, MIN(Salary) AS Min_Salary, AVG(Salary) AS Avg_Salary
FROM EMPLOYEE
GROUP BY Department_Id;

-- 2. Job-wise MAX, MIN, AVG salary
SELECT Job_Id, MAX(Salary) AS Max_Salary, MIN(Salary) AS Min_Salary, AVG(Salary) AS Avg_Salary
FROM EMPLOYEE
GROUP BY Job_Id;

-- 3. Number of employees joined each month (ascending)
SELECT MONTH(Hire_Date) AS Month, COUNT(*) AS Num_Employees
FROM EMPLOYEE
GROUP BY MONTH(Hire_Date)
ORDER BY Month ASC;

-- 4. Number of employees for each month and year (ascending)
SELECT YEAR(Hire_Date) AS Year, MONTH(Hire_Date) AS Month, COUNT(*) AS Num_Employees
FROM EMPLOYEE
GROUP BY YEAR(Hire_Date), MONTH(Hire_Date)
ORDER BY Year ASC, Month ASC;

-- 5. Department ID having at least 4 employees
SELECT Department_Id, COUNT(*) AS Num_Employees
FROM EMPLOYEE
GROUP BY Department_Id
HAVING COUNT(*) >= 4;

-- 6. Employees joined in February
SELECT COUNT(*) AS Feb_Joiners
FROM EMPLOYEE
WHERE MONTH(Hire_Date) = 2;

-- 7. Employees joined in May or June
SELECT COUNT(*) AS May_June_Joiners
FROM EMPLOYEE
WHERE MONTH(Hire_Date) IN (5, 6);

-- 8. Employees joined in 1985
SELECT COUNT(*) AS Joiners_1985
FROM EMPLOYEE
WHERE YEAR(Hire_Date) = 1985;

-- 9. Employees joined each month in 1985
SELECT MONTH(Hire_Date) AS Month, COUNT(*) AS Num_Employees
FROM EMPLOYEE
WHERE YEAR(Hire_Date) = 1985
GROUP BY MONTH(Hire_Date)
ORDER BY Month ASC;

-- 10. Employees joined in April 1985
SELECT COUNT(*) AS April_1985_Joiners
FROM EMPLOYEE
WHERE YEAR(Hire_Date) = 1985 AND MONTH(Hire_Date) = 4;

-- 11. Department ID with >= 3 employees joining in April 1985
SELECT Department_Id, COUNT(*) AS Num_Employees
FROM EMPLOYEE
WHERE YEAR(Hire_Date) = 1985 AND MONTH(Hire_Date) = 4
GROUP BY Department_Id
HAVING COUNT(*) >= 3;


/* =====================================================================
   JOINS
   ===================================================================== */

-- 1. Employees with their department names
SELECT e.*, d.Name AS Department_Name
FROM EMPLOYEE e
JOIN DEPARTMENT d ON e.Department_Id = d.Department_Id;

-- 2. Employees with their designations
SELECT e.*, j.Designation
FROM EMPLOYEE e
JOIN JOB j ON e.Job_Id = j.Job_ID;

-- 3. Employees with department names and city
SELECT e.First_Name, e.Last_Name, d.Name AS Department_Name, l.City
FROM EMPLOYEE e
JOIN DEPARTMENT d ON e.Department_Id = d.Department_Id
JOIN LOCATION l ON d.Location_Id = l.Location_ID;

-- 4. Employees count in each department with department name
SELECT d.Name AS Department_Name, COUNT(e.Employee_Id) AS Num_Employees
FROM EMPLOYEE e
JOIN DEPARTMENT d ON e.Department_Id = d.Department_Id
GROUP BY d.Name;

-- 5. Employees working in Sales department
SELECT COUNT(*) AS Sales_Employees
FROM EMPLOYEE e
JOIN DEPARTMENT d ON e.Department_Id = d.Department_Id
WHERE d.Name = 'Sales';

-- 6. Departments with >= 3 employees (ascending order)
SELECT d.Name AS Department_Name, COUNT(e.Employee_Id) AS Num_Employees
FROM EMPLOYEE e
JOIN DEPARTMENT d ON e.Department_Id = d.Department_Id
GROUP BY d.Name
HAVING COUNT(e.Employee_Id) >= 3
ORDER BY d.Name ASC;

-- 7. Employees working in Dallas
SELECT COUNT(*) AS Dallas_Employees
FROM EMPLOYEE e
JOIN DEPARTMENT d ON e.Department_Id = d.Department_Id
JOIN LOCATION l ON d.Location_Id = l.Location_ID
WHERE l.City = 'Dallas';

-- 8. Employees in Sales or Operations departments
SELECT e.*
FROM EMPLOYEE e
JOIN DEPARTMENT d ON e.Department_Id = d.Department_Id
WHERE d.Name IN ('Sales', 'Operations');


/* =====================================================================
   CONDITIONAL STATEMENT
   ===================================================================== */

-- 1. Employee details with salary grade
SELECT *,
    CASE
        WHEN Salary < 1000                THEN 'Grade A'
        WHEN Salary BETWEEN 1000 AND 2000 THEN 'Grade B'
        WHEN Salary BETWEEN 2001 AND 3000 THEN 'Grade C'
        ELSE                                    'Grade D'
    END AS Grade
FROM EMPLOYEE;

-- 2. Number of employees grade-wise
SELECT
    CASE
        WHEN Salary < 1000                THEN 'Grade A'
        WHEN Salary BETWEEN 1000 AND 2000 THEN 'Grade B'
        WHEN Salary BETWEEN 2001 AND 3000 THEN 'Grade C'
        ELSE                                    'Grade D'
    END AS Grade,
    COUNT(*) AS Num_Employees
FROM EMPLOYEE
GROUP BY
    CASE
        WHEN Salary < 1000                THEN 'Grade A'
        WHEN Salary BETWEEN 1000 AND 2000 THEN 'Grade B'
        WHEN Salary BETWEEN 2001 AND 3000 THEN 'Grade C'
        ELSE                                    'Grade D'
    END;

-- 3. Salary grades and employee count between 2000–5000
SELECT
    CASE
        WHEN Salary BETWEEN 2000 AND 3000 THEN 'Grade C'
        WHEN Salary BETWEEN 3001 AND 4000 THEN 'Grade D'
        WHEN Salary BETWEEN 4001 AND 5000 THEN 'Grade E'
    END AS Grade,
    COUNT(*) AS Num_Employees
FROM EMPLOYEE
WHERE Salary BETWEEN 2000 AND 5000
GROUP BY
    CASE
        WHEN Salary BETWEEN 2000 AND 3000 THEN 'Grade C'
        WHEN Salary BETWEEN 3001 AND 4000 THEN 'Grade D'
        WHEN Salary BETWEEN 4001 AND 5000 THEN 'Grade E'
    END;


/* =====================================================================
   SUBQUERIES
   ===================================================================== */

-- 1. Employees with maximum salary
SELECT * FROM EMPLOYEE
WHERE Salary = (SELECT MAX(Salary) FROM EMPLOYEE);

-- 2. Employees working in Sales department
SELECT * FROM EMPLOYEE
WHERE Department_Id = (SELECT Department_Id FROM DEPARTMENT WHERE Name = 'Sales');

-- 3. Employees working as Clerk
SELECT * FROM EMPLOYEE
WHERE Job_Id = (SELECT Job_ID FROM JOB WHERE Designation = 'Clerk');

-- 4. Employees living in Boston
SELECT * FROM EMPLOYEE
WHERE Department_Id IN (
    SELECT d.Department_Id FROM DEPARTMENT d
    JOIN LOCATION l ON d.Location_Id = l.Location_ID
    WHERE l.City = 'Boston'
);

-- 5. Number of employees in Sales department
SELECT COUNT(*) AS Sales_Count FROM EMPLOYEE
WHERE Department_Id = (SELECT Department_Id FROM DEPARTMENT WHERE Name = 'Sales');

-- 6. Update salary of Clerks by 10%
UPDATE EMPLOYEE
SET Salary = Salary * 1.10
WHERE Job_Id = (SELECT Job_ID FROM JOB WHERE Designation = 'Clerk');

-- 7. Second highest salary employee details
SELECT * FROM EMPLOYEE
WHERE Salary = (
    SELECT MAX(Salary) FROM EMPLOYEE
    WHERE Salary < (SELECT MAX(Salary) FROM EMPLOYEE)
);

-- 8. Employees earning more than EVERY employee in department 30
SELECT * FROM EMPLOYEE
WHERE Salary > ALL (SELECT Salary FROM EMPLOYEE WHERE Department_Id = 30);

-- 9. Departments with no employees
SELECT * FROM DEPARTMENT
WHERE Department_Id NOT IN (SELECT DISTINCT Department_Id FROM EMPLOYEE);

-- 10. Employees earning more than their department's average salary
SELECT * FROM EMPLOYEE e
WHERE Salary > (
    SELECT AVG(Salary) FROM EMPLOYEE
    WHERE Department_Id = e.Department_Id
);
