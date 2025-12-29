ALTER TABLE categories_n
  ADD PRIMARY KEY (CategoryID);


ALTER TABLE customers_n
  ADD PRIMARY KEY (CustomerID);


ALTER TABLE employees_n
  ADD PRIMARY KEY (EmployeeID);


ALTER TABLE orders_n
  ADD PRIMARY KEY (OrderID);

CREATE INDEX idx_CustomerID ON orders_n (CustomerID);
CREATE INDEX idx_EmployeeID ON orders_n (EmployeeID);
CREATE INDEX idx_ShipperID ON orders_n (ShipperID);
 -------------------------------------------------------
 
-- 1. Primary key əlavə et
ALTER TABLE order_details_n
ADD CONSTRAINT order_details_n_pk PRIMARY KEY (OrderDetailID);

SELECT OrderDetailID, COUNT(*)
FROM order_details_n
GROUP BY OrderDetailID
HAVING COUNT(*) > 1;
SELECT *
FROM order_details_n
WHERE OrderDetailID IS NULL;
DELETE FROM order_details_n a
WHERE ROWID > (
  SELECT MIN(ROWID)
  FROM order_details_n b
  WHERE a.OrderDetailID = b.OrderDetailID
);



-- 2. Index əlavə et OrderID üçün
CREATE INDEX idx_OrderID ON order_details_n(OrderID);

-- 3. Index əlavə et ProductID üçün
CREATE INDEX idx_ProductID ON order_details_n(ProductID);



-- 1. Primary key əlavə et
ALTER TABLE products_n
ADD CONSTRAINT products_n_pk PRIMARY KEY (ProductID);

-- 2. Index əlavə et CategoryID üçün
CREATE INDEX idx_CategoryID ON products_n (CategoryID);

-- 3. Index əlavə et SupplierID üçün
CREATE INDEX idx_SupplierID ON products_n (SupplierID);

 


ALTER TABLE shippers_n
  ADD PRIMARY KEY (ShipperID);


ALTER TABLE suppliers_n
  ADD PRIMARY KEY (SupplierID);

-- 1. CustomerID üçün foreign key
ALTER TABLE orders_n
ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY (CustomerID)
REFERENCES customers_n (CustomerID);

-- 2. EmployeeID üçün foreign key
ALTER TABLE orders_n
ADD CONSTRAINT orders_ibfk_2 FOREIGN KEY (EmployeeID)
REFERENCES employees_n (EmployeeID);

-- 3. ShipperID üçün foreign key
ALTER TABLE orders_n
ADD CONSTRAINT orders_ibfk_3 FOREIGN KEY (ShipperID)
REFERENCES shippers_n (ShipperID);


--
-- Constraints for table `order_details`
--
-- 1. OrderID üçün foreign key
ALTER TABLE order_details_n
ADD CONSTRAINT order_details_ibfk_1 FOREIGN KEY (OrderID)
REFERENCES orders_n (OrderID);

-- 2. ProductID üçün foreign key
ALTER TABLE order_details_n
ADD CONSTRAINT order_details_ibfk_2 FOREIGN KEY (ProductID)
REFERENCES products_n (ProductID);


--
-- Constraints for table `products`
--
-- 1. CategoryID üçün foreign key
ALTER TABLE products_n
ADD CONSTRAINT products_ibfk_1 FOREIGN KEY (CategoryID)
REFERENCES categories_n (CategoryID);

-- 2. SupplierID üçün foreign key
ALTER TABLE products_n
ADD CONSTRAINT products_ibfk_2 FOREIGN KEY (SupplierID)
REFERENCES suppliers_n (SupplierID);

