SELECT TOP(10) *, C.CustomerName, P.FullName 
FROM Sales.Orders AS O
JOIN Sales.Customers AS C ON O.CustomerID = C.CustomerID
JOIN Application.People AS P ON O.SalespersonPersonID = P.PersonID
ORDER BY OrderDate DESC;