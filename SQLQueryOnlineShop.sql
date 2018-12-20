use master 
IF EXISTS(SELECT 'True' FROM sys.databases WHERE name LIKE 'onlineShop') 
DROP DATABASE onlineShop 
go
CREATE DATABASE  onlineShop
go
use [onlineShop]

go
CREATE TABLE [dbo].[Producers]
(
	[Id][int]IDENTITY(1,1) primary key NOT NULL,
	[Name][nvarchar](100) NOT NULL,
	[Description][nvarchar](200) NULL,
	[LogoPath][nvarchar](247) NULL
)
go

CREATE TABLE [dbo].[Categories]
(
	[Id][int]IDENTITY(1,1) primary key NOT NULL,
	[Name][nvarchar](50) NOT NULL,
	[Description][nvarchar](200) NULL,
	[ImagePath][nvarchar](247) NULL,
	[ParentCategoryId][int]NULL,
	[Availability]BIT default 'TRUE'
)
go
ALTER TABLE [dbo].[Categories] ADD CONSTRAINT FK_Categories_Categories_Id
FOREIGN KEY (ParentCategoryId) REFERENCES [dbo].[Categories](Id);
go
CREATE TABLE [dbo].[Products]
(
	[Id][int]IDENTITY(1,1) primary key NOT NULL,
	[Name][nvarchar](100) NOT NULL,
	[Description][nvarchar](2000) NULL,
	[ProducerId][int]NOT NULL,
	[Price][float]NOT NULL,
	[CategoryId][int]NULL,
	[Availability]BIT default 'TRUE'
)
go
ALTER TABLE [dbo].[Products] ALTER COLUMN Name[nvarchar](100) NOT NULL
go
ALTER TABLE [dbo].[Products] ADD CONSTRAINT FK_Products_Producers_Id
FOREIGN KEY (ProducerId) REFERENCES [dbo].[Producers](Id) ON DELETE CASCADE;
go
ALTER TABLE [dbo].[Products] ADD CONSTRAINT FK_Products_Categories_Id
FOREIGN KEY (CategoryId) REFERENCES [dbo].[Categories](Id);
go
CREATE TABLE [dbo].[Images]
(
	[Id][int]IDENTITY(1,1) primary key NOT NULL,
	[Path][nvarchar](247) NOT NULL,
	[ProductId][int] NOT NULL
)
go
ALTER TABLE [dbo].[Images] ADD CONSTRAINT FK_Images_ProductS_Id
FOREIGN KEY (ProductId) REFERENCES [dbo].[Products](Id) ON DELETE CASCADE;
go
CREATE TABLE [dbo].[Persons]
(
	[Id][int]IDENTITY(1,1) primary key NOT NULL,
	[Name][nvarchar](50) NOT NULL,
	[Surname][nvarchar](50) NOT NULL,
	[Email][nvarchar](30) NOT NULL, CONSTRAINT AK_Email UNIQUE(Email), 
	[Password][nvarchar](30) NOT NULL,
	[Status][nvarchar](30) NOT NULL CHECK (Status IN('active', 'inactive')) default 'active'
)
go
CREATE TABLE [dbo].[ContactTypes]
(
	[Id][int]IDENTITY(1,1) primary key NOT NULL,
	[Type][nvarchar](50) NOT NULL, CONSTRAINT AK_Type UNIQUE(Type)
)
go
CREATE TABLE [dbo].[Contacts]
(
	[Id][int]IDENTITY(1,1) primary key NOT NULL,
	[PersonId][int] NOT NULL,
	[ContactTypeId][int] NOT NULL,
	[Value][nvarchar](100) NOT NULL
)
go
ALTER TABLE [dbo].[Contacts] ADD CONSTRAINT FK_Contacts_Products_Id
FOREIGN KEY (PersonId) REFERENCES [dbo].[Persons](Id) ON DELETE CASCADE;
go
ALTER TABLE [dbo].[Contacts] ADD CONSTRAINT FK_Contacts_ContactTypes_Id
FOREIGN KEY (ContactTypeId) REFERENCES [dbo].[ContactTypes](Id) ON DELETE CASCADE;

