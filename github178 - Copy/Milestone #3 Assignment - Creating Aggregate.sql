/*
USE myFictionalBusiness;
SELECT Zipcode.State, COUNT(DISTINCT Customers.ID) AS [Customers per State]

From Customers JOIN Zipcode ON Customers.Zipcode = Zipcode.Zipcode

GROUP BY Zipcode.State

ORDER BY Zipcode.State*/

/*USE myFictionalBusiness;

Example 1

SELECT COUNT(ID) AS 'Number Inventory Items', InventoryNumber, SUM (Quantity) AS 'Total Boards Ordered'
FROM OrderDetails
GROUP BY InventoryNumber


Example 2

SELECT InventoryNumber,SUM(Quantity) AS 'Total Boards Ordered', Inventory.Price-Inventory.Cost AS 'Profit Per Board',
SUM(Quantity)*  (Inventory.Price-Inventory.Cost)AS 'Total Profit per Board'
FROM OrderDetails JOIN Inventory ON Inventory.LongboardID = InventoryNumber
GROUP BY InventoryNumber,Inventory.Price-Inventory.Cost;

Example 3

SELECT SUM(Quantity) AS 'Total Boards Ordered' ,
AVG(Quantity)* AVG (Inventory.Price-Inventory.Cost) AS 'Total Profit per Board'
FROM OrderDetails JOIN Inventory ON Inventory.LongboardID = InventoryNumber
GROUP BY InventoryNumber,Inventory.Price-Inventory.Cost;

Example 4

SELECT SUM(Quantity)* (Inventory.Price-Inventory.Cost) AS 'Total Profit for Boards'
FROM OrderDetails JOIN Inventory ON Inventory.LongboardID = InventoryNumber
GROUP BY InventoryNumber,Inventory.Price-Inventory.Cost;

Smallest, Largest, Average

SELECT MIN(Inventory.Cost)AS[Minimum Amount to make board],
       MAX(Inventory.Cost)AS[Maximum Amount to make board],
	   AVG(Inventory.Cost)AS[Average Amount to make board]
FROM Inventory;*/







