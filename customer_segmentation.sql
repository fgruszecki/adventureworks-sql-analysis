WITH FilteredSales AS (
    SELECT SOH.CustomerID,

    
SOH.OrderDate,
SOD.LineTotal,
P.Name,
SOH.SalesOrderID,
SOH.SubTotal
                

    FROM SalesLT.SalesOrderHeader AS SOH
    JOIN SalesLT.SalesOrderDetail AS SOD ON SOD.SalesOrderID=SOH.SalesOrderID
    JOIN SalesLT.Product AS P ON P.ProductID=SOD.ProductID
    WHERE SOH.Status = 5
),
CustomerAggregates AS (
    SELECT CustomerID,
    COUNT(DISTINCT CASE WHEN SubTotal > 2000 THEN SalesOrderID END) *  100.00 / COUNT(DISTINCT SalesOrderID)[HighValueOrdersPct],
    SUM(LineTotal)[TotalSpent],
    MAX(OrderDate)[LastOrderDate],
    COUNT(DISTINCT SalesOrderID)[TotalOrdersCount],

        CASE
            WHEN SUM(CASE WHEN Name LIKE 'BK-%' THEN LineTotal ELSE 0 END) > SUM(CASE WHEN Name NOT LIKE 'BK-%' THEN LineTotal ELSE 0 END ) THEN 'Bikes'
            ELSE 'Other'
        END [FavoriteCategory]

    FROM FilteredSales
    GROUP BY Customerid
)


SELECT CustomerID,
    HighValueOrdersPct,
TotalSpent,
    YEAR(LastOrderDate)[LastOrderYear],
    TotalOrdersCount,
    FavoriteCategory

    
FROM CustomerAggregates
WHERE TotalSpent > 5000
ORDER BY TotalSpent DESC
