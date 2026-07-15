USE CognizantDB;
GO

/*====================================================
  EXERCISE 5
  USING CTE TO SIMPLIFY A QUERY
====================================================*/

/*----------------------------------------------------
Insert Additional Orders
----------------------------------------------------*/

INSERT INTO Orders VALUES
(105,1,'2025-01-18'),
(106,1,'2025-01-20'),
(107,1,'2025-01-25'),
(108,2,'2025-01-26');
GO

/*----------------------------------------------------
CTE to Count Orders
----------------------------------------------------*/

WITH CustomerOrderCounts AS
(
    SELECT
        CustomerID,
        COUNT(OrderID) AS OrderCount
    FROM Orders
    GROUP BY CustomerID
)

SELECT
    c.CustomerID,
    c.CustomerName,
    coc.OrderCount
FROM CustomerOrderCounts coc
JOIN Customers c
ON c.CustomerID = coc.CustomerID
WHERE coc.OrderCount > 3;
GO