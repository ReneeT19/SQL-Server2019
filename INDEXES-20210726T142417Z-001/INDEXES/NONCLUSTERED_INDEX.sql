-----CREATE NON CLUSTERED INDEX---
SELECT * FROM customers WHERE customer_id=2
SELECT * FROM customers WHERE city='Redondo Beach'

CREATE INDEX CUSTOMERS_CITY
ON CUSTOMERS(CITY)