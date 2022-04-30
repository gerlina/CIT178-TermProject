CREATE DATABASE myFictionalBusinessL1;
GO

USE myFictionalBusinessL1;
CREATE TABLE Inventory(
	LongboardID int NOT NULL,
	Design varchar(200) NOT NULL,
	BTypes varchar(100) NOT NULL,
	Flex varchar(50),
	BLength varchar(50),
	Wheels varchar(50),
	Cost money,
	Price money,
	PRIMARY KEY(LongboardID)
);
GO
CREATE TABLE Customers(
	ID int NOT NULL,
	Name varchar(20) NOT NULL,
	LName varchar(30) NOT NULL,
	Zipcode varchar(10) NOT NULL,
	Email varchar(30),
	CellPh varchar(15),
	PRIMARY KEY(ID)
);

GO
CREATE TABLE Zipcode(
	Zipcode varchar(10) NOT NULL,
	City varchar(30) NOT NULL,
	State varchar(2) NOT NULL,
	PRIMARY KEY(Zipcode)
);
GO
CREATE TABLE Locations(
	ID int NOT NULL,
	Name varchar(20) NOT NULL,
	PRIMARY KEY(ID)
);
GO
CREATE TABLE Orders(
	ID int NOT NULL,
	OrderDate datetime,
	LocationID int NOT NULL,
	CustomerID int NOT NULL,
	PRIMARY KEY(ID)
);
GO
CREATE TABLE OrderDetails(
	ID int NOT NULL,
	OrderID int NOT NULL,
	InventoryNumber int NOT NULL,
	Quantity int,
	PRIMARY KEY(ID)
);
GO