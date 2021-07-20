USE POS
-- DDL --- (create, drop, alter, truncate)

CREATE TABLE products(
proid int PRIMARY KEY,
proname varchar(50) NOT NULL,
category varchar(50) NOT NULL,
mrp numeric(10,2) CHECK(mrp>0)
);
SELECT * FROM products

CREATE TABLE customerInfo(
custid int IDENTITY(1,1) PRIMARY KEY,
custname varchar(50) NOT NULL,
email varchar(100) UNIQUE NOT NULL,
zipcode int NOT NULL,
country varchar(50) NOT NULL
);
SELECT * FROM customerInfo

CREATE TABLE orderInfo(
orderid int IDENTITY(1,1) PRIMARY KEY,
orderdate datetime NOT NULL,
custid int NOT NULL,
totalamt numeric(10,2) NOT NULL,
FOREIGN KEY (custid) REFERENCES customerInfo (custid) ON DELETE CASCADE
);
SELECT * FROM orderInfo

CREATE TABLE orderDetails(
orderid int NOT NULL,
proid int NOT NULL,
qty int NOT NULL,
price numeric(10,2) NOT NULL,
proamt as (price*qty),
FOREIGN KEY (orderid) REFERENCES orderInfo (orderid) ON DELETE CASCADE,
FOREIGN KEY (proid) REFERENCES products (proid) ON DELETE CASCADE
);
SELECT * FROM orderDetails

DROP TABLE orderDetails
DROP TABLE orderInfo
DROP TABLE products
DROP TABLE customerInfo

ALTER TABLE products
ALTER COLUMN proname varchar(100) NOT NULL
ALTER TABLE products
ADD prodes varchar(50) NOT NULL

TRUNCATE TABLE customerInfo

-- DML --- (insert,update,delete)
INSERT INTO products(proname,category,mrp) VALUES 
('a','xxx',20.5),
('b','yyy',50),
('c','zzz',120.8)
SELECT * FROM products

INSERT INTO customerInfo(custname,email,zipcode,country) VALUES 
('abc','a@a.com',10001,'US'),
('def','c@c.com',10003,'UK'),
('ggg','z@z.com',10007,'Japan')
SELECT * FROM customerInfo

INSERT INTO orderInfo(orderdate,totalamt) VALUES 
('12/20/2020',30),
('12/22/2020',37),
('12/27/2020',29)
SELECT * FROM orderInfo

INSERT INTO orderDetails(qty,price) VALUES 
(10,30),
(45,10),
(5,50)
SELECT * FROM orderDetails

DELETE FROM customerInfo WHERE custid=2

UPDATE products SET category='mm', mrp=78 WHERE proid=1