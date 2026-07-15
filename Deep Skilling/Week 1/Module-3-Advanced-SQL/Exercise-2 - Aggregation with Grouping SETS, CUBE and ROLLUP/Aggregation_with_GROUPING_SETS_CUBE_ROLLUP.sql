USE CognizantDB;
GO

/*----------------------------------------------------
  CREATE TABLES
----------------------------------------------------*/

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Region VARCHAR(50)
);
GO

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
GO

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO

/*----------------------------------------------------
  INSERT DATA
----------------------------------------------------*/

INSERT INTO Customers VALUES
(1,'Rahul','North'),
(2,'Priya','South'),
(3,'Amit','East'),
(4,'Sneha','West');
GO

INSERT INTO Orders VALUES
(101,1,'2025-01-05'),
(102,2,'2025-01-08'),
(103,3,'2025-01-10'),
(104,4,'2025-01-15');
GO

INSERT INTO OrderDetails VALUES
(1,101,1,2),
(2,101,2,5),
(3,102,5,1),
(4,103,4,3),
(5,104,8,2),
(6,104,9,4);
GO

/*----------------------------------------------------
  GROUPING SETS
----------------------------------------------------*/

SELECT
    c.Region,
    p.Category,
    SUM(od.Quantity) AS TotalQuantity
FROM Orders o
JOIN Customers c
    ON o.CustomerID = c.CustomerID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
JOIN Products p
    ON od.ProductID = p.ProductID
GROUP BY GROUPING SETS
(
    (c.Region, p.Category),
    (c.Region),
    (p.Category)
);
GO

/*----------------------------------------------------
  ROLLUP
----------------------------------------------------*/

SELECT
    c.Region,
    p.Category,
    SUM(od.Quantity) AS TotalQuantity
FROM Orders o
JOIN Customers c
    ON o.CustomerID = c.CustomerID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
JOIN Products p
    ON od.ProductID = p.ProductID
GROUP BY ROLLUP
(
    c.Region,
    p.Category
);
GO

/*----------------------------------------------------
  CUBE
----------------------------------------------------*/

SELECT
    c.Region,
    p.Category,
    SUM(od.Quantity) AS TotalQuantity
FROM Orders o
JOIN Customers c
    ON o.CustomerID = c.CustomerID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
JOIN Products p
    ON od.ProductID = p.ProductID
GROUP BY CUBE
(
    c.Region,
    p.Category
);
GO