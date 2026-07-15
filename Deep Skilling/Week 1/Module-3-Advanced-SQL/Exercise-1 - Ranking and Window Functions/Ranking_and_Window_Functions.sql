WITH ProductRanks AS
(
    SELECT
        ProductName,
        Category,
        Price,
        ROW_NUMBER() OVER
        (
            PARTITION BY Category
            ORDER BY Price DESC
        ) AS Row_Number
    FROM Products
)

SELECT *
FROM ProductRanks
WHERE Row_Number <= 3;