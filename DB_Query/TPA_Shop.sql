CREATE DATABASE [TPA_Shop]

GO 

USE [TPA_Shop]

GO

CREATE TABLE [Roles] (
    [id] int PRIMARY KEY,
    [name] NVARCHAR(200) NOT NULL
);

Go

CREATE TABLE [Users] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [roleID] INT REFERENCES [Roles]([id]),
    [userName] NVARCHAR(500) NOT NULL,
    [fullName] NVARCHAR(max) NULL,
    [idCitizen] NVARCHAR(20) NULL,
    [email] NVARCHAR(500) NULL,
    [phoneNumber] NVARCHAR (13) NULL,
    [password] NVARCHAR(50) NOT NULL,
    [address] NVARCHAR(max) NULL,
    [gender] BIT NULL,
    [dob] DATE NULL,
    [image] NVARCHAR(4000) NULL,
    [status] INT NOT NULL,
    [dateStart] DATE NULL,
    [dateEnd] DATE NULL,
    [updatedAt] DATETIME
);

GO

CREATE TABLE [ShipAddresses] (
    [id] int IDENTITY(1,1) PRIMARY KEY,
    [userName] NVARCHAR(500) NOT NULL,
    [address] NVARCHAR(max) NOT NULL,
    [phoneNumber] NVARCHAR(13) NOT NULL,
    [userID] int REFERENCES [Users]([id]),
)

GO

CREATE TABLE [Categorys] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [name] NVARCHAR(500),
);

GO

CREATE TABLE [SubCategorys] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [name] NVARCHAR(500),
    [categoryID] INT REFERENCES [Categorys]([id])
);

GO

CREATE TABLE [Products] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [name] NVARCHAR(500) NOT NULL,
    [description] NVARCHAR(max) NULL,
    [price] int NOT NULL,
    [discount] FLOAT NULL,
    [gender] INT,
    [categoryID] INT REFERENCES [Categorys] ([id]),
    [createdAt] DATETIME,
    [updatedAt] DATETIME
);

GO

CREATE TABLE [ProductDetails] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [productID] INT REFERENCES [Products]([id]) NOT NULL,
    [size] NVARCHAR(20) NOT NULL,
    [color] NVARCHAR(200) NOT NULL,
    [quantity] INT NOT NULL
);

GO

CREATE TABLE [Images] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [name] NVARCHAR(max),
    [productID] INT REFERENCES [Products]([id]) NOT NULL,
);

GO

CREATE TABLE [Carts] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [quantity] int,
    [productDetailID] INT REFERENCES [ProductDetails]([id]),
    [userID] INT REFERENCES [Users]([id])
);

GO

CREATE TABLE [Orders] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [cartID] INT REFERENCES [Carts]([id]),
    [userID] INT REFERENCES [Users]([id]),
    [shipAddressID] INT REFERENCES [ShipAddresses]([id]),
    [status] INT NOT NULL,
    [createdAt] DATETIME, 
    [updatedAt] DATETIME
);

GO

CREATE TABLE [OrderDetails] (
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [quantity] INT,
    [totalPrice] INT,
    [orderID] INT REFERENCES [Orders]([id]),
    [productDetailID] INT REFERENCES [ProductDetails]([id])
)