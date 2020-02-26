create database EmartDB

create table Buyer (
BuyerId varchar(5) primary key,
UserName varchar(20) unique not null ,
EmailId varchar(20) unique not null,
Password varchar(15) not null,
MobileNo varchar(10) unique not null,
CreatedDateTime datetime  NOT NULL
);

create table Seller (
SellerId varchar(5) primary key,
UserName varchar(20) unique not null,
Password varchar(15) not null,
CompanyName varchar(30) not null,
GSTIN varchar(10) unique not null,
BriefDetails varchar(70) , 
PostalAddress varchar(40) not null,
Website varchar(25), 
EmailId varchar(20) unique,
MobileNo varchar(10) unique not null
);

create table Category 
 (
 CategoryId varchar(5) primary key,
 CategoryName varchar(20) unique not null,
 BriefDetails varchar(20) ,

 );


 create table SubCategory 
 (
 SubcategoryId varchar(5) primary key,
 SubcategoryName varchar(20) unique not null,
 CategoryId varchar(5) foreign key references Category(CategoryId),
 BriefDetails varchar(20),
 GST varchar(10) not null
 );

 create table Items
 (
 SellerId varchar(5) foreign key references Seller(SellerId),
 ItemId varchar(5) primary key,
 CategoryId varchar(5) foreign key references Category(CategoryId),
 SubcategoryId varchar(5) foreign key references SubCategory(SubCategoryId),
 Price varchar(30) not null,
 ItemName varchar(20) not null,
 Description varchar(50),
 StockNumber varchar(20) not null,
 Remarks varchar(30) 
 );


 create table TransactionHistory( 
Id varchar(5) primary key,
BuyerId   varchar(5)  foreign Key references  Buyer(BuyerId),
SellerId  varchar(5)  foreign Key references  Seller(SellerId),
TransactionId  varchar(5) unique not null  ,
ItemId varchar(5)  foreign Key references Items(ItemId) ,
NumberOfItems  varchar(20) not null,
DateTime datetime  NOT NULL,
Remarks varchar(20),
TransactionType varchar(20) not null
);

create table Discount(
Id varchar(5) primary key,
DiscountCode varchar(20) not null,
Percentage varchar(20) not null,
StartDate date not null,
EndDate date not null,
description varchar(30)
);