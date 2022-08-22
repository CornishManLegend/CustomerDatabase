USE [CustomerDB_Kalenishin]

GO

--valid cases
INSERT INTO Customers (FirstName, LastName, PhoneNumber, Email, TotalPurchasesAmount)
VAlUES ('John','Wayne', '123456789111111','johnWayne@gmail.com', 10),
		('Bob','Wayne','123456789222222','bobWayne@gmail.com', 321),
		('Marta','Wayne','123456789333333','martaWayne@gmail.com', 312);



INSERT INTO Addresses (CustomerId, AddressLine1, AddressLine2, AddressType, City, PostalCode, AddrState, Country)
VAlUES (1,'Mulholland Drive','13/1', 'Shipping', 'Los Angeles', 90012, 'Washington', 'USA'),
	   (2,'Lincoln str', '2/5', 'Billing', 'Ontario', 32112 , 'Washington', 'Canada'),
	   (3,'Mulholland Drive','13/1', 'Shipping', 'Los Angeles', 90012, 'Washington', 'USA');


INSERT INTO Notes (CustomerId, Note )
VAlUES (1 , 'Johns note1'),
		(1 , 'Johns note2'),
		(2 , 'Bob note'),
		(3 , 'Marta note');

GO

--invalid cases
INSERT INTO Customers (FirstName, LastName, PhoneNumber, Email, TotalPurchasesAmount)
VAlUES ('John','Wayne Junior', '165asdas20489','gmail.com', -1);

INSERT INTO Addresses 
VAlUES (3,'Mulholland Drive','13/1', 'Shipping', 'Los Angeles', 90012, 'Washington', 'Russia');

INSERT INTO Notes (CustomerId, Note )
VAlUES (1 , '');

--SELECT * FROM Customers
--SELECT * FROM Addresses
--SELECT * FROM Notes
