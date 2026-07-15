USE CognizantDB;
GO

/*====================================================
  EXERCISE 3
  CTEs and MERGE
====================================================*/

/*----------------------------------------------------
PART A
Recursive CTE - Generate Calendar
----------------------------------------------------*/

WITH CalendarCTE AS
(
    SELECT CAST('2025-01-01' AS DATE) AS CalendarDate

    UNION ALL

    SELECT DATEADD(DAY,1,CalendarDate)
    FROM CalendarCTE
    WHERE CalendarDate < '2025-01-31'
)

SELECT *
FROM CalendarCTE
OPTION (MAXRECURSION 0);
GO


/*----------------------------------------------------
PART B
Create Staging Table
----------------------------------------------------*/

CREATE TABLE StagingProducts
(
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);
GO


/*----------------------------------------------------
Insert Sample Data
----------------------------------------------------*/

INSERT INTO StagingProducts VALUES
(1,'Laptop','Electronics',76000),
(5,'Refrigerator','Appliances',47000),
(11,'Smart Watch','Electronics',12000);
GO


/*----------------------------------------------------
MERGE Statement
----------------------------------------------------*/

MERGE Products AS Target

USING StagingProducts AS Source

ON Target.ProductID = Source.ProductID

WHEN MATCHED THEN

UPDATE SET

Target.Price = Source.Price

WHEN NOT MATCHED THEN

INSERT
(
ProductID,
ProductName,
Category,
Price
)

VALUES
(
Source.ProductID,
Source.ProductName,
Source.Category,
Source.Price
);

GO


/*----------------------------------------------------
Display Updated Products
----------------------------------------------------*/

SELECT *
FROM Products;
GO