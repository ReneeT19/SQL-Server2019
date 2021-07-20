-- create a table
USE AUTOMODB
CREATE TABLE categories(
category_Id int PRIMARY KEY,
category_Name varchar(50) NOT NULL
);

CREATE TABLE brands(
brand_id int  IDENTITY(1,1) PRIMARY KEY,
brand_name varchar(50) NOT NULL
);

CREATE TABLE products(
product_id int IDENTITY(1,1) PRIMARY KEY,
product_name varchar(50) NOT NULL,
brand_id int NOT NULL,
category_id int NOT NULL, --foreign key as it's a primary key in the other table
model_year int NOT NULL,
list_price numeric(10,2) NOT NULL, --10 digits, 2 decimals
FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE,
FOREIGN KEY (brand_id) REFERENCES brands(brand_id) ON DELETE CASCADE -- on delete cascade is optional
);


-- drop a table
DROP TABLE products --drop foreign key table first and then primary key table
DROP TABLE categories
DROP TABLE BRANDS
DROP TABLE customers


-- alter table
ALTER TABLE products
ADD pro_description varchar(50) NULL  --add a new column to the table

ALTER TABLE products
ALTER COLUMN product_name varchar(100) NOT NULL  -- alter a column, you can change the type before adding data

ALTER TABLE products
DROP COLUMN pro_description --delete column

--- check constraint
CREATE TABLE customers(
customer_id int IDENTITY(100,1) PRIMARY KEY,
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NULL,
name as(first_name+' '+last_name),
email varchar(100) UNIQUE,   -- unique key can't connect to another table
zipcode int CHECK(zipcode>0) NOT NULL
);

-- auto compute
CREATE TABLE order_details(
order_id int NOT NULL,
product_id int NOT NULL,
price numeric(10,2) NOT NULL,
qty int NOT NULL,
total as (price*qty)
);
