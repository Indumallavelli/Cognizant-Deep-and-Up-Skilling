USE CognizantDB;
GO

/*====================================================
Exercise 7 - Cursors
====================================================*/

/*====================================================
Exercise 1 : Create a Cursor
====================================================*/

DECLARE
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2),
    @JoinDate DATE;

DECLARE EmployeeCursor CURSOR
FOR
SELECT EmployeeID,
       FirstName,
       LastName,
       DepartmentID,
       Salary,
       JoinDate
FROM Employees;

OPEN EmployeeCursor;

FETCH NEXT FROM EmployeeCursor
INTO
@EmployeeID,
@FirstName,
@LastName,
@DepartmentID,
@Salary,
@JoinDate;

WHILE @@FETCH_STATUS = 0
BEGIN

    PRINT
    'EmployeeID: '
    + CAST(@EmployeeID AS VARCHAR)
    + '  Name: '
    + @FirstName
    + ' '
    + @LastName
    + '  Salary: '
    + CAST(@Salary AS VARCHAR);

    FETCH NEXT FROM EmployeeCursor
    INTO
    @EmployeeID,
    @FirstName,
    @LastName,
    @DepartmentID,
    @Salary,
    @JoinDate;

END;

CLOSE EmployeeCursor;

DEALLOCATE EmployeeCursor;

GO


/*====================================================
Exercise 2 : Static Cursor
====================================================*/

DECLARE StaticCursor CURSOR STATIC
FOR
SELECT *
FROM Employees;

OPEN StaticCursor;

PRINT 'Static Cursor Created Successfully';

CLOSE StaticCursor;

DEALLOCATE StaticCursor;

GO


/*====================================================
Exercise 2 : Dynamic Cursor
====================================================*/

DECLARE DynamicCursor CURSOR DYNAMIC
FOR
SELECT *
FROM Employees;

OPEN DynamicCursor;

PRINT 'Dynamic Cursor Created Successfully';

CLOSE DynamicCursor;

DEALLOCATE DynamicCursor;

GO


/*====================================================
Exercise 2 : Forward Only Cursor
====================================================*/

DECLARE ForwardCursor CURSOR FORWARD_ONLY
FOR
SELECT *
FROM Employees;

OPEN ForwardCursor;

PRINT 'Forward Only Cursor Created Successfully';

CLOSE ForwardCursor;

DEALLOCATE ForwardCursor;

GO


/*====================================================
Exercise 2 : Keyset Cursor
====================================================*/

DECLARE KeysetCursor CURSOR KEYSET
FOR
SELECT *
FROM Employees;

OPEN KeysetCursor;

PRINT 'Keyset Cursor Created Successfully';

CLOSE KeysetCursor;

DEALLOCATE KeysetCursor;

GO