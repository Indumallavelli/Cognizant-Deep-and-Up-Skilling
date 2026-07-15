USE CognizantDB;
GO

/*====================================================
  EXERCISE 4
  PIVOT AND UNPIVOT
====================================================*/

/*----------------------------------------------------
Create Sales table
----------------------------------------------------*/

CREATE TABLE Sales
(
    SaleID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    SaleMonth VARCHAR(20),
    Quantity INT
);
GO

/*----------------------------------------------------
Insert Sample Data
----------------------------------------------------*/

INSERT INTO Sales VALUES
(1,'Laptop','January',10),
(2,'Laptop','February',12),
(3,'Laptop','March',8),
(4,'Mobile','January',20),
(5,'Mobile','February',18),
(6,'Mobile','March',15),
(7,'Refrigerator','January',5),
(8,'Refrigerator','February',6),
(9,'Refrigerator','March',4);
GO

/*----------------------------------------------------
Display Original Data
----------------------------------------------------*/

SELECT * FROM Sales;
GO

/*----------------------------------------------------
PIVOT
----------------------------------------------------*/

SELECT *
FROM
(
    SELECT ProductName, SaleMonth, Quantity
    FROM Sales
) AS SourceTable

PIVOT
(
    SUM(Quantity)
    FOR SaleMonth IN
    (
        [January],
        [February],
        [March]
    )
) AS PivotTable;
GO

/*----------------------------------------------------
UNPIVOT
----------------------------------------------------*/

SELECT
    ProductName,
    SaleMonth,
    Quantity
FROM
(
    SELECT
        ProductName,
        [January],
        [February],
        [March]
    FROM
    (
        SELECT ProductName, SaleMonth, Quantity
        FROM Sales
    ) AS SourceTable

    PIVOT
    (
        SUM(Quantity)
        FOR SaleMonth IN
        (
            [January],
            [February],
            [March]
        )
    ) AS PivotTable
) AS P

UNPIVOT
(
    Quantity
    FOR SaleMonth IN
    (
        [January],
        [February],
        [March]
    )
) AS UnpivotTable;
GO