go
CREATE TABLE [dbo].[Customers]
(
	[Id][int]IDENTITY(1,1) primary key NOT NULL,
	[PersonId][int]NOT NULL,
	[Discount][real]NULL
)
go
ALTER TABLE [dbo].[Customers] ADD CONSTRAINT FK_Customers_Persons_Id
FOREIGN KEY (PersonId) REFERENCES [dbo].[Persons](Id) ON DELETE CASCADE;
go
CREATE TABLE [dbo].[Managers]
(
	[Id][int]IDENTITY(1,1) primary key NOT NULL,
	[PersonId][int]NOT NULL
)
go
ALTER TABLE [dbo].[Managers] ADD CONSTRAINT FK_Managers_Persons_Id
FOREIGN KEY (PersonId) REFERENCES [dbo].[Persons](Id) ON DELETE CASCADE;
go
CREATE TABLE[DeliveryTypes]
(
	[Id][int]IDENTITY(1,1) primary key NOT NULL,
	[Type][nvarchar](50) NOT NULL, CONSTRAINT AK_DeliveryTypes UNIQUE(Type)
)
go
CREATE TABLE[PaymentTypes]
(
	[Id][int]IDENTITY(1,1) primary key NOT NULL,
	[Type][nvarchar](50) NOT NULL, CONSTRAINT AK_PaymentTypes UNIQUE(Type)
)
go
CREATE TABLE[CurrencyRate]
(
	[Id][int]IDENTITY(1,1) primary key NOT NULL,
	[Rate][float]NOT NULL,
	[Date][datetime]NOT NULL
)
go
CREATE TABLE [dbo].[Orders]
(
	[Id][int]IDENTITY(1,1) primary key NOT NULL,
	[CustomerId][int]NOT NULL,
	[ManagerId][int]NULL,
	[DeliveryTypeId][int]NULL,
	[PaymentTypeId][int]NULL,
	[TotalCost][float]NOT NULL,
	[Description][nvarchar](100) NULL,
	[Comment][nvarchar](100) NULL,
	[OrderDate][Datetime]NOT NULL,
	[ShipDate][Datetime]NULL,
	[DeliveryDate][Datetime]NULL,
	[LadingNumber][nvarchar](30)NULL,
	[Status][nvarchar](30) NOT NULL CHECK (Status IN('delivered', 'sent', 'new', 'in processing', 'canceled', 'suspended')) default 'new',
	[StatusPayment][nvarchar](30) NOT NULL CHECK (StatusPayment IN('fully paid', 'pending prepayment', 'not paid', 'received prepayment')) default 'not paid'
)
go
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT FK_Orders_Customers_Id
FOREIGN KEY (CustomerId) REFERENCES [dbo].[Customers](Id) ON DELETE CASCADE;
go
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT FK_Orderss_Managers_Id
FOREIGN KEY (ManagerId) REFERENCES [dbo].[Managers](Id);
go
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT FK_Orders_DeliveryTypes_Id
FOREIGN KEY (DeliveryTypeId) REFERENCES [dbo].[DeliveryTypes](Id);
go
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT FK_Orders_PaymentTypes_Id
FOREIGN KEY (PaymentTypeId) REFERENCES [dbo].[PaymentTypes](Id);
go
CREATE TABLE [dbo].[OrderDetails]
(
	[Id][int]IDENTITY(1,1) primary key NOT NULL,
	[OrderId][int]NOT NULL,
	[ProductId][int]NOT NULL,
	[Quantity][int]NOT NULL,
	[Price][float]NOT NULL
)
go
ALTER TABLE [dbo].[OrderDetails] ADD CONSTRAINT FK_OrderDetails_Orders_Id
FOREIGN KEY (OrderId) REFERENCES [dbo].[Orders](Id) ON DELETE CASCADE;
go
ALTER TABLE [dbo].[OrderDetails] ADD CONSTRAINT FK_OrderDetails_Products_Id
FOREIGN KEY (ProductId) REFERENCES [dbo].[Products](Id) ON DELETE CASCADE;
go
CREATE TABLE [dbo].[AttributeTypes]
(
	[Id][int]IDENTITY(1,1) primary key NOT NULL,
	[Type][nvarchar](50) NOT NULL, CONSTRAINT AK_AttributeTypes UNIQUE(Type),
	[Description][nvarchar](100) NULL

)
go
CREATE TABLE [dbo].[Category_AttributeType]
(
	[AttributeTypesId][int]NOT NULL,
	[CategoryId][int]NOT NULL,
	 primary key (AttributeTypesId, CategoryId)
)
go
ALTER TABLE [dbo].[Category_AttributeType] ADD CONSTRAINT FK_Category_AttributeType_AttributeTypes_Id
FOREIGN KEY (AttributeTypesId) REFERENCES [dbo].[AttributeTypes](Id) ON DELETE CASCADE;
go
ALTER TABLE [dbo].[Category_AttributeType] ADD CONSTRAINT FK_Category_AttributeType_Categories_Id
FOREIGN KEY (CategoryId) REFERENCES [dbo].[Categories](Id) ON DELETE CASCADE;
go
CREATE TABLE [dbo].[Attributes]
(
	[Id][int]IDENTITY(1,1) primary key NOT NULL,
	[AttributeTypeId][int]NOT NULL,
	[Value][nvarchar](50)NOT NULL,
	[ProductId][int]NOT NULL
)
go
ALTER TABLE [dbo].[Attributes] ADD CONSTRAINT FK_Attributes_AttributeTypes_Id
FOREIGN KEY (AttributeTypeId) REFERENCES [dbo].[AttributeTypes](Id) ON DELETE CASCADE;
go