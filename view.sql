--- VIEWS ---
CREATE VIEW product_info
AS
SELECT product_name,brand_name,list_price FROM products P INNER JOIN
brands B ON P.brand_id = B.brand_id

CREATE VIEW order_details_with_customer_info
AS
SELECT C.customer_id, C.first_name,C.last_name,O.order_id,O.order_date,I.product_id,I.quantity,I.list_price FROM customers C  INNER JOIN
orders O ON C.customer_id = O.customer_id INNER JOIN
order_items I ON O.order_id = I.order_id

--- CALL VIEWS ---
SELECT * FROM product_info
SELECT * FROM product_info WHERE brand_name = 'apple'
SELECT * FROM product_info WHERE brand_name = 'apple' ORDER BY list_price

SELECT * FROM order_details_with_customer_info WHERE customer_id = 100

--- DROP VIEWS ---
DROP VIEW product_info

--- ALTER VIEWS ---


--- CALL SYS VIEWS ---
SELECT name, database_id, create_date FROM SYS.DATABASES
