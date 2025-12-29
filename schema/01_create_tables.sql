CREATE TABLE categories_n (
  CategoryID NUMBER NOT NULL,
  CategoryName VARCHAR2(255),
  Description VARCHAR2(255)
);


CREATE TABLE customers_n (
  CustomerID NUMBER NOT NULL,
  CustomerName VARCHAR2(255),
  ContactName VARCHAR2(255),
  Address VARCHAR2(255),
  City VARCHAR2(255),
  PostalCode VARCHAR2(255),
  Country VARCHAR2(255)
);


CREATE TABLE employees_n (
  EmployeeID NUMBER NOT NULL,
  LastName   VARCHAR2(255),
  FirstName  VARCHAR2(255),
  BirthDate  DATE,
  Photo      VARCHAR2(255),
  Notes      CLOB,
  CONSTRAINT pk_employees PRIMARY KEY (EmployeeID)
);


CREATE TABLE orders_n (
  OrderID    NUMBER NOT NULL,
  CustomerID NUMBER DEFAULT NULL,
  EmployeeID NUMBER DEFAULT NULL,
  OrderDate  DATE DEFAULT NULL,
  ShipperID  NUMBER DEFAULT NULL
);



CREATE TABLE order_details_n (
    OrderDetailID NUMBER NOT NULL,
    OrderID NUMBER DEFAULT NUll,
    ProductID NUMBER DEFAULT NUll,
    Quantity NUMBER DEFAULT NUll
);


CREATE TABLE products_n (
  ProductID NUMBER NOT NULL,
  ProductName varchar(255) DEFAULT NULL,
  SupplierID NUMBER DEFAULT NULL,
  CategoryID NUMBER DEFAULT NULL,
  Unit varchar(255) DEFAULT NULL,
  Price float NULL
) ;



CREATE TABLE shippers_n (
  ShipperID NUMBER NOT NULL,
  ShipperName varchar(255) DEFAULT NULL,
  Phone varchar(255) DEFAULT NULL
);



CREATE TABLE suppliers_n (
  SupplierID NUMBER NOT NULL,
  SupplierName varchar(255) DEFAULT NULL,
  ContactName varchar(255) DEFAULT NULL,
  Address varchar(255) DEFAULT NULL,
  City varchar(255) DEFAULT NULL,
  PostalCode varchar(255) DEFAULT NULL,
  Country varchar(255) DEFAULT NULL,
  Phone varchar(255) DEFAULT NULL
);

