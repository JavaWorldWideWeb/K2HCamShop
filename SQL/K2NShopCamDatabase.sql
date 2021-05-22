CREATE DATABASE K2NCamShopDatabase
GO
USE K2NCamShopDatabase
GO
CREATE TABLE ProductCategory(
	ProductCategoryID int identity primary key,
	ProductCategoryName varchar(50)
)
GO
CREATE TABLE ProductBrand(
	ProductBrandID int identity primary key,
	ProductBrandName varchar(50),
	NationalProduction varchar(50)
)
GO
CREATE TABLE Product(
	ProductID int identity primary key,
	ProductName varchar(50) ,
	ProductCategoryID int FOREIGN KEY REFERENCES ProductCategory(ProductCategoryID) ON DELETE CASCADE ,
	ProductBrandID int FOREIGN KEY REFERENCES ProductBrand(ProductBrandID) ON DELETE CASCADE ,
	Price int ,
	Quantity int,
	Color varchar(50),
	Description varchar(50),
	img varchar(255),
	WarranTyperiod varchar(50)
)
GO
CREATE TABLE UserShop(
	UserID int IDENTITY primary key,
	Active int ,
	Email varchar(50),
	Password varchar(50),
	Username varchar(50),
	Role varchar(50),
	Address varchar(50),
	Birthday datetime,
	FullName varchar(50),
	Img varchar(255),
	PhoneNumber varchar(50),
)
GO
CREATE TABLE Comment(
	CommentID int identity primary key,
	UserID int FOREIGN KEY REFERENCES UserShop(UserID) ON DELETE CASCADE ,
	ProductID int FOREIGN KEY REFERENCES Product(ProductID) ON DELETE CASCADE ,
	CommentContent varchar(255),
	RepComment varchar(255) null,
	Vote int 
)
GO
CREATE TABLE [OrderProduct](
	OrderID int identity primary key,
	DateOrder Datetime ,
	StatusOrder varchar(50),
	TotalMoney float,
	UserID int FOREIGN KEY REFERENCES UserShop(UserID),
)
GO
CREATE TABLE OrderDetail(
	OrderDetailId int identity primary key,
	ProductID int FOREIGN KEY REFERENCES Product(ProductID) ON DELETE CASCADE ,
	OrderID int FOREIGN KEY REFERENCES [OrderProduct](OrderID) ON DELETE CASCADE ,
	Quantity int ,
	StatusOrderDetail varchar(50)
)
GO
CREATE TABLE Contact(
	ContactID int identity primary key,
	UserContactName varchar(50),
	ContactEmail varchar(50),
	ContactMessage varchar(255)
)