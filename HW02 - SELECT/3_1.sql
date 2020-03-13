SELECT O.*, MonthName, (MONTH(OrderDate) - 1) / 3 + 1 AS Quarter, (MONTH(OrderDate) - 1) / 4 + 1 AS Third
FROM Sales.Orders AS O
JOIN (SELECT 1 AS MonthID, 'January' AS MonthName UNION SELECT 2, 'February' UNION SELECT 3, 'March' UNION SELECT 4, 'April' UNION
SELECT 5, 'May' UNION SELECT 6, 'June' UNION SELECT 7, 'July' UNION SELECT 8, 'August' UNION
SELECT 9, 'September' UNION SELECT 10, 'October' UNION SELECT 11, 'November' UNION SELECT 12, 'December') AS M ON M.MonthID = Month(O.OrderDate)
JOIN Sales.OrderLines AS OL ON O.OrderID = OL.OrderID
WHERE O.PickingCompletedWhen IS NOT NULL AND (OL.UnitPrice > 100 OR OL.Quantity > 20)
ORDER BY Quarter, Third, O.OrderDate;