USE AUTOMODB
-- DDL --- (create, drop, alter, truncate)
CREATE TABLE customers(
customer_id int IDENTITY(100,1) PRIMARY KEY,
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NULL,
phone int NOT NULL,
email varchar(100) UNIQUE,   -- unique key can't connect to another table
street varchar(100) NOT NULL,
city varchar(50) NOT NULL,
state varchar(2) NOT NULL,
zipcode int CHECK(zipcode>0) NOT NULL
);

CREATE TABLE orders(
order_id int IDENTITY(1,1) PRIMARY KEY,
customer_id int,
order_status int NOT NULL,
order_date DATE NOT NULL,
required_date DATE NOT NULL,
shipped_date DATE NOT NULL,
store_id int,
staff_id int,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (store_id) REFERENCES stores(store_id),
FOREIGN KEY (staff_id) REFERENCES staffs(staff_id)
);

CREATE TABLE stores(
store_id int IDENTITY(1,1) PRIMARY KEY,
store_name varchar(50) NOT NULL,
phone int NOT NULL,
email varchar(100) UNIQUE,   -- unique key can't connect to another table
street varchar(100) NOT NULL,
city varchar(50) NOT NULL,
state varchar(2) NOT NULL,
zipcode int CHECK(zipcode>0) NOT NULL
);

CREATE TABLE staffs(
staff_id int IDENTITY(1,1) PRIMARY KEY,
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NULL,
email varchar(50) UNIQUE,
phone int NOT NULL,
active varchar(10) NOT NULL,
store_id int,
manager_id int NOT NULL
FOREIGN KEY (store_id) REFERENCES STORES(store_id)
);

CREATE TABLE order_items(
item_id int IDENTITY(1,1) PRIMARY KEY,
order_id int,
product_id int,
quantity int NOT NULL,
list_price int NOT NULL,
discount int NOT NULL,
FOREIGN KEY (order_id) REFERENCES ORDERS (order_id),
FOREIGN KEY (product_id) REFERENCES PRODUCTS (product_id)
);

DROP TABLE order_items
DROP TABLE orders
DROP TABLE customers
DROP TABLE staffs
DROP TABLE stores



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

INSERT INTO categories(category_name) VALUES 
('abcg'),
('bfrd'),
('jyrm'),
('fesd'),
('abcz')
SELECT*FROM categories

INSERT INTO brands(brand_name) VALUES 
('lenovo'),
('apple'),
('ibm'),
('ausus'),
('microsoft')
SELECT*FROM brands

INSERT INTO products(product_name,brand_id,category_id,model_year,list_price) VALUES
('computer',1,1,'1989',350),
('phone',2,2,'1989',500),
('tablet',3,3,'2004',679),
('headset',4,4,'2012',2000),
('laptop',5,5,'2020',1250)
SELECT*FROM products

INSERT INTO stocks(product_id,quantity) VALUES 
(1,20),
(2,13),
(3,4),
(4,80),
(5,240)
SELECT*FROM stocks

INSERT INTO customers VALUES
('mary','jones',1234567890,'a@a.com','sesame street','Raleigh','NC',20098),
('john','smith',1234517890,'b@b.com','231 sesame street','Ashville','NC',21098),
('katy','ben',1234568890,'c@c.com','flower street','Charlotte','NC',20096),
('min','zhong',1234561190,'d@d.com','33 walnut street','Richmond','VA',20092),
('lily','stacy',1234522890,'e@e.com','sesame street','Columbia','SC',24098)
SELECT*FROM customers

INSERT INTO stores VALUES
('aa',345,'dd@vfd.com','sesame street','Raleigh','NC',20098),
('bb',111,'ddg@vfd.com','20 sesame street','Raleigh','NC',20098),
('cc',009,'ddb@vfd.com','333 sesame street','Raleigh','NC',20098),
('dd',565,'ddz@vfd.com','66 sesame street','Raleigh','NC',20098),
('ee',333,'ddq@vfd.com','70 sesame street','Raleigh','NC',20098)
SELECT*FROM stores

INSERT INTO staffs VALUES
('marylou','J','a@ad.com',1234567811,'yes',1,100),
('kelly','M','b@bd.com',1234517822,'no',2,101),
('benjamin','L','c@cd.com',1234568833,'yes',3,102),
('tommy','J','d@dd.com',1234561144,'no',4,103),
('lucy','T','e@ed.com',1234522855,'no',5,104)
SELECT*FROM staffs

INSERT INTO orders VALUES 
(100,0,'2016-2-3','2016-6-3','2016-7-12',1,1),
(101,1,'2016-1-3','2019-8-3','2019-7-20',2,2),
(102,1,'2016-4-3','2018-6-3','2019-8-3',3,3),
(103,0,'2016-5-3','2017-6-3','2018-2-3',4,4),
(104,0,'2016-7-3','2019-5-3','2020-6-3',5,5)
SELECT*FROM orders

INSERT INTO order_items VALUES
(1,1,30,500,20),
(2,2,30,200,10),
(3,3,30,490,60),
(4,4,30,100,30),
(5,5,30,50,50)
SELECT*FROM order_items



-------------------------------------------------------
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

INSERT INTO orders VALUES
(2,'2016-2-3','2016-6-3','2016-7-3',101),
(5,'2011-5-3','2016-6-3','2016-4-19',102),
(9,'2013-2-3','2016-2-3','2019-7-20',103)
SELECT *FROM ORDERS

ALTER TABLE orders
ADD CONSTRAINT FK_orders_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id);


DELETE FROM customerInfo WHERE custid=2

UPDATE products SET category='mm', mrp=78 WHERE proid=1