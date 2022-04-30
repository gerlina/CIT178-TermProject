/* Final Project Procedures 
-- Retrieves and displays data
USE myFictionalBusiness;
GO
CREATE PROC spCustomers
AS
SELECT * FROM Customers
ORDER BY Names;
GO

EXEC spCustomers;

-- Takes an input parameter
USE myFictionalBusiness;
GO
CREATE PROC spGetCustomer
	@CustomerID int
AS
BEGIN
	SELECT * FROM Customers
	WHERE ID = @CustomerID;
END
GO
EXEC spGETCustomer 1
-- Takes one input parameter and returns three output parameters
USE myFictionalBusiness;
GO
CREATE PROC spCustomerContact
	@CustomerID int,
	@FullName nvarchar(30) OUTPUT,
	@PhoneNumber nvarchar(30) OUTPUT,
	@Email nvarchar(30) OUTPUT
	
AS
SELECT @FullName = Names, @PhoneNumber = CellPh,@Email=Email
FROM Customers 
WHERE ID = @CustomerID;
GO
-- Run the procedure
DECLARE @FullName nvarchar(30);
DECLARE @Email nvarchar(50);
DECLARE @Phone nvarchar(30);
EXEC spCustomerContact 3, @FullName OUTPUT, @Email OUTPUT, @Phone OUTPUT;
SELECT @FullName AS 'Name', @Email AS 'Email', @Phone AS 'Phone Number';
-- Stored procedure that has a return value 
USE myFictionalBusiness;
GO
CREATE PROC spCustomerCount
AS
DECLARE @CustomerCount int;
SELECT @CustomerCount = COUNT(*)
FROM Customers 
RETURN @CustomerCount;
GO

DECLARE @CustomerCount int;
EXEC @CustomerCount = spCustomerCount;
PRINT 'There are ' + CONVERT(varchar, @CustomerCount) + ' customers in your database';
GO
*/
/* Final Project User Defined Functions


-- creates the function
USE myFictionalBusiness;
GO
CREATE FUNCTION SortOrdered12
    (@Design nvarchar(50) = 'S')
    RETURNS int
BEGIN
    RETURN (SELECT LongboardID
			FROM Inventory
			WHERE design Like @Design);
END;  

-- uses the function
USE myFictionalBusiness;
GO
CREATE FUNCTION fnSortItems
		(@InventoryID int)
		RETURNS table
RETURN
		( SELECT * FROM OrderDetails
		WHERE @InventoryID=OrderDetails.InventoryNumber);
SELECT * FROM fnSortItems(1);
SELECT * FROM fnSortItems(2);
SELECT * FROM fnSortItems(3);*/
 /* Final Project Triggers 

 CREATE TABLE PreviousOrders(
    numberOfOrdersID int,
	CustomerID int,
	PRIMARY KEY (numberOfOrdersID),
	FOREIGN KEY (CustomerID) REFERENCES Customers(ID)
);
USE myFictionalBusiness;

 GO
 SELECT * INTO CustomerTransaction
 FROM Customers
 WHERE 1=0;

 ALTER TABLE CustomerTransaction
 ADD Activity varchar(50);
 GO


  -- create insert trigger
 CREATE TRIGGER CustomerTransaction_INSERT ON Customers
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustomerID int
	DECLARE @Names varchar(20)
	DECLARE @Location varchar(30)
	DECLARE @Zip varchar(10)
	DECLARE @PhoneNumber varchar(30)
	DECLARE @Email varchar(15)

    SELECT @CustomerID =INSERTED.ID, @Names = INSERTED.Names, @Location = INSERTED.Location,
	@Zip = INSERTED.Zipcode, @PhoneNumber = INSERTED.CellPh, @Email = INSERTED.Email
	FROM INSERTED

    INSERT INTO CustomerTransaction VALUES(@CustomerID,@Names, @Location, @Zip, @PhoneNumber, @Email, 'Inserted' )
END
GO
-- add row into customer to test insert trigger
INSERT INTO Customers VALUES(9,'Fred','Flintstone','10010','blablabla@yahoo.com','(231)-123-4567');

GO
-- view data in customer archive
SELECT * FROM CustomerTransaction;
GO
 -- create delete trigger
 CREATE TRIGGER CustomerTransaction_Delete ON Customers
    AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustomerID int
	DECLARE @Names varchar(20)
	DECLARE @Location varchar(30)
	DECLARE @Zip varchar(10)
	DECLARE @PhoneNumber varchar(30)
	DECLARE @Email varchar(15)


	SELECT @CustomerID =DELETED.ID, @Names = DELETED.Names, @Location = DELETED.Location,
	@Zip = DELETED.Zipcode, @PhoneNumber = DELETED.CellPh, @Email = DELETED.Email
	FROM DELETED

	    INSERT INTO CustomerTransaction VALUES(@CustomerID,@Names, @Location, @Zip, @PhoneNumber, @Email, 'Deleted' )
END
GO
-- delete row from customer to test delete trigger
DELETE FROM Customers WHERE ID = 9;
GO

-- view data in customer archive
SELECT * FROM CustomerTransaction;

GO
 -- create update trigger
 CREATE TRIGGER CustomerTransaction_Update ON Customers
    AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustomerID int
	DECLARE @Names varchar(20)
	DECLARE @Location varchar(30)
	DECLARE @Zip varchar(10)
	DECLARE @PhoneNumber varchar(30)
	DECLARE @Email varchar(15)
    
	SELECT @CustomerID =INSERTED.ID, @Names = INSERTED.Names, @Location = INSERTED.Location,
	@Zip =INSERTED.Zipcode, @PhoneNumber = INSERTED.CellPh, @Email = INSERTED.Email
	FROM INSERTED

	-- Since all the data is being written to the archive table, there is no need to identify what was changed'Updated'
	 INSERT INTO CustomerTransaction VALUES(@CustomerID,@Names, @Location, @Zip, @PhoneNumber, @Email, 'Updated' )
END
    
GO
-- insert a new row and then update the row (this will test the insert and update triggers)
INSERT INTO Customers VALUES(10,'Fred','Flintstone','10010','blablabla@yahoo.com','(231)-123-4567');
GO
UPDATE Customers 
SET Names = 'Pebbles'
WHERE ID = 10;
GO
-- view data in customer archive
SELECT * FROM CustomerTransaction
*/