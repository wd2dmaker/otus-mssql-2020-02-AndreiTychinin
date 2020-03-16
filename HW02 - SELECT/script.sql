--1. Все товары, в которых в название есть пометка urgent или название начинается с Animal
SELECT StockItemID, StockItemName FROM Warehouse.StockItems WHERE StockItemName like '%urgent%' OR StockItemName like 'Animal%'




--2. Поставщиков, у которых не было сделано ни одного заказа (потом покажем как это делать через подзапрос, сейчас сделайте через JOIN)
SELECT S.SupplierID, SupplierName FROM Purchasing.Suppliers AS S LEFT JOIN Purchasing.PurchaseOrders AS O ON O.SupplierID = S.SupplierID WHERE PurchaseOrderID IS NULL




--3.1. Продажи с названием месяца, в котором была продажа, номером квартала, к которому относится продажа, включите также к какой трети года относится дата - каждая треть по 4 месяца, дата забора заказа должна быть задана, с ценой товара более 100$ либо количество единиц товара более 20. Добавьте вариант этого запроса с постраничной выборкой пропустив первую 1000 и отобразив следующие 100 записей. Соритровка должна быть по номеру квартала, трети года, дате продажи. 
SELECT O.OrderID, datename(mm, O.OrderDate) AS MonthName, (MONTH(OrderDate) - 1) / 3 + 1 AS Quarter, (MONTH(OrderDate) - 1) / 4 + 1 AS Third
FROM Sales.Orders AS O
JOIN Sales.OrderLines AS OL ON O.OrderID = OL.OrderID
WHERE O.PickingCompletedWhen IS NOT NULL AND (OL.UnitPrice > 100 OR OL.Quantity > 20)
ORDER BY Quarter, Third, O.OrderDate;




--3.2. Продажи с названием месяца, в котором была продажа, номером квартала, к которому относится продажа, включите также к какой трети года относится дата - каждая треть по 4 месяца, дата забора заказа должна быть задана, с ценой товара более 100$ либо количество единиц товара более 20. Добавьте вариант этого запроса с постраничной выборкой пропустив первую 1000 и отобразив следующие 100 записей. Соритровка должна быть по номеру квартала, трети года, дате продажи.
SELECT O.OrderID, datename(mm, O.OrderDate) AS MonthName, (MONTH(OrderDate) - 1) / 3 + 1 AS Quarter, (MONTH(OrderDate) - 1) / 4 + 1 AS Third
FROM Sales.Orders AS O
JOIN Sales.OrderLines AS OL ON O.OrderID = OL.OrderID
WHERE O.PickingCompletedWhen IS NOT NULL AND (OL.UnitPrice > 100 OR OL.Quantity > 20)
ORDER BY Quarter, Third, O.OrderDate;
OFFSET 1000 ROWS FETCH FIRST 100 ROWS ONLY;




--4. Заказы поставщикам, которые были исполнены за 2014й год с доставкой Road Freight или Post, добавьте название поставщика, имя контактного лица принимавшего заказ
SELECT PO.PurchaseOrderID, S.SupplierName, P.FullName
FROM Purchasing.SupplierTransactions AS ST 
JOIN Purchasing.PurchaseOrders AS PO ON ST.PurchaseOrderID = PO.PurchaseOrderID
JOIN Application.DeliveryMethods AS DM ON PO.DeliveryMethodID = DM.DeliveryMethodID
JOIN Purchasing.Suppliers AS S ON ST.SupplierID = S.SupplierID
JOIN Application.People AS P ON PO.ContactPersonID = P.PersonID
WHERE (DM.DeliveryMethodName = 'Road Freight' OR DM.DeliveryMethodName = 'Post') AND YEAR(ST.FinalizationDate) = 2014;



--5. 10 последних по дате продаж с именем клиента и именем сотрудника, который оформил заказ.
SELECT TOP(10) O.OrderID, C.CustomerName, P.FullName 
FROM Sales.Orders AS O
JOIN Sales.Customers AS C ON O.CustomerID = C.CustomerID
JOIN Application.People AS P ON O.SalespersonPersonID = P.PersonID
ORDER BY OrderDate DESC;




--6. Все ид и имена клиентов и их контактные телефоны, которые покупали товар Chocolate frogs 250g
SELECT DISTINCT C.CustomerID, C.CustomerName, P.PhoneNumber
FROM Sales.Orders AS O
JOIN Sales.Customers AS C ON O.CustomerID = C.CustomerID
JOIN Application.People AS P ON C.PrimaryContactPersonID = P.PersonID
JOIN Sales.OrderLines AS OL ON O.OrderID = OL.OrderID
JOIN Warehouse.StockItems AS I ON OL.StockItemID = I.StockItemID
WHERE I.StockItemName = 'Chocolate frogs 250g';