SELECT * FROM Purchasing.Suppliers AS S LEFT JOIN Purchasing.PurchaseOrders AS O ON O.SupplierID = S.SupplierID WHERE PurchaseOrderID IS NULL