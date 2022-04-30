/*TASK#1

USE myFictionalBusiness;
GO
--Updateable View:
CREATE VIEW one_view
AS
SELECT ID, OrderDetails.OrderID, InventoryNumber, Quantity,CustomerID,LocationID,OrderDate
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID;
GO

--Limited Update View:
USE myFictionalBusiness;
GO
CREATE VIEW two_view
AS
SELECT ID, OrderDetails.OrderID, InventoryNumber, Quantity
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
WITH CHECK OPTION;
GO


SELECT * FROM one_view;

SELECT * FROM two_view;



Use myFictionalBusiness;

GO

CREATE VIEW profit_view (OrderID,Cost, price, gain)

AS

SELECT OrderID,Cost, price, price-cost AS [Totalprofit]

FROM Inventory

JOIN OrderDetails ON Inventory.LongboardID =OrderDetails.InventoryNumber

WHERE price - cost  > 0;

Select * FROM profit_view

ORDER BY Gain

USE myFictionalBusiness;
GO

CREATE VIEW Florda_locations

AS

SELECT * FROM Zipcode

WHERE State IN ('FL');
GO

SELECT * FROM Florda_locations;

USE myFictionalBusiness;
GO

UPDATE one_view

SET Quantity= 5
[CellPh]
WHERE OrderID = 1;

SELECT * FROM one_view;


USE myFictionalBusiness;
GO
CREATE VIEW Customer_Orders
AS
SELECT ID, OrderID, Names, Location, CellPh,Email, OrderDate,CustomerID,LocationID,Zipcode
FROM Customers
JOIN Orders ON Customers.ID = Orders.CustomerID;

SELECT * FROM Customer_Orders;*/




