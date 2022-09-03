CREATE DATABASE [CustomerDB_Kalenishin]

GO

USE [CustomerDB_Kalenishin]

GO

CREATE TABLE [Customers]
(
	CustomerId int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	FirstName nvarchar(50) NULL,
	LastName nvarchar(50) NOT NULL,
	PhoneNumber nvarchar(20) CHECK
	(PhoneNumber IS NULL OR PhoneNumber LIKE '+[1-9]' + REPLICATE('[0-9]', 14) OR PhoneNumber LIKE '[1-9]' + REPLICATE('[0-9]', 14)),
	Email nvarchar(100) CHECK
	(Email IS NULL OR Email LIKE '%[a-zA-Z0-9][@][a-zA-Z0-9]%[.][a-zA-Z0-9]%'),
	TotalPurchasesAmount MONEY CHECK
	(TotalPurchasesAmount IS NULL OR TotalPurchasesAmount >= 0)

);


GO

CREATE TABLE [Addresses]
(
	AddressId int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CustomerId int NOT NULL FOREIGN KEY REFERENCES Customers(CustomerId),
	AddressLine1 nvarchar(100) NOT NULL,
	AddressLine2 nvarchar(100) NULL,
	AddressType nvarchar(8) NOT NULL CHECK (AddressType IN ('Shipping', 'Billing')),
	City nvarchar(50) NOT NULL,
	PostalCode nvarchar(6) NOT NULL,
	AddrState nvarchar(20) NOT NULL,
	Country nvarchar(6) NOT NULL CHECK
	(Country IN('USA','Canada')),
);


GO

CREATE TABLE [Notes] 
(
	NoteId int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CustomerId int NOT NULL FOREIGN KEY REFERENCES Customers(CustomerId),
	Note nvarchar(255) NOT NULL CHECK (Note != '')
)