go
use [onlineShop]
go
insert into [dbo].[Producers] (Name) values (N'Bosch');--1
insert into [dbo].[Producers] (Name) values (N'Braun');--2
insert into [dbo].[Producers] (Name) values (N'Gorenje');--3
insert into [dbo].[Producers] (Name) values (N'Philips');--4
insert into [dbo].[Producers] (Name) values (N'Saturn');--5
insert into [dbo].[Producers] (Name) values (N'Scarlett');--6
insert into [dbo].[Producers] (Name) values (N'Zelmer');--7

insert into [dbo].[Producers] (Name) values (N'HUAWEI');--8
insert into [dbo].[Producers] (Name) values (N'Nokia');--9
insert into [dbo].[Producers] (Name) values (N'Samsung');--10
insert into [dbo].[Producers] (Name) values (N'Sigma');--11
insert into [dbo].[Producers] (Name) values (N'Sony');--12
insert into [dbo].[Producers] (Name) values (N'Xiaomi');--13
go
insert into [dbo].[Categories] (Name) values (N'��������� �����');--1
insert into [dbo].[Categories] (Name) values (N'������� �������');--2
insert into [dbo].[Categories] (Name, ParentCategoryId) values (N'��������� ��������', 1);--3
insert into [dbo].[Categories] (Name, ParentCategoryId) values (N'������� ��� �����', 2);--4
insert into [dbo].[Categories] (Name, ParentCategoryId) values (N'������� ��� ����', 2);--5
insert into [dbo].[Categories] (Name, ParentCategoryId) values (N'������� ��� �������', 2);--6

