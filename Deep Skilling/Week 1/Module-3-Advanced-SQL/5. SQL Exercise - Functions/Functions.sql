USE CognizantDB;
GO

/*====================================================
Exercise 5 - Functions
====================================================*/

/*====================================================
Exercise 1 : Scalar Function
====================================================*/

CREATE FUNCTION fn_CalculateAnnualSalary
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salary * 12;
END;
GO

SELECT
EmployeeID,
FirstName,
Salary,
dbo.fn_CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees;
GO


/*====================================================
Exercise 2 : Table Valued Function
====================================================*/

CREATE FUNCTION fn_GetEmployeesByDepartment
(
    @DepartmentID INT
)

RETURNS TABLE

AS

RETURN
(
    SELECT *
    FROM Employees
    WHERE DepartmentID=@DepartmentID
);
GO

SELECT *
FROM dbo.fn_GetEmployeesByDepartment(2);
GO


/*====================================================
Exercise 3 : User Defined Function
====================================================*/

CREATE FUNCTION fn_CalculateBonus
(
    @Salary DECIMAL(10,2)
)

RETURNS DECIMAL(10,2)

AS
BEGIN

RETURN @Salary*0.10;

END;
GO

SELECT
EmployeeID,
FirstName,
Salary,
dbo.fn_CalculateBonus(Salary) AS Bonus
FROM Employees;
GO


/*====================================================
Exercise 4 : Modify Function
====================================================*/

ALTER FUNCTION fn_CalculateBonus
(
    @Salary DECIMAL(10,2)
)

RETURNS DECIMAL(10,2)

AS
BEGIN

RETURN @Salary*0.15;

END;
GO

SELECT
EmployeeID,
FirstName,
Salary,
dbo.fn_CalculateBonus(Salary) AS Bonus
FROM Employees;
GO


/*====================================================
Exercise 5 : Delete Function
====================================================*/

DROP FUNCTION fn_CalculateBonus;
GO

/*====================================================
Exercise 6 : Execute Scalar Function
====================================================*/

SELECT
    EmployeeID,
    FirstName,
    dbo.fn_CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees;
GO


/*====================================================
Exercise 7 : Annual Salary for EmployeeID = 1
====================================================*/

SELECT
    EmployeeID,
    FirstName,
    dbo.fn_CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees
WHERE EmployeeID = 101;
GO


/*====================================================
Exercise 8 : Execute Table Valued Function
====================================================*/

SELECT *
FROM dbo.fn_GetEmployeesByDepartment(2);
GO


/*====================================================
Exercise 9 : Recreate Bonus Function
====================================================*/

CREATE FUNCTION fn_CalculateBonus
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salary * 0.15;
END;
GO


/*====================================================
Exercise 9 : Nested Function
====================================================*/

CREATE FUNCTION fn_CalculateTotalCompensation
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN dbo.fn_CalculateAnnualSalary(@Salary)
         + dbo.fn_CalculateBonus(@Salary);
END;
GO

SELECT
    EmployeeID,
    FirstName,
    Salary,
    dbo.fn_CalculateTotalCompensation(Salary) AS TotalCompensation
FROM Employees;
GO


/*====================================================
Exercise 10 : Modify Nested Function
====================================================*/

ALTER FUNCTION fn_CalculateTotalCompensation
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN dbo.fn_CalculateAnnualSalary(@Salary)
         + (@Salary * 0.20);
END;
GO

SELECT
    EmployeeID,
    FirstName,
    Salary,
    dbo.fn_CalculateTotalCompensation(Salary) AS TotalCompensation
FROM Employees;
GO