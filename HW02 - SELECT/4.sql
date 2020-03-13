SELECT PO.*, S.SupplierName, P.FullName
FROM Purchasing.SupplierTransactions AS ST 
JOIN Purchasing.PurchaseOrders AS PO ON ST.PurchaseOrderID = PO.PurchaseOrderID
JOIN Application.DeliveryMethods AS DM ON PO.DeliveryMethodID = DM.DeliveryMethodID
JOIN Purchasing.Suppliers AS S ON ST.SupplierID = S.SupplierID
JOIN Application.People AS P ON PO.ContactPersonID = P.PersonID
WHERE (DM.DeliveryMethodName = 'Road Freight' OR DM.DeliveryMethodName = 'Post') AND YEAR(PO.OrderDate) = 2014;