SELECT C.CustomerID, C.CustomerName, P.PhoneNumber
FROM Sales.Orders AS O
JOIN Sales.Customers AS C ON O.CustomerID = C.CustomerID
JOIN Application.People AS P ON C.PrimaryContactPersonID = P.PersonID
JOIN Sales.OrderLines AS OL ON O.OrderID = OL.OrderID
JOIN Warehouse.StockItems AS I ON OL.StockItemID = I.StockItemID
WHERE I.StockItemName = 'Chocolate frogs 250g';