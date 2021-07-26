----CREATE VIEW----
CREATE VIEW ORDER_DETAILS_WITH_CUSTOMERS_INFO
AS
SELECT C.customer_id,C.first_name,C.last_name,O.order_id,O.order_date,I.product_id,I.quantity,I.list_price FROM customers C INNER JOIN
orders O ON C.customer_id=O.customer_id INNER JOIN
order_items I ON O.order_id=I.order_id
-----ALTER VIEW------
ALTER VIEW ORDER_DETAILS_WITH_CUSTOMERS_INFO
AS
SELECT C.customer_id,C.first_name,C.last_name,O.order_id,O.order_date,I.product_id,I.quantity,I.list_price FROM customers C INNER JOIN
orders O ON C.customer_id=O.customer_id INNER JOIN
order_items I ON O.order_id=I.order_id