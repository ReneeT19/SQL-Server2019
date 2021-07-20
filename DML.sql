--insert DML
USE AUTOMODB

INSERT INTO categories VALUES(10, 'commercial vehicle')
SELECT * FROM categories

INSERT INTO customers(first_name,last_name,email,zipcode) VALUES 
('adam','jones','a@k.com',12345),
('adam','bbb','a@b.com',12345),
('aaa','jones','a@c.com',12345)
SELECT * FROM customers

--DELETE
DELETE FROM customers
TRUNCATE TABLE customers

DELETE FROM customers WHERE customer_id = 103
DELETE FROM customers WHERE first_name='adam' and last_name='jones'

--UPDATE
UPDATE customers SET email='a@vv.com', zipcode=10001 WHERE customer_id=107