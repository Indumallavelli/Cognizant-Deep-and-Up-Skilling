USE CognizantDB;
GO

/*====================================================
Exercise 2 - SQL Indexes
====================================================*/

/*====================================================
Exercise 1 : Non-Clustered Index
====================================================*/

-- Before Index

SELECT *
FROM Products
WHERE ProductName = 'Laptop';
GO

-- Create Non-Clustered Index

CREATE NONCLUSTERED INDEX IX_ProductName
ON Products(ProductName);
GO

-- After Index

SELECT *
FROM Products
WHERE ProductName = 'Laptop';
GO


/*====================================================
Exercise 2 : Clustered Index
====================================================*/

-- Create Demo Table

CREATE TABLE Orders_ClusteredDemo
(
    OrderID INT,
    CustomerID INT,
    OrderDate DATE
);
GO

-- Insert Sample Data

INSERT INTO Orders_ClusteredDemo VALUES
(1,1,'2023-01-15'),
(2,2,'2023-02-20'),
(3,3,'2023-03-25'),
(4,4,'2023-04-30');
GO

-- Before Index

SELECT *
FROM Orders_ClusteredDemo
WHERE OrderDate='2023-01-15';
GO

-- Create Clustered Index

CREATE CLUSTERED INDEX IX_OrderDate
ON Orders_ClusteredDemo(OrderDate);
GO

-- After Index

SELECT *
FROM Orders_ClusteredDemo
WHERE OrderDate='2023-01-15';
GO


/*====================================================
Exercise 3 : Composite Index
====================================================*/

-- Before Index

SELECT *
FROM Orders
WHERE CustomerID = 1
AND OrderDate = '2025-01-05';
GO

-- Create Composite Index

CREATE NONCLUSTERED INDEX IX_Customer_OrderDate
ON Orders(CustomerID, OrderDate);
GO

-- After Index

SELECT *
FROM Orders
WHERE CustomerID = 1
AND OrderDate = '2025-01-05';
GO