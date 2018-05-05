USE Hotel

/*
DROP TABLE ServicesInRoom
DROP TABLE HotelServices
DROP TABLE ClientsInRoom
DROP TABLE ReservedRooms
DROP TABLE EmployeeInRoom
DROP TABLE EmployeeType
DROP TABLE Employes
DROP TABLE Clients
DROP TABLE ClientStatus
DROP TABLE FoodType
DROP TABLE Rooms
DROP TABLE RoomType


*/


CREATE TABLE RoomType
(
	ID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	RoomTypeName nvarchar(250) NOT NULL,
	NumberSeats nvarchar(50) NOT NULL,
	RoomTypeDescription nvarchar(4000) NOT NULL,
);
GO

CREATE TABLE Rooms
(
	ID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	RoomNumber nvarchar(10) NOT NULL,
	IDRoomType int NOT NULL FOREIGN KEY REFERENCES RoomType(ID),
	RoomFloor nvarchar(100) NOT NULL,
	RoomPhone nvarchar(100) NOT NULL,
	RoomPrice nvarchar(50) NOT NULL,
	RoomDescription nvarchar(4000) NOT NULL,
);
GO

CREATE TABLE FoodType
(
	ID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	FoodTypeName nvarchar(250) NOT NULL,
	FoodTypyPrice nvarchar(250) NOT NULL,
	FoodTypeDescription nvarchar(4000) NOT NULL,
);
GO

CREATE TABLE ClientStatus
(
	ID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	StatusName nvarchar(100) NOT NULL,
	StatusDescription nvarchar(4000) NOT NULL,
);
GO


CREATE TABLE Clients
(
	ID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	ClientName nvarchar(250) NOT NULL,
	ClientPasport nvarchar(4000) NOT NULL,
	IDClientStatus int NOT NULL FOREIGN KEY REFERENCES ClientStatus(ID),
	ClientAdress nvarchar(250) NOT NULL,
);
GO


CREATE TABLE Employes
(
	ID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	EmployeeName nvarchar(250) NOT NULL,
	EmployeePasport nvarchar(4000) NOT NULL,
	EmployePhone nvarchar(250) NOT NULL,
	EmployesAdress nvarchar(250) NOT NULL,
);
GO

CREATE TABLE EmployeeType
(
	ID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	WorkTypeName nvarchar(250) NOT NULL,
);
GO

CREATE TABLE EmployeeInRoom
(
	ID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	IDRoom int NOT NULL FOREIGN KEY REFERENCES Rooms(ID),
	IDEmployee int NOT NULL FOREIGN KEY REFERENCES Employes(ID),
	IDEmployeeType int NOT NULL FOREIGN KEY REFERENCES EmployeeType(ID),
	EmployeeDate date NOT NULL,
);
GO

CREATE TABLE ReservedRooms
(
	ID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	IDRoom int NOT NULL FOREIGN KEY REFERENCES Rooms(ID),
	DateBegin date NOT NULL,
	DateEnd date NOT NULL,
	IDFoodType int NOT NULL FOREIGN KEY REFERENCES FoodType(ID),
	Passed bit NOT NULL,
	
);
GO

CREATE TABLE ClientsInRoom
(
	IDReservedRooms int NOT NULL FOREIGN KEY REFERENCES ReservedRooms(ID),
	IDClient int NOT NULL FOREIGN KEY REFERENCES Clients(ID),
	PRIMARY KEY(IDReservedRooms,IDClient)
);
GO

CREATE TABLE HotelServices
(
	ID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	ServicesName nvarchar(500) NOT NULL,
	ServicesPrice nvarchar(500) NOT NULL,
	
);
GO

CREATE TABLE ServicesInRoom
(
	ID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	IDReservedRooms int NOT NULL FOREIGN KEY REFERENCES ReservedRooms(ID),
	IDHotelServices int NOT NULL FOREIGN KEY REFERENCES HotelServices(ID),
);
GO
