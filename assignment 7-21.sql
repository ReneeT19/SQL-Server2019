
SELECT*FROM customers
SELECT*FROM products
SELECT*FROM categories
INSERT INTO customers(first_name,last_name,email,zipcode) VALUES
('mary','smith','r@fdas.com',39532),
('jim','dori','asdf@vd.com',49146),
('hellen','kary','a@e2as.com',09375),
('kity','ben','io@afd.com',89444),
('kity','ben','io@afzd.com',89444)

INSERT INTO products(product_name,model_year,list_price,pro_description) VALUES
('abcd',2013,600,'good'),
('mmfe',2021,300,'good'),
('pled',2003,560,'good'),
('ffea',2009,100,'bad'),
('zfev',2009,100,'bad')

ALTER TABLE products
ADD pro_description varchar(50)

INSERT INTO categories(category_Name) VALUES
('phone'),
('computers')


DROP TABLE customers
DROP TABLE products

-- Write a query to display customer list by the first name in descending order.
SELECT first_name,last_name,email,zipcode FROM customers ORDER BY first_name DESC

-- Write a query to display  the first name, last name, and city of the customers. 
-- It sorts the customer list by the city first and then by the first name.
SELECT first_name,last_name,email,zipcode FROM customers ORDER BY email,first_name

-- Write a query  to returns the top three most expensive products.
SELECT TOP 3 * FROM products ORDER BY LIST_PRICE DESC

-- Write a query to finds the products whose list price is greater than 300 and model year is 2018.
SELECT * FROM products WHERE list_price>300 AND MODEL_YEAR=2013

-- Write a query to finds products whose list price is greater than 3,000 or model year is 2018. 
-- Any product that meets one of these conditions is included in the result set.
SELECT * FROM products WHERE list_price>300 OR MODEL_YEAR=2013

-- Write a query  to find the products whose list prices are between 1,899 and 1,999.99.
SELECT * FROM PRODUCTS WHERE LIST_PRICE BETWEEN 200 AND 700 ORDER BY LIST_PRICE

-- Write a query uses the IN operator to find products whose list price is 299.99 or 466.99 or 489.99.
SELECT * FROM PRODUCTS WHERE LIST_PRICE IN(300,560,600)ORDER BY LIST_PRICE

-- Write a query to  the customers where the first character in the last name is the letter in the range A through C:
SELECT * FROM CUSTOMERS WHERE LAST_NAME LIKE 'D%I' ORDER BY FIRST_NAME

-- Write a query using  NOT LIKE operator to find customers where the first character in the first name is not the letter A:
SELECT * FROM CUSTOMERS WHERE LAST_NAME NOT LIKE 'S%' ORDER BY FIRST_NAME

-- Write a query to find the distinct phone numbers of the customers.
SELECT DISTINCT model_year FROM products ORDER BY model_year

-- Write a query to find products whose list price is greater than 3000 or model is 2018.
SELECT * FROM products WHERE list_price>300 AND MODEL_YEAR=2013

-- Write a query to find products whose name contains the string Cruiser.
SELECT * FROM products WHERE product_name LIKE '%fe%' ORDER BY product_name

-- Write a query to find the products whose list price is one of the following values: 89.99, 109.99, and 159.99
SELECT * FROM PRODUCTS WHERE LIST_PRICE IN(300,560,600)ORDER BY LIST_PRICE

-- Write a query to  display full_name by merging first_name and last_name  columns.
SELECT product_id, CONCAT(product_name, ' ', pro_description) AS full_info FROM products

-- Write  a query to fetch records from products table and categories table on the basis of category_id using INNER JOIN.
SELECT * FROM products P INNER JOIN categories C ON P.category_id = C.category_id

-- Write a query to fetch records from staff table and orders table on the basis of staff_id using LEFT JOIN
SELECT * FROM products P LEFT JOIN categories C ON P.category_id=C.category_id