insert into [dbo].[Categories] (Name, ParentCategoryId) values (N'��������', 4);--7
insert into [dbo].[Categories] (Name, ParentCategoryId) values (N'�������', 4);--8
go
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'������� Braun JB 3010 WH', 2, 1549,7);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'������� Braun MQ 5035 WH Sauce', 2, 1485,7);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'������� Scarlett SL-HB43M81', 6,899,7);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'������� Scarlett SC-HB42F34', 6, 577,7);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'������� Saturn ST-FP0056', 5, 692,7);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'������� Philips HR1673/90', 4, 2299,7);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'������� Bosch MSM66150', 1, 1071,7);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'������� Gorenje B800E', 3,1829,7);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'������� Braun JB 5160 Black', 2, 3601,7);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'������� Philips HR1677/90', 4, 2999,7);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'������� Gorenje HBX884QE', 3, 1649,7);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'������ Scarlett SC-HM40S03', 6, 285,8);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'������ Philips HR1459/00', 4, 819,8);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'������ Bosch MFQ40301', 1, 1092,8);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'������ Bosch MFQ36440', 1, 1454,8);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'������ Zelmer ZHM1204S (481.4 Symbio)', 7, 676,8);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'������ Bosch MFQ3030', 1, 660, 8);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'��������� ������� Samsung G965F Galaxy S9+ 2018 Black (SM-G965FZKDSEK)', 10, 29799,3);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'��������� ������� Xiaomi Mi Note 3 6Gb RAM 64Gb Black', 13, 10500,3);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'��������� ������� Samsung A530F Galaxy A8 2018 Duos Black (SM-A530FZKDSEK)', 10, 13999,3);
insert into [dbo].[Products] (Name, ProducerId, Price, CategoryId) values (N'��������� ������� Samsung J330F/DS Galaxy J3 2017 Duos Black (SM-J330FZKDSEK)', 10, 4499,3);
go
insert into [dbo].[Persons] (Name, Surname, Email, Password) values (N'���1', N'�������1', 'test1@gmail.com', '1234567');--1
insert into [dbo].[Persons] (Name, Surname, Email, Password) values (N'���2', N'�������2', 'test2@gmail.com', '1234567');--2
insert into [dbo].[Persons] (Name, Surname, Email, Password) values (N'���3', N'�������3', 'test3@gmail.com', '1234567');--3
insert into [dbo].[Persons] (Name, Surname, Email, Password) values (N'���4', N'�������4', 'test4@gmail.com', '1234567');--4
insert into [dbo].[Persons] (Name, Surname, Email, Password) values (N'���5', N'�������5', 'test5@gmail.com', '1234567');--5
insert into [dbo].[Persons] (Name, Surname, Email, Password) values (N'���6', N'�������6', 'test6@gmail.com', '1234567');--6
go
insert into [dbo].[ContactTypes] (Type) values (N'Phone');--1
insert into [dbo].[ContactTypes] (Type) values (N'Viber');--2
insert into [dbo].[ContactTypes] (Type) values (N'City');--3
insert into [dbo].[ContactTypes] (Type) values (N'Code');--4
insert into [dbo].[ContactTypes] (Type) values (N'Street');--5
insert into [dbo].[ContactTypes] (Type) values (N'House');--6
insert into [dbo].[ContactTypes] (Type) values (N'Apartament');--7
go
insert into [dbo].[Contacts] (PersonId, ContactTypeId, Value) values (1,1,'+380509945072');
insert into [dbo].[Contacts] (PersonId, ContactTypeId, Value) values (2,1,'+380509945072');
insert into [dbo].[Contacts] (PersonId, ContactTypeId, Value) values (2,2,'+380509945072');
insert into [dbo].[Contacts] (PersonId, ContactTypeId, Value) values (3,1,'+380509945072');
insert into [dbo].[Contacts] (PersonId, ContactTypeId, Value) values (3,3,N'�������');
insert into [dbo].[Contacts] (PersonId, ContactTypeId, Value) values (3,5,N'�������');
insert into [dbo].[Contacts] (PersonId, ContactTypeId, Value) values (3,6,N'1�');
insert into [dbo].[Contacts] (PersonId, ContactTypeId, Value) values (3,6,N'2');
insert into [dbo].[Contacts] (PersonId, ContactTypeId, Value) values (4,1,'+380509945072');
insert into [dbo].[Contacts] (PersonId, ContactTypeId, Value) values (4,3,N'�������');
insert into [dbo].[Contacts] (PersonId, ContactTypeId, Value) values (4,5,N'����������� �������');
insert into [dbo].[Contacts] (PersonId, ContactTypeId, Value) values (4,6,N'5�');
insert into [dbo].[Contacts] (PersonId, ContactTypeId, Value) values (4,6,N'222');
go
insert into [dbo].[Customers] (PersonId) values (5);
insert into [dbo].[Customers] (PersonId) values (6);
insert into [dbo].[Customers] (PersonId, Discount) values (3, 5);
insert into [dbo].[Customers] (PersonId, Discount) values (4, 8);
go
insert into [dbo].[Managers] (PersonId) values (1);
insert into [dbo].[Managers] (PersonId) values (2);
go
insert into [dbo].[DeliveryTypes] (Type) values (N'���������');
insert into [dbo].[DeliveryTypes] (Type) values (N'����� �����');
go
insert into [dbo].[PaymentTypes] (Type) values (N'���������� ������');
insert into [dbo].[PaymentTypes] (Type) values (N'100% ����������');
go
insert into [dbo].[Orders] (CustomerId, ManagerId, DeliveryTypeId, PaymentTypeId, TotalCost, OrderDate) values (3,1,1,1,0,'2018-01-01');
insert into [dbo].[Orders] (CustomerId, ManagerId, DeliveryTypeId, PaymentTypeId, TotalCost, OrderDate) values (4,1,1,1,0,'2018-02-01');
insert into [dbo].[Orders] (CustomerId, ManagerId, DeliveryTypeId, PaymentTypeId, TotalCost, OrderDate) values (1,1,1,1,0,'2018-03-01');
insert into [dbo].[Orders] (CustomerId, ManagerId, DeliveryTypeId, PaymentTypeId, TotalCost, OrderDate) values (2,2,1,1,0,'2018-04-01');
go

