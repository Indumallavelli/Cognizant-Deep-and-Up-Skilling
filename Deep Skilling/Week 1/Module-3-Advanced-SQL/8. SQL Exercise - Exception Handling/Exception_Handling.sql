USE CognizantDB;
GO

/*====================================================
Exercise 8 - Exception Handling
====================================================*/

/*====================================================
Create AuditLog Table
====================================================*/

IF OBJECT_ID('AuditLog','U') IS NULL
BEGIN
    CREATE TABLE AuditLog
    (
        LogID INT IDENTITY(1,1) PRIMARY KEY,
        Action VARCHAR(100),
        ErrorMessage VARCHAR(4000),
        ActionDate DATETIME DEFAULT GETDATE()
    );
END;
GO

/*====================================================
Question 1 : Basic TRY...CATCH
====================================================*/

CREATE OR ALTER PROCEDURE AddEmployee
(
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Salary DECIMAL(10,2),
    @DepartmentID INT
)
AS
BEGIN

BEGIN TRY

    INSERT INTO Employees
    (
        EmployeeID,
        FirstName,
        LastName,
        Salary,
        DepartmentID
    )
    VALUES
    (
        @EmployeeID,
        @FirstName,
        @LastName,
        @Salary,
        @DepartmentID
    );

    PRINT 'Employee Added Successfully';

END TRY

BEGIN CATCH

    INSERT INTO AuditLog
    (
        Action,
        ErrorMessage
    )
    VALUES
    (
        'Add Employee',
        ERROR_MESSAGE()
    );

    PRINT 'Error Logged';

END CATCH

END;
GO

EXEC AddEmployee
106,
'Rahul',
'Kumar',
45000,
1;
GO

/*====================================================
Question 2 : THROW
====================================================*/

CREATE OR ALTER PROCEDURE AddEmployee
(
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Salary DECIMAL(10,2),
    @DepartmentID INT
)
AS
BEGIN

BEGIN TRY

    INSERT INTO Employees
    (
        EmployeeID,
        FirstName,
        LastName,
        Salary,
        DepartmentID
    )
    VALUES
    (
        @EmployeeID,
        @FirstName,
        @LastName,
        @Salary,
        @DepartmentID
    );

END TRY

BEGIN CATCH

    INSERT INTO AuditLog
    (
        Action,
        ErrorMessage
    )
    VALUES
    (
        'Add Employee',
        ERROR_MESSAGE()
    );

    THROW;

END CATCH

END;
GO

/*====================================================
Question 3 : RAISERROR
====================================================*/

CREATE OR ALTER PROCEDURE AddEmployee
(
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Salary DECIMAL(10,2),
    @DepartmentID INT
)
AS
BEGIN

    IF @Salary <= 0
    BEGIN
        RAISERROR('Salary must be greater than zero.',16,1);
        RETURN;
    END

BEGIN TRY

    INSERT INTO Employees
    (
        EmployeeID,
        FirstName,
        LastName,
        Salary,
        DepartmentID
    )
    VALUES
    (
        @EmployeeID,
        @FirstName,
        @LastName,
        @Salary,
        @DepartmentID
    );

    PRINT 'Employee Added Successfully';

END TRY

BEGIN CATCH

    INSERT INTO AuditLog
    (
        Action,
        ErrorMessage
    )
    VALUES
    (
        'Add Employee',
        ERROR_MESSAGE()
    );

    PRINT 'Error Logged';

END CATCH

END;
GO

EXEC AddEmployee
107,
'Ramesh',
'Kumar',
-500,
1;
GO

/*====================================================
Question 4 : Nested TRY...CATCH
====================================================*/

CREATE OR ALTER PROCEDURE TransferEmployee
(
    @EmployeeID INT,
    @DepartmentID INT
)
AS
BEGIN

BEGIN TRY

    IF NOT EXISTS
    (
        SELECT *
        FROM Departments
        WHERE DepartmentID=@DepartmentID
    )
    BEGIN
        RAISERROR('Department does not exist.',16,1);
    END

    UPDATE Employees
    SET DepartmentID=@DepartmentID
    WHERE EmployeeID=@EmployeeID;

END TRY

BEGIN CATCH

    INSERT INTO AuditLog
    (
        Action,
        ErrorMessage
    )
    VALUES
    (
        'Transfer Employee',
        ERROR_MESSAGE()
    );

    THROW;

END CATCH

END;
GO

EXEC TransferEmployee 106,99;
GO

/*====================================================
Question 5 : Transaction
====================================================*/

CREATE OR ALTER PROCEDURE BatchInsertEmployees
AS
BEGIN

BEGIN TRY

    BEGIN TRANSACTION;

    INSERT INTO Employees
    VALUES
    (107,'Amit','Sharma',1,40000,NULL,NULL);

    INSERT INTO Employees
    VALUES
    (108,'Priya','Reddy',2,45000,NULL,NULL);

    COMMIT TRANSACTION;

END TRY

BEGIN CATCH

    ROLLBACK TRANSACTION;

    INSERT INTO AuditLog
    (
        Action,
        ErrorMessage
    )
    VALUES
    (
        'Batch Insert',
        ERROR_MESSAGE()
    );

END CATCH

END;
GO

EXEC BatchInsertEmployees;
GO

SELECT *
FROM Employees
WHERE EmployeeID IN (107,108);
GO

/*====================================================
Question 6 : Dynamic RAISERROR
====================================================*/

CREATE OR ALTER PROCEDURE AddEmployee
(
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Salary DECIMAL(10,2),
    @DepartmentID INT
)
AS
BEGIN

    IF @Salary < 0
    BEGIN
        RAISERROR('Salary cannot be negative.',16,1);
        RETURN;
    END

    IF @Salary < 1000
    BEGIN
        RAISERROR('Salary is very low.',10,1);
    END

    INSERT INTO Employees
    (
        EmployeeID,
        FirstName,
        LastName,
        Salary,
        DepartmentID
    )
    VALUES
    (
        @EmployeeID,
        @FirstName,
        @LastName,
        @Salary,
        @DepartmentID
    );

END;
GO

EXEC AddEmployee
109,
'Neha',
'Patel',
500,
1;
GO

/*====================================================
Verification Queries
====================================================*/

SELECT * FROM Employees;
GO

SELECT * FROM AuditLog;
GO