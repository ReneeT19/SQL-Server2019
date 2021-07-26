USE POS
-- TRIGGERS --
-- CREATE TABLE TO STORE LOGS --
CREATE TABLE PRODUCTS_AUDITS(
change_id int IDENTITY PRIMARY KEY,
product_id int NOT NULL,
product_name VARCHAR(200) NOT NULL,
brand_id int NOT NULL,
category_id int NOT NULL,
model_year smallint not null,
list_price decimal(10,2) not null,
updated_at DATETIME NOT NULL,
operation char(3) NOT NULL,
CHECK(operation='INS' or operation = 'DEL')
);

DROP TABLE PRODUCTS_AUDITS

-- CREATE TRIGGER --
CREATE TRIGGER TRG_PRODUCT_AUDIT
ON products
AFTER INSERT, DELETE
AS 
BEGIN
INSERT INTO PRODUCTS_AUDITS(product_id,product_name,brand_id,category_id,model_year,list_price,updated_at,operation)
SELECT I.product_id,I.product_name,I.brand_id,I.category_id,I.model_year,I.list_price,GETDATE(),'INS' FROM INSERTED I
UNION ALL
SELECT D.product_id,D.product_name,D.brand_id,D.category_id,D.model_year,D.list_price,GETDATE(),'DEL' FROM DELETED D
END

DROP TRIGGER TRG_PRODUCT_AUDIT


-- TEST TRIGGER--
INSERT INTO PRODUCTS(product_name,brand_id,category_id,model_year,list_price)
VALUES('PRODUCTS33',2,2,2020,700.00)

SELECT*FROM PRODUCTS_AUDITS
DELETE FROM PRODUCTS WHERE product_id = 325

-- TRIGGERS --
-- CREATE TABLE TO STORE LOGS --
CREATE TABLE CUSTOMER_AUDITS(
change_id int IDENTITY PRIMARY KEY,
customer_id int NOT NULL,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
phone VARCHAR(25) NOT NULL,
email VARCHAR(255) NOT NULL,
street VARCHAR(255) NULL,
city VARCHAR(50) NULL,
state VARCHAR(25) NULL,
zip_code VARCHAR(5) NULL,
updated_at DATETIME,
operation VARCHAR(10)
);

DROP TABLE CUSTOMER_AUDITS

--CREATE TRIGGER--
CREATE TRIGGER TRG_CUSTOMER_AUDIT
ON customers
AFTER INSERT, DELETE
AS 
BEGIN
INSERT INTO CUSTOMER_AUDITS(customer_id,first_name,last_name,phone,email,street,city,state,zip_code,updated_at,operation)
SELECT I.customer_id,I.first_name,I.last_name,I.phone,I.email,I.street,I.city,I.state,I.zip_code,GETDATE(),'INS' FROM INSERTED I
UNION ALL
SELECT D.customer_id,D.first_name,D.last_name,D.phone,D.email,D.street,D.city,D.state,D.zip_code,GETDATE(),'DEL' FROM DELETED D
END

--TEST TRIGGER--
INSERT INTO CUSTOMERS(first_name,last_name,phone,email,street,city,state,zip_code)
VALUES('test','test','123445321','a@fdadsfe.com','edd','da','sc','12345')

SELECT * FROM CUSTOMER_AUDITS
DELETE FROM CUSTOMERS WHERE customer_id = 1480




--ASSIGNMENT--

-- TRIGGERS --
-- CREATE TABLE TO STORE LOGS --
CREATE TABLE STORE_AUDITS(
change_id int IDENTITY PRIMARY KEY,
store_id int NOT NULL,
store_name VARCHAR(255) NOT NULL,
phone VARCHAR(25) NOT NULL,
email VARCHAR(255) NOT NULL,
street VARCHAR(255) NULL,
city VARCHAR(255) NULL,
state VARCHAR(10) NULL,
zip_code VARCHAR(5) NULL,
updated_at DATETIME NOT NULL,
operation VARCHAR(10) NOT NULL
);

SELECT*FROM STORES

-- CREATE TRIGGER --
CREATE TRIGGER TRG_STORE_AUDIT
ON stores
AFTER INSERT, DELETE
AS 
BEGIN
INSERT INTO STORE_AUDITS(store_id,store_name,phone,email,street,city,state,zip_code,updated_at,operation)
SELECT I.store_id,I.store_name,I.phone,I.email,I.street,I.city,I.state,I.zip_code,GETDATE(),'INS' FROM INSERTED I
UNION ALL
SELECT D.store_id,D.store_name,D.phone,D.email,D.street,D.city,D.state,D.zip_code,GETDATE(),'DEL' FROM DELETED D
END


-- TEST TRIGGER--
INSERT INTO stores(store_name,phone,email,street,city,state,zip_code)
VALUES('test store','1234567890','abc@aaddd.com','sesame street','raleigh','sc','10020')

SELECT*FROM STORE_AUDITS
DELETE FROM stores WHERE store_id = 4