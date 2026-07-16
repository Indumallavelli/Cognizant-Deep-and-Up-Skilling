USE CognizantDB;
GO

/*====================================================
Exercise 3 - Views
====================================================*/

/*----------------------------------------------------
Create Tables
----------------------------------------------------*/

CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);
GO

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    JoinDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
GO

/*----------------------------------------------------
Insert Sample Data
----------------------------------------------------*/

INSERT INTO Departments VALUES
(1,'Human Resources'),
(2,'Finance'),
(3,'IT'),
(4,'Marketing');
GO

INSERT INTO Employees VALUES
(101,'John','Smith',1,50000,'2022-01-10'),
(102,'Alice','Johnson',2,60000,'2021-05-15'),
(103,'David','Brown',3,70000,'2020-08-20'),
(104,'Emma','Wilson',4,55000,'2023-02-01');
GO

/*====================================================
Exercise 1
Simple View
====================================================*/

CREATE VIEW vw_EmployeeBasicInfo AS
SELECT
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    d.DepartmentName
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID;
GO

SELECT * FROM vw_EmployeeBasicInfo;
GO

/*====================================================
Exercise 2
Full Name View
====================================================*/

CREATE VIEW vw_EmployeeFullName AS
SELECT
    EmployeeID,
    FirstName + ' ' + LastName AS FullName
FROM Employees;
GO

SELECT * FROM vw_EmployeeFullName;
GO

/*====================================================
Exercise 3
Annual Salary View
====================================================*/

CREATE VIEW vw_EmployeeAnnualSalary AS
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    Salary * 12 AS AnnualSalary
FROM Employees;
GO

SELECT * FROM vw_EmployeeAnnualSalary;
GO

/*====================================================
Exercise 4
Employee Report View
====================================================*/

CREATE VIEW vw_EmployeeReport AS
SELECT
    e.EmployeeID,
    e.FirstName + ' ' + e.LastName AS FullName,
    d.DepartmentName,
    Salary * 12 AS AnnualSalary,
    (Salary * 12) * 0.10 AS Bonus
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID;
GO

SELECT * FROM vw_EmployeeReport;
GO