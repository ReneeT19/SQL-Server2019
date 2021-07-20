---HOW TO CREATE TABLE
CREATE TABLE categories(
category_id		int PRIMARY KEY,
category_name	varchar(50) NOT NULL
);

CREATE TABLE brands(
brand_id	int PRIMARY KEY,
brand_name	varchar(50)NOT NULL
);

CREATE TABLE products(
product_id		int IDENTITY(1,1) PRIMARY KEY,
product_name	varchar(50) NOT NULL,
brand_id		int	NOT NULL,
category_id		int NOT NULL,
model_year		int NOT NULL,
list_price		numeric(10,2)NOT NULL,
FOREIGN KEY(category_id) REFERENCES categories(category_id)ON DELETE CASCADE,
FOREIGN KEY(brand_id)	REFERENCES	brands(brand_id) ON DELETE CASCADE	
);


---HOW TO DROP TABLE
DROP TABLE products
DROP TABLE CATEGORIES

---ALTER TABLE
ALTER TABLE products
ADD pro_description varchar(50) NULL

ALTER TABLE products
ALTER COLUMN product_name varchar(100) NOT NULL

ALTER TABLE products
DROP COLUMN pro_description

---CHECK CONSTRAINT---
CREATE TABLE customers(
customer_id int IDENTITY(100,1) PRIMARY KEY,
first_name	varchar(50) NOT NULL,
last_name	varchar(50) NULL,
name		as (first_name+' '+last_name),
email		varchar(100) UNIQUE,
zipcode		int	CHECK(zipcode>0) NOT NULL
);
---AUTO COMPUTE
CREATE TABLE order_details(
order_id	int NOT NULL,
product_id	int	NOT NULL,
price		numeric(10,2) NOT NULL,
qty			int	NOT NULL,
total		as (price*qty)
);