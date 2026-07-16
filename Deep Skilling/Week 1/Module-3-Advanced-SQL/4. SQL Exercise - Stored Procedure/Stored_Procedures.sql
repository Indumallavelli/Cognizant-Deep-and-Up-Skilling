USE CognizantDB;
GO

/*====================================================
Exercise 1 : Create a Stored Procedure
====================================================*/

CREATE PROCEDURE sp_GetEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT EmployeeID,
           FirstName,
           LastName,
           DepartmentID,
           Salary,
           JoinDate
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO

EXEC sp_GetEmployeesByDepartment 1;
GO

/*====================================================
Exercise 2 : Modify Stored Procedure
====================================================*/

ALTER PROCEDURE sp_GetEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT EmployeeID,
           FirstName,
           LastName,
           DepartmentID,
           Salary,
           JoinDate
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO

EXEC sp_GetEmployeesByDepartment 1;
GO

/*====================================================
Exercise 3 : Delete Stored Procedure
====================================================*/

DROP PROCEDURE sp_GetEmployeesByDepartment;
GO

/*====================================================
Exercise 4 : Create and Execute Stored Procedure
====================================================*/

CREATE PROCEDURE sp_GetEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT *
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO

EXEC sp_GetEmployeesByDepartment 1;
GO

/*====================================================
Exercise 5 : Return Employee Count
====================================================*/

CREATE PROCEDURE sp_GetEmployeeCount
    @DepartmentID INT
AS
BEGIN
    SELECT COUNT(*) AS TotalEmployees
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO

EXEC sp_GetEmployeeCount 1;
GO

/*====================================================
Exercise 6 : Output Parameter
====================================================*/

CREATE PROCEDURE sp_GetTotalSalary
    @DepartmentID INT,
    @TotalSalary DECIMAL(10,2) OUTPUT
AS
BEGIN
    SELECT @TotalSalary = SUM(Salary)
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO

DECLARE @Salary DECIMAL(10,2);

EXEC sp_GetTotalSalary
     @DepartmentID = 1,
     @TotalSalary = @Salary OUTPUT;

SELECT @Salary AS TotalSalary;
GO
/*====================================================
Exercise 7 : Update Employee Salary
====================================================*/

CREATE PROCEDURE sp_UpdateEmployeeSalary
    @EmployeeID INT,
    @NewSalary DECIMAL(10,2)
AS
BEGIN
    UPDATE Employees
    SET Salary = @NewSalary
    WHERE EmployeeID = @EmployeeID;
END;
GO

EXEC sp_UpdateEmployeeSalary 101,55000;
GO

SELECT * FROM Employees WHERE EmployeeID = 101;
GO

/*====================================================
Exercise 8 : Give Bonus
====================================================*/

CREATE PROCEDURE sp_GiveBonus
    @DepartmentID INT,
    @Bonus DECIMAL(10,2)
AS
BEGIN
    UPDATE Employees
    SET Salary = Salary + @Bonus
    WHERE DepartmentID = @DepartmentID;
END;
GO

EXEC sp_GiveBonus 1,500;
GO

SELECT * FROM Employees WHERE DepartmentID = 1;
GO

/*====================================================
Exercise 9 : Transactions
====================================================*/

CREATE PROCEDURE sp_UpdateSalaryTransaction
    @EmployeeID INT,
    @NewSalary DECIMAL(10,2)
AS
BEGIN
    BEGIN TRY

        BEGIN TRANSACTION;

        UPDATE Employees
        SET Salary = @NewSalary
        WHERE EmployeeID = @EmployeeID;

        COMMIT TRANSACTION;

    END TRY

    BEGIN CATCH

        ROLLBACK TRANSACTION;

        PRINT 'Transaction Failed';

    END CATCH
END;
GO

EXEC sp_UpdateSalaryTransaction 102,65000;
GO

/*====================================================
Exercise 10 : Dynamic SQL
====================================================*/

CREATE PROCEDURE sp_SearchEmployee
    @ColumnName NVARCHAR(50),
    @Value NVARCHAR(100)
AS
BEGIN

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL =
    'SELECT * FROM Employees WHERE '
    + QUOTENAME(@ColumnName)
    + ' = @SearchValue';

    EXEC sp_executesql
    @SQL,
    N'@SearchValue NVARCHAR(100)',
    @SearchValue=@Value;

END;
GO

EXEC sp_SearchEmployee 'FirstName','John';
GO

/*====================================================
Exercise 11 : TRY CATCH
====================================================*/

CREATE PROCEDURE sp_UpdateSalaryWithErrorHandling
    @EmployeeID INT,
    @NewSalary DECIMAL(10,2)
AS
BEGIN

BEGIN TRY

    UPDATE Employees
    SET Salary=@NewSalary
    WHERE EmployeeID=@EmployeeID;

    PRINT 'Salary Updated Successfully';

END TRY

BEGIN CATCH

    PRINT 'Error Updating Salary';

END CATCH

END;
GO

EXEC sp_UpdateSalaryWithErrorHandling 103,75000;
